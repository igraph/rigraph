# Prove the dependency world installs before any shard spends a minute on
# checks: install the union of every dependency any revdep needs into a
# scratch library -- which downloads every binary exactly once into the pak
# cache the workflow then saves for the shards -- and load-test each installed
# package. Broken or uninstallable dependencies surface here, in depfail.json
# and the job summary.
#
# A dependency failure is a report, not a stop: shards attempt their own
# subset regardless (their repository snapshot may succeed where this one
# failed), and a revdep whose dependencies genuinely cannot be installed fails
# its own check with an install log, which is the result a report can work
# with.
#
# The library this job ends up with is also the run's contribution to the next
# one: it is packed into the revdep2-lib artifact, which later runs unpack
# instead of building the same packages again (see util.R).
#
# Environment variables:
#   PLAN       - plan.json from plan.R (default: plan.json)
#   OUT_DIR    - where depfail.json lands (default: preflight)
#   LIB_OUT    - where library.tar and lib.json land; empty skips packing
#   LIB_INDEX_OUT - where a copy of lib.json alone lands, for the small
#                   artifact a later plan reads without the tar

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

plan <- read_json(env_chr("PLAN", "plan.json"))
out_dir <- env_chr("OUT_DIR", "preflight")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
install_union <- unlist(plan$install_union, use.names = FALSE)

lib <- file.path(env_chr("RUNNER_TEMP", tempdir()), "revdep2-preflight-lib")
dir.create(lib, recursive = TRUE, showWarnings = FALSE)
failures <- list()

# What earlier runs already built, unpacked before pak sees the library. pak
# still resolves the whole union afterwards -- CRAN moves between runs, and a
# package whose version changed has to be built after all -- but everything
# unchanged is now already there, and is skipped.
restored <- restore_prebuilt(plan, lib, install_union)
inform(
  "Preflight: ",
  length(restored),
  " package(s) restored from earlier runs"
)

# With a restored library, `upgrade = FALSE` would freeze whatever version the
# donor happened to hold; the plan's dependency fingerprints are computed from
# CRAN *now*, so the library has to follow CRAN now.
upgrade <- length(restored) > 0

inform("Preflight: installing ", length(install_union), " packages")
installed_ok <- tryCatch(
  {
    pak::pkg_install(install_union, lib = lib, ask = FALSE, upgrade = upgrade)
    TRUE
  },
  error = function(e) {
    inform("Bulk install failed: ", conditionMessage(e))
    FALSE
  }
)
if (!installed_ok) {
  # One bad package must not hide the state of the other thousand: retry each
  # missing package on its own and record exactly which ones will not install.
  for (p in install_union) {
    if (dir.exists(file.path(lib, p))) {
      next
    }
    result <- tryCatch(
      {
        pak::pkg_install(p, lib = lib, ask = FALSE, upgrade = upgrade)
        NULL
      },
      error = function(e) conditionMessage(e)
    )
    if (!is.null(result)) {
      failures[[length(failures) + 1]] <- list(
        package = p,
        phase = "install",
        message = result
      )
    }
  }
}

# Load every installed dependency, in chunks small enough to stay clear of the
# DLL limit; a failing chunk is retried one package at a time so a single bad
# namespace names itself.
installed <- intersect(install_union, rownames(utils::installed.packages(lib)))
inform("Preflight: loading ", length(installed), " packages")
load_batch <- function(pkgs, libs = lib) {
  script <- tempfile(fileext = ".R")
  writeLines(
    c(
      sprintf(".libPaths(c(%s, .libPaths()))", deparse(libs)),
      "for (p in commandArgs(trailingOnly = TRUE)) {",
      "  loadNamespace(p)",
      "  writeLines(paste0('LOADED ', p))",
      "}"
    ),
    script
  )
  out <- suppressWarnings(system2(
    "Rscript",
    # Quoted: system2() quotes the command, but not the arguments.
    shQuote(c("--vanilla", script, pkgs)),
    stdout = TRUE,
    stderr = TRUE
  ))
  loaded <- sub("^LOADED ", "", grep("^LOADED ", out, value = TRUE))
  list(failed = setdiff(pkgs, loaded), log = out)
}
load_failures <- list()
chunks <- split(installed, ceiling(seq_along(installed) / 40))
for (chunk in chunks) {
  first <- load_batch(chunk)
  if (length(first$failed) == 0) {
    next
  }
  for (p in first$failed) {
    single <- load_batch(p)
    if (length(single$failed) > 0) {
      load_failures[[p]] <- paste(
        utils::tail(sanitize_log(single$log), 20),
        collapse = "\n"
      )
    }
  }
}

