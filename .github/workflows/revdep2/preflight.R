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
#
# Nothing here waits without a clock: REVDEP2_INSTALL_TIMEOUT_MINUTES bounds
# one pak call, REVDEP2_LOAD_TIMEOUT_MINUTES one load-test batch, and
# REVDEP2_INSTALL_DEADLINE_MINUTES the installs together -- see the README's
# "Nothing waits for ever".

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

# This install is the whole job, and the place it has died: handed the whole
# universe at once, pak resolves every one of those refs before it installs
# any of them, and the resolution of a few thousand is where a run that is
# killed rather than failed gets killed. So it goes in dependency order, a
# hundred at a time (see install_chunks() in util.R), which keeps every
# resolution small and turns a fatal ten minutes of silence into a chunk
# counter -- the workflow's resource sampler supplies the other half of that
# picture, a memory curve on the same clock.
chunk_size <- env_num("REVDEP2_INSTALL_CHUNK", 100)
# Past this, no further chunk is started. The job's own `timeout-minutes` is
# 300 and cancels everything; this stops earlier and on purpose, so that the
# packages that did install are still load-tested, packed and published
# instead of dying with the job.
install_deadline <- Sys.time() +
  env_num("REVDEP2_INSTALL_DEADLINE_MINUTES", 210) * 60
# And a deadline for the whole job, because stopping the *installs* early only
# helps if what follows them is bounded too. After `install_deadline` come the
# sysreqs survey, some seventy load batches at up to `REVDEP2_LOAD_TIMEOUT_
# MINUTES` each, a per-package retry of every failure, and a rebuild loop of
# up to `REVDEP2_INSTALL_TIMEOUT_MINUTES` per stale binary -- whose worst case
# is far past the job's own `timeout-minutes: 300`. Reaching that means the
# library is never packed and `revdep2-lib` is never uploaded, so every shard
# rebuilds from scratch: the one outcome this job exists to prevent.
job_deadline <- Sys.time() +
  env_num("REVDEP2_JOB_DEADLINE_MINUTES", 270) * 60
out_of_time <- function(what) {
  if (Sys.time() <= job_deadline) {
    return(FALSE)
  }
  inform(
    "Past the job deadline; ",
    what,
    " stops here so the library is packed"
  )
  TRUE
}
chunks <- install_chunks(install_union, cran_db(), chunk_size)
inform(
  "Preflight: installing ",
  length(install_union),
  " packages (",
  length(missing_from(lib, install_union)),
  " not in the library yet) in ",
  length(chunks),
  " chunk(s) of at most ",
  chunk_size,
  ", dependencies first; upgrade = ",
  upgrade
)
# Before the first install, not after the first failure: a poisoned metadata
# database is inherited through the pak cache the workflow restores, so the
# job can start with one. Asking pak what it can see costs seconds and is the
# difference between one bad job and a run where every shard installs nothing.
metadata <- ensure_metadata("Preflight")
if (identical(metadata, "broken")) {
  stop(
    "pak cannot see the packages that must exist, before or after rebuilding ",
    "its metadata database. Installing anything now would fail package by ",
    "package for hours and publish a cache that fails every shard the same ",
    "way.",
    call. = FALSE
  )
}

install_started <- Sys.time()
installed_ok <- install_in_chunks(
  chunks,
  lib,
  upgrade,
  "Preflight",
  deadline = install_deadline
)
inform(sprintf(
  "Preflight: the install %s after %.1f min; %d of %d packages are in the library",
  if (installed_ok) "finished" else "failed",
  as.numeric(difftime(Sys.time(), install_started, units = "mins")),
  length(install_union) - length(missing_from(lib, install_union)),
  length(install_union)
))
if (!installed_ok) {
  # One bad package must not hide the state of the other thousand: retry each
  # missing package on its own and record exactly which ones will not install.
  # Bounded twice over -- one package may not hang the retry, and the retry as
  # a whole may not eat the minutes the load test and the library packing still
  # need. What the deadline cuts off is named rather than reported as failing.
  retry <- missing_from(lib, install_union)
  inform("Preflight: retrying ", length(retry), " package(s) one at a time")
  for (i in seq_along(retry)) {
    if (Sys.time() > install_deadline) {
      inform(sprintf(
        "Preflight: the install deadline passed; %d of %d package(s) not retried",
        length(retry) - i + 1L,
        length(retry)
      ))
      break
    }
    run <- pak_install(
      retry[[i]],
      lib = lib,
      upgrade = upgrade,
      timeout_seconds = install_timeout_seconds(),
      label = paste("Preflight: installing", retry[[i]])
    )
    if (!run$ok) {
      failures[[length(failures) + 1]] <- list(
        package = retry[[i]],
        phase = "install",
        message = run$message
      )
    }
  }
}

