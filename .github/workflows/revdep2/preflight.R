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
promised <- unique(unlist(
  lapply(plan$prebuilt$runs %||% list(), function(d) {
    unlist(d$packages, use.names = FALSE)
  }),
  use.names = FALSE
))
restored <- restore_prebuilt(plan, lib, install_union)
inform(
  "Preflight: ",
  length(restored),
  " of the ",
  length(intersect(promised, install_union)),
  " package(s) the plan expected were restored from earlier runs"
)

# With a restored library, `upgrade = FALSE` would freeze whatever version the
# donor happened to hold; the plan's dependency fingerprints are computed from
# CRAN *now*, so the library has to follow CRAN now.
upgrade <- length(restored) > 0

# This one call is the whole job, and the place it has died: pak resolves
# every one of these refs before it installs anything, and the resolution of a
# few thousand is where a run that is killed rather than failed gets killed.
# So say what it is about to attempt, and how long it took to either finish or
# die -- the workflow's resource sampler supplies the other half of that
# picture, a memory curve on the same clock.
inform(
  "Preflight: installing ",
  length(install_union),
  " packages (",
  length(missing_from(lib, install_union)),
  " not in the library yet), upgrade = ",
  upgrade
)
install_started <- Sys.time()
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
inform(sprintf(
  "Preflight: the bulk install %s after %.1f min",
  if (installed_ok) "finished" else "failed",
  as.numeric(difftime(Sys.time(), install_started, units = "mins"))
))
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
load_batch <- function(pkgs) {
  script <- tempfile(fileext = ".R")
  writeLines(
    c(
      sprintf(".libPaths(c(%s, .libPaths()))", deparse(lib)),
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