# A restored package that will not load is a stale binary, not a broken
# package: the runner image moved under it. Throw it away, let pak build it
# from source, and judge it on the second attempt -- this is the one failure
# mode reuse introduces, and it is cheap to undo.
stale <- intersect(names(load_failures), restored)
if (length(stale) > 0) {
  inform(
    "Preflight: rebuilding ",
    length(stale),
    " restored package(s) that would not load"
  )
  unlink(file.path(lib, stale), recursive = TRUE)
  for (p in stale) {
    tryCatch(
      pak::pkg_install(p, lib = lib, ask = FALSE, upgrade = FALSE),
      error = function(e) {
        inform("Could not reinstall ", p, ": ", conditionMessage(e))
      }
    )
  }
  for (p in stale) {
    retried <- load_batch(p)
    if (length(retried$failed) == 0) {
      load_failures[[p]] <- NULL
    } else {
      load_failures[[p]] <- paste(
        utils::tail(sanitize_log(retried$log), 20),
        collapse = "\n"
      )
    }
  }
}
for (p in names(load_failures)) {
  failures[[length(failures) + 1]] <- list(
    package = p,
    phase = "load",
    message = load_failures[[p]]
  )
}

# ------------------------------------------------------------- r-universe --

# The second half of "preload everything": where the plan resolved packages to
# r-universe, their dev builds are installed too, into a library of their own,
# and packed beside the CRAN one. Two libraries rather than one because they
# hold the same package names at different versions -- the shards install the
# CRAN union first and lay these over it, so the dev build is what a check
# sees, and neither has to be built again.
runiverse_lib <- file.path(
  env_chr("RUNNER_TEMP", tempdir()),
  "revdep2-preflight-lib-runiverse"
)
runiverse_sources <- plan$r_universe$sources %||% list()
runiverse_packed <- character()
if (length(runiverse_sources) > 0) {
  inform(
    "Preflight: installing ",
    length(runiverse_sources),
    " r-universe build(s)"
  )
  runiverse_install(
    runiverse_sources,
    runiverse_lib,
    env_chr("REVDEP2_UNIVERSE_DISTRO", "resolute")
  )
  # Load-tested with the dev build first on the path, which is the order a
  # shard will see it in.
  for (p in list.dirs(runiverse_lib, full.names = FALSE, recursive = FALSE)) {
    loaded <- load_batch(p, libs = c(runiverse_lib, lib))
    if (length(loaded$failed) > 0) {
      failures[[length(failures) + 1]] <- list(
        package = p,
        phase = "load",
        message = paste(
          utils::tail(sanitize_log(loaded$log), 20),
          collapse = "\n"
        )
      )
    }
  }
}

write_json(failures, file.path(out_dir, "depfail.json"))

# ------------------------------------------------------------------ library --

lib_out <- env_chr("LIB_OUT")
index_out <- env_chr("LIB_INDEX_OUT")
packed <- character()
if (nzchar(lib_out)) {
  packed <- pack_library(
    lib,
    lib_out,
    if (nzchar(index_out)) index_out else NULL
  )
  inform("Preflight: published ", length(packed), " package(s) for later runs")
  if (length(runiverse_sources) > 0) {
    runiverse_packed <- pack_library(
      runiverse_lib,
      lib_out,
      if (nzchar(index_out)) index_out else NULL,
      name = "library-runiverse"
    )
    inform(
      "Preflight: published ",
      length(runiverse_packed),
      " r-universe build(s) for the shards"
    )
  }
}

append_summary(c(
  "## revdep2 preflight",
  "",
  sprintf(
    "Installed and loaded %d dependencies: %d could not be installed or loaded.",
    length(install_union), length(failures)
  ),
  "",
  sprintf(
    "%d package(s) came prebuilt from earlier runs%s; %d are published for the next one.",
    length(restored),
    if (length(stale) > 0) sprintf(" (%d rebuilt after failing to load)", length(stale)) else "",
    length(packed)
  ),
  ""
))
if (length(failures) > 0) {
  df <- data.frame(
    Package = vapply(failures, function(f) f$package, character(1)),
    Phase = vapply(failures, function(f) f$phase, character(1))
  )
  append_summary(md_table(df))
  for (f in failures) {
    append_summary(md_details(
      sprintf("<code>%s</code> &mdash; %s failure", f$package, f$phase),
      strsplit(f$message, "\n")[[1]]
    ))
  }
  inform(length(failures), " dependencies failed preflight; see depfail.json")
}