# Before the load test, because a restored package whose system library is
# absent fails to load for a reason that has nothing to do with the package:
# without this it would be judged stale and rebuilt from source, and fail
# again the same way.
ensure_sysreqs(lib, "Preflight")

# Load every installed dependency, in chunks small enough to stay clear of the
# DLL limit; a failing chunk is retried one package at a time so a single bad
# namespace names itself.
installed <- intersect(install_union, rownames(utils::installed.packages(lib)))
inform("Preflight: loading ", length(installed), " packages")

# Bounded, because `loadNamespace()` is not a thing that necessarily returns:
# a package whose .onLoad waits on a lock, a port or a display hangs the child
# for ever, and this used to wait for it with no clock -- the same unbounded
# wait that cost run 31276552027 its preflight, one call further on. A batch
# that runs out of time is retried package by package, which is already how a
# failing batch names its culprit; a single package that then times out is a
# load failure like any other, with "timed out" as its reason.
load_timeout_sec <- env_num("REVDEP2_LOAD_TIMEOUT_MINUTES", 10) * 60
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
  args <- c("--vanilla", script, pkgs)
  if (requireNamespace("processx", quietly = TRUE)) {
    # processx runs the command directly rather than through a shell, so the
    # arguments need no quoting of their own.
    run <- processx::run(
      "Rscript",
      args,
      timeout = load_timeout_sec,
      error_on_status = FALSE,
      stderr_to_stdout = TRUE
    )
    out <- strsplit(run$stdout %||% "", "\n", fixed = TRUE)[[1]]
    timed_out <- isTRUE(run$timeout)
  } else {
    out <- suppressWarnings(system2(
      "Rscript",
      # Quoted: system2() quotes the command, but not the arguments.
      shQuote(args),
      stdout = TRUE,
      stderr = TRUE
    ))
    timed_out <- FALSE
  }
  loaded <- sub("^LOADED ", "", grep("^LOADED ", out, value = TRUE))
  list(failed = setdiff(pkgs, loaded), log = out, timed_out = timed_out)
}
load_failures <- list()
chunks <- split(installed, ceiling(seq_along(installed) / 40))
for (chunk in chunks) {
  if (out_of_time("the load test")) {
    break
  }
  first <- load_batch(chunk)
  if (length(first$failed) == 0) {
    next
  }
  for (p in first$failed) {
    if (out_of_time("the load test")) {
      break
    }
    single <- load_batch(p)
    if (length(single$failed) > 0) {
      load_failures[[p]] <- if (isTRUE(single$timed_out)) {
        sprintf("loading timed out after %.0f min", load_timeout_sec / 60)
      } else {
        paste(utils::tail(sanitize_log(single$log), 20), collapse = "\n")
      }
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
    run <- pak_install(
      p,
      lib = lib,
      upgrade = FALSE,
      timeout_seconds = install_timeout_seconds(),
      label = paste("Preflight: rebuilding", p)
    )
    if (!run$ok) {
      inform("Could not reinstall ", p, ": ", run$message)
    }
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
  # The count is not the whole universe, and saying so here saves the reader a
  # trip to the plan: what only one shard needs is installed by that shard.
  sprintf(
    "Installed and loaded %d of the run's %d dependencies -- the ones more than one shard needs. %d could not be installed or loaded.",
    length(install_union),
    plan$totals$universe %||% length(install_union),
    length(failures)
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
