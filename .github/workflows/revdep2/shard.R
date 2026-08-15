# Check one shard of a revdep2 plan: many reverse dependencies, one job, one
# shared library.
#
# It runs in two phases, `install` and `check`, so that the workflow can put
# each in its own step and Actions can time them separately; `PHASE=all` runs
# both in one go, which is what a local invocation wants.
#
# The shard installs the union of its packages' dependencies once, then checks
# each of its packages against both versions of the package under test at the
# same time: two `R CMD check` runs side by side, against library stacks that
# differ in exactly that one package (a reusable baseline stands in for the
# old half). The two results are compared per package, revdepcheck-style.
#
# Failure is data here, never a job failure: a package that breaks, times out,
# or cannot even install its dependencies gets a manifest entry saying so, and
# the walk continues. The job goes red only when the driver itself is broken.
#
# The shard stops starting new checks when its deadline says the next one will
# not finish, and records the rest as deferred; a later run started with
# `retry-run` picks exactly those up. Results that exist by then -- including
# an old-version result whose new-version counterpart was cut off -- are still
# uploaded, so nothing decided is lost to the deadline.
#
# Before installing anything, the shard unpacks prebuilt dependencies (see
# util.R): this run's preflight library, and then the earlier runs the plan
# picked. pak only has to build what neither of them had.
#
# What each phase costs is recorded in timing.json next to the results: the
# collector folds it into the run's timings artifact, and the next plan sizes
# its shards from what this one measured rather than from CRAN's numbers and a
# guess.
#
# Environment variables:
#   SHARD                  - shard index from plan.json (required)
#   PLAN                   - plan file (default: plan.json)
#   PKG_DIR                - the revdep2-pkg artifact: meta.json, bin/ (required)
#   LIB_DIR                - the revdep2-lib artifact of *this* run: the
#                            preflight's library; may be missing or empty
#   BASELINE_DIR           - the revdep2-baseline artifact of the donor run;
#                            may be missing or empty, then everything is fresh
#   OUT_DIR                - results directory, uploaded as the shard artifact
#                            (default: results)
#   TIMEOUT_FACTOR         - per-check timeout as a multiple of the package's
#                            CRAN check time (default: 1.5)
#   TIMEOUT_MIN_MINUTES    - floor for that timeout; CRAN's machines are not
#                            these runners (default: 10)
#   DEADLINE_MINUTES       - stop starting new checks past this (default: 300)
#   PHASE                  - "install", "check", or "all" (default): which half
#                            of the shard this invocation runs

script_dir <- dirname(sub(
  "--file=",
  "",
  grep("^--file=", commandArgs(), value = TRUE)
))
source(file.path(script_dir, "util.R"))

script_started <- Sys.time()
elapsed <- function(from) {
  round(as.numeric(difftime(Sys.time(), from, units = "secs")), 1)
}

shard_index <- as.integer(env_chr("SHARD"))
stopifnot(!is.na(shard_index))
plan <- read_json(env_chr("PLAN", "plan.json"))
pkg_dir <- env_chr("PKG_DIR", "pkg")
baseline_dir <- env_chr("BASELINE_DIR", "baseline")
out_dir <- env_chr("OUT_DIR", "results")
timeout_factor <- env_num("TIMEOUT_FACTOR", 1.5)
timeout_min_sec <- env_num("TIMEOUT_MIN_MINUTES", 10) * 60
deadline <- Sys.time() + env_num("DEADLINE_MINUTES", 300) * 60

shard <- Filter(function(s) s$index == shard_index, plan$shards)[[1]]
members <- vapply(shard$packages, function(p) p$name, character(1))
meta <- read_json(file.path(pkg_dir, "meta.json"))
package <- plan$package

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
manifest_path <- file.path(out_dir, "manifest.ndjson")
work <- file.path(env_chr("RUNNER_TEMP", tempdir()), "revdep2-work")
dir.create(work, recursive = TRUE, showWarnings = FALSE)

# Which half of the shard this invocation runs. The workflow calls the driver
# twice so that Actions times the install and the checks separately; `all` is
# for running the whole shard in one process, which is what a local invocation
# wants. The install leaves `install-state.json` behind and the checks read it,
# so the split costs one small file and repeats nothing.
phase <- env_chr("PHASE", "all")
if (!phase %in% c("all", "install", "check")) {
  stop("PHASE must be one of \"all\", \"install\", \"check\"", call. = FALSE)
}
do_install <- phase %in% c("all", "install")
do_check <- phase %in% c("all", "check")
install_state <- file.path(work, "install-state.json")

inform(
  "Shard ",
  shard_index,
  ": ",
  length(members),
  " package(s), ",
  "estimated ~",
  shard$estimate_minutes,
  " min"
)

# The running state per package; every entry ends up as one manifest line.
state <- new.env(parent = emptyenv())
for (p in shard$packages) {
  assign(
    p$name,
    list(
      package = p$name,
      version = p$version,
      level = p$level %||% 0L,
      shard = shard_index,
      weight_minutes = p$weight_minutes,
      t_total = p$t_total %||% 0,
      dep_fingerprint = p$dep_fingerprint,
      baseline_planned = isTRUE(p$baseline),
      # Whether the old check reproduced the baseline this run was offered.
      # NA when there was none to compare against.
      baseline_agrees = NA,
      result = "deferred",
      status = "",
      status_old = "",
      status_new = "",
      new_issues = 0L,
      t_old = NA,
      t_new = NA,
      old_checked_at = NA,
      message = ""
    ),
    envir = state
  )
}
update <- function(name, ...) {
  entry <- get(name, envir = state)
  entry[names(list(...))] <- list(...)
  assign(name, entry, envir = state)
  entry
}

counts <- function(x) {
  if (!inherits(x, "rcmdcheck")) {
    return("?")
  }
  sprintf(
    "%dE %dW %dN",
    length(x$errors),
    length(x$warnings),
    length(x$notes)
  )
}

# ---------------------------------------------------------------- install ----

# The two versions cascade rather than replace each other.
#
# `R_LIBS` is a search path, so a check can name a library holding exactly one
# package -- the CRAN release, or the dev build -- in front of the shared
# library holding every dependency. Nothing is installed or uninstalled
# between the phases, which is what used to force them to run one after the
# other; now both can run at once against libraries that differ in exactly the
# package under test.
lib <- .libPaths()[[1]]
lib_old <- file.path(work, "lib-old")
lib_new <- file.path(work, "lib-new")

if (do_install) {
  install <- unlist(shard$install, use.names = FALSE)

  # What is already built, unpacked into the library pak installs into: this
  # run's own preflight library first -- it is the freshest there is, and
  # without it every shard would rebuild what the preflight compiled minutes
  # ago -- then the earlier runs the plan picked, for whatever the preflight
  # could not supply. pak still resolves the whole set afterwards; the point is
  # to skip *building* what has not changed, not to skip resolving it.
  restore_started <- Sys.time()
  restored <- c(
    restore_local_library(env_chr("LIB_DIR"), lib, install),
    restore_prebuilt(plan, lib, install)
  )
  restore_seconds <- elapsed(restore_started)
  inform(
    length(restored),
    " dependency binaries restored, ",
    length(install) - length(restored),
    " left to pak"
  )

  # With a restored library, `upgrade = FALSE` would freeze whatever version the
  # donor happened to hold; the plan's dependency fingerprints are computed from
  # CRAN *now*, so the library has to follow CRAN now.
  upgrade <- length(restored) > 0

  # The pak cache this shard restored was saved by the preflight, so a metadata
  # database broken there arrives here intact -- which is how run 31282820357
  # turned one bad preflight into sixty shards that installed nothing and
  # reported every one of their packages as a depfail. Asking pak what it can
  # see costs seconds, and a shard that cannot see CRAN is worth saying out loud
  # rather than working around.
  if (identical(ensure_metadata(sprintf("Shard %d", shard_index)), "broken")) {
    inform("pak cannot see CRAN here; every check will be a depfail")
  }

  # In dependency order, a hundred at a time, for the same reason the preflight
  # does it: one pak call for the whole set is one resolution of the whole set,
  # and that is the part that stops degrading gracefully as the set grows. A
  # shard's union is a fraction of the preflight's, but it is the same call.
  chunk_size <- env_num("REVDEP2_INSTALL_CHUNK", 100)
  chunks <- install_chunks(install, cran_db(), chunk_size)
  inform(
    "Installing ",
    length(install),
    " dependencies in ",
    length(chunks),
    " chunk(s) of at most ",
    chunk_size,
    ", dependencies first"
  )
  install_started <- Sys.time()
  # The deadline is the shard's own: an install that runs into it leaves no time
  # to check anything, so it stops and lets the checks report what they can
  # rather than being cancelled with the job.
  bulk_ok <- install_in_chunks(
    chunks,
    lib = lib,
    upgrade = upgrade,
    deadline = deadline
  )
  if (!bulk_ok) {
    for (p in install) {
      if (requireNamespace(p, quietly = TRUE) || Sys.time() > deadline) {
        next
      }
      run <- pak_install(
        p,
        lib = lib,
        upgrade = upgrade,
        timeout_seconds = install_timeout_seconds(),
        label = paste("installing", p)
      )
      if (!run$ok) {
        inform("Could not install ", p, ": ", run$message)
      }
    }
  }

  # After the installs and before the first check: pak has covered whatever it
  # installed itself, so what is left is exactly the restored packages -- this
  # run's preflight library and the plan's donors. A shard has no load test, so
  # an unmet system requirement here would surface as a check failure blamed on
  # the revdep.
  ensure_sysreqs(lib, sprintf("Shard %d", shard_index))

  install_seconds <- elapsed(install_started)
  inform(
    "Dependencies ready after ",
    round(install_seconds / 60, 1),
    " min (",
    round(restore_seconds / 60, 1),
    " min unpacking prebuilt)"
  )

  dir.create(lib_old, recursive = TRUE, showWarnings = FALSE)
  dir.create(lib_new, recursive = TRUE, showWarnings = FALSE)

  # The shared library must not hold the package under test at all, or it would
  # shadow neither and both checks would see whatever the resolver left there.
  unlink(file.path(lib, package), recursive = TRUE)

  inform(
    "Installing ",
    package,
    " ",
    plan$cran_version,
    " into the old library"
  )
  cran_install <- pak_install(
    package,
    lib = lib_old,
    upgrade = FALSE,
    timeout_seconds = install_timeout_seconds(),
    label = paste("installing", package)
  )
  if (!cran_install$ok) {
    stop("Installing the CRAN release of ", package, " failed", call. = FALSE)
  }
  our_cran_version <- as.character(utils::packageVersion(package, lib_old))
  if (!identical(our_cran_version, plan$cran_version)) {
    inform(
      "Note: old checks run against ",
      our_cran_version,
      " (the repositories lag CRAN, the plan expected ",
      plan$cran_version,
      ")"
    )
  }

  binary <- file.path(pkg_dir, meta$binary)
  inform("Installing dev binary ", basename(binary), " into the new library")
  if (
    system2(
      "R",
      c("CMD", "INSTALL", "-l", shQuote(lib_new), shQuote(binary))
    ) !=
      0
  ) {
    stop("Installing the prebuilt dev binary failed", call. = FALSE)
  }
  our_dev_version <- as.character(utils::packageVersion(package, lib_new))

  # What the check phase needs to know about this one, and what the timings at
  # the end report. Everything else it can work out for itself from the library
  # it finds on disk.
  write_json(
    list(
      install_packages = length(install),
      restored = length(restored),
      restore_seconds = restore_seconds,
      install_seconds = install_seconds,
      our_cran_version = our_cran_version,
      our_dev_version = our_dev_version
    ),
    install_state
  )
}

if (!do_check) {
  inform("Install phase complete; the check phase runs as its own step")
  quit(save = "no", status = 0)
}

if (!file.exists(install_state)) {
  stop(
    "No install state in ",
    work,
    ": the install phase did not finish",
    call. = FALSE
  )
}
installed_state <- read_json(install_state)
our_cran_version <- installed_state$our_cran_version
our_dev_version <- installed_state$our_dev_version
invisible(file.create(manifest_path))

installed <- rownames(utils::installed.packages())
inform(sprintf(
  "Checking old (%s) and new (%s) concurrently, two at a time per package",
  our_cran_version,
  our_dev_version
))

# A package whose *strong* dependency closure is incomplete cannot produce a
# check result worth comparing; missing suggests are tolerable, the check runs
# with _R_CHECK_FORCE_SUGGESTS_=false, the way CRAN treats unavailable ones.
db <- cran_db()
strong_missing <- function(name) {
  strong <- tools::package_dependencies(
    name,
    db = db,
    which = "strong",
    recursive = TRUE
  )[[1]]
  setdiff(intersect(strong, rownames(db)), c(installed, base_packages()))
}
runnable <- character()
for (name in members) {
  missing <- tryCatch(strong_missing(name), error = function(e) character())
  if (length(missing) > 0) {
    update(
      name,
      result = "depfail",
      message = paste(
        "Dependencies not installed:",
        paste(missing, collapse = ", ")
      )
    )
    inform(
      name,
      ": dependencies missing (",
      paste(missing, collapse = ", "),
      ")"
    )
  } else {
    runnable <- c(runnable, name)
  }
}

# ---------------------------------------------------------------- sources ----

src_dir <- file.path(work, "src")
dir.create(src_dir, showWarnings = FALSE)
sources <- list()
for (name in runnable) {
  tarball <- tryCatch(
    {
      hit <- utils::download.packages(
        name,
        destdir = src_dir,
        repos = cran_repo(),
        type = "source",
        quiet = TRUE
      )
      hit[1, 2]
    },
    error = function(e) NULL
  )
  if (is.null(tarball)) {
    update(
      name,
      result = "error",
      message = "Source tarball could not be downloaded"
    )
    inform(name, ": source download failed")
  } else {
    sources[[name]] <- tarball
    actual <- sub(
      sprintf("^%s_(.*)[.]tar[.]gz$", name),
      "\\1",
      basename(tarball)
    )
    update(name, version = actual)
  }
}
runnable <- names(sources)

# ------------------------------------------------------------------ checks ---

# Stop before a check the trailing estimate says will not finish -- but always
# attempt the first check of a phase, or a mis-budgeted shard would make no
# progress at all and a retry would repeat the mistake.
checks_started <- 0L
check_seconds <- 0
out_of_time <- function(entry) {
  if (checks_started == 0L) {
    return(FALSE)
  }
  budget_sec <- max(entry$weight_minutes, 1) * 60 * 1.3
  Sys.time() + budget_sec > deadline
}

# One package, both versions, at once.
#
# check-pair.sh runs the two `R CMD check` invocations concurrently against the
# cascading libraries and writes each one's log and exit status; this reads
# them back. `rcmdcheck::parse_check()` turns a 00check.log into the same
# object `rcmdcheck()` used to return, so everything downstream -- the counts,
# `compare_checks()`, the manifest -- is unchanged.
#
# The timeout is coreutils' rather than rcmdcheck's, which is what makes the
# distinction reliable: exit 124 is the deadline, anything else is the check
# saying something.
# The check log with this run's incidentals taken out of it.
#
# Two things differ between the halves for reasons that have nothing to do with
# the package:
#
#   * the paths. The libraries cascade, so they differ by construction --
#     `.../lib-old/...` against `.../lib-new/...` -- and so do the two check
#     directories, which the log names in its first line and quotes in every
#     "see ... for details".
#   * the timings. `--as-cran` sets `_R_CHECK_TIMINGS_`, so every stage slower
#     than ten seconds prints its own `[user/elapsed]` pair, and two checks
#     racing each other for the same four cores never agree on those. A run of
#     rphylopic against the *same* igraph on both sides differed in exactly two
#     lines: the log directory, and `[14s/12s]` against `[13s/11s]`.
#
# Both matter twice. `compare_checks()` matches issues by their text, so a
# difference in the first line of an issue makes an issue both halves have look
# like a new one; and the diff between the halves is only worth printing if two
# identical results produce an empty one.
#
# Nothing else is touched: a difference anywhere but here is exactly what this
# workflow exists to find.
neutral_log <- function(path, name) {
  lines <- readLines(path, warn = FALSE)
  for (from in c(lib_old, lib_new, file.path(work, "check", name))) {
    lines <- gsub(from, "<lib>", lines, fixed = TRUE)
  }
  # The phase also names itself in the .Rcheck path under the work directory.
  lines <- gsub("<lib>/(old|new)", "<lib>", lines)
  # `[14s/12s]`, and the one-number form R uses where it has only one.
  gsub("\\[[0-9.]+s(/[0-9.]+s)?\\]", "[]", lines)
}

# How much of a package's diff goes into the job log before it is cut off.
diff_max_lines <- env_num("REVDEP2_DIFF_MAX_LINES", 200)

# The two halves' check logs, as a patch.
#
# Both sides are neutralised first, so the paths and the stage timings that
# differ in every pair are gone and what is left is the package: an empty diff
# means the dev version changed nothing about this check, however long the log.
check_diff <- function(name, old_log, new_log) {
  tmp <- file.path(tempdir(), c("old-00check.log", "new-00check.log"))
  writeLines(neutral_log(old_log, name), tmp[[1]])
  writeLines(neutral_log(new_log, name), tmp[[2]])
  on.exit(unlink(tmp), add = TRUE)
  suppressWarnings(system2(
    "diff",
    shQuote(c("-u", "--label", "old", tmp[[1]], "--label", "new", tmp[[2]])),
    stdout = TRUE,
    stderr = NULL
  ))
}

check_pair <- function(name) {
  checks_started <<- checks_started + 1L
  work_dir <- file.path(work, "check", name)
  unlink(work_dir, recursive = TRUE)
  dir.create(work_dir, recursive = TRUE, showWarnings = FALSE)
  # The timeout scales with what the check costs CRAN, floored because these
  # runners are slower than CRAN's machines and a tiny package must not be
  # killed over the difference.
  timeout_sec <- max(
    timeout_min_sec,
    timeout_factor * (get(name, envir = state)$t_total %||% 0)
  )
  started <- Sys.time()
  system2(
    file.path(script_dir, "check-pair.sh"),
    shQuote(c(
      sources[[name]],
      work_dir,
      lib_old,
      lib_new,
      lib,
      format(round(timeout_sec), scientific = FALSE)
    ))
  )
  duration <- round(as.numeric(Sys.time() - started, units = "secs"))
  # Both checks ran side by side, so the pair cost what the slower one cost --
  # but each half is still charged, because that is the work the cost model
  # measures and the shard's own deadline spends.
  check_seconds <<- check_seconds + 2 * duration

  read_side <- function(phase) {
    dir <- file.path(work_dir, phase)
    status <- suppressWarnings(as.integer(readLines(
      file.path(dir, "status"),
      warn = FALSE
    )[[1]]))
    log <- file.path(dir, paste0(name, ".Rcheck"), "00check.log")
    result <- if (identical(status, 124L)) {
      simpleError(sprintf(
        "%s check timed out after %ds",
        phase,
        round(timeout_sec)
      ))
    } else {
      tryCatch(
        rcmdcheck::parse_check(text = neutral_log(log, name)),
        error = function(e) {
          simpleError(sprintf(
            "%s check produced no readable result (exit %s): %s",
            phase,
            status,
            conditionMessage(e)
          ))
        }
      )
    }
    attr(result, "duration") <- duration
    attr(result, "timed_out") <- identical(status, 124L)
    # Where it was when the clock ran out. A check killed in `tests` is a
    # different animal from one killed while compiling, and the report used to
    # say only "timed out".
    attr(result, "last_step") <- if (file.exists(log)) {
      steps <- grep("^[*] ", readLines(log, warn = FALSE), value = TRUE)
      if (length(steps) > 0) utils::tail(steps, 1) else ""
    } else {
      ""
    }
    result
  }

  list(old = read_side("old"), new = read_side("new"))
}

check_failure <- function(name, phase, result) {
  if (isTRUE(attr(result, "timed_out"))) {
    # `timeout`, not `failed`. A check killed by the clock says nothing about
    # the package, and in the old phase it says nothing about our change
    # either -- the dev version is not even on that library path. Reporting it
    # as a failure put 60 packages into failures.md in run 31304411628 that
    # the run had learnt nothing about. `needs_recheck()` picks it up either
    # way, so `retry-run` still re-checks them.
    step <- attr(result, "last_step") %||% ""
    update(
      name,
      result = "timeout",
      message = sprintf(
        "%s check timed out after %ds%s",
        phase,
        attr(result, "duration"),
        if (nzchar(step)) paste0(", at: ", trimws(step)) else ""
      )
    )
    inform(
      name,
      ": ",
      phase,
      " check timed out (",
      attr(result, "duration"),
      "s)",
      if (nzchar(step)) paste0(" at ", trimws(step)) else ""
    )
  } else {
    update(name, result = "error", message = conditionMessage(result))
    inform(name, ": ", phase, " check errored: ", conditionMessage(result))
  }
}

pkg_out <- function(name) {
  dir <- file.path(out_dir, "pkgs", name)
  dir.create(dir, recursive = TRUE, showWarnings = FALSE)
  dir
}

# The checks: one pass, both versions of every package at once.
#
# There used to be two passes -- every old check, then the dev binary
# installed over the CRAN one, then every new check -- because the library
# could only hold one version at a time. With the two cascading libraries it
# can hold both, so a package's pair runs together and the shard makes one
# pass. That halves a package's wall clock, and it means a package whose old
# check hangs still gets its new answer instead of the run learning nothing
# about it.
inform(sprintf(
  "Checking %d package(s), old and new side by side",
  length(runnable)
))
for (name in runnable) {
  entry <- get(name, envir = state)

  if (out_of_time(entry)) {
    inform(name, ": deferred (deadline)")
    next
  }

  # Both halves, always. A baseline used to stand in for the old check and
  # save it; with the pair running concurrently the old check costs no wall
  # clock at all, and reusing a result from another run means comparing
  # against a machine, a CRAN snapshot and a dependency tree that are not
  # this run's. The baseline is still read, but as a second opinion: if it
  # disagrees with what the old check just produced, that is drift worth
  # printing rather than a comparison worth trusting.
  pair <- check_pair(name)
  old <- pair$old
  new <- pair$new

  if (inherits(old, "error")) {
    check_failure(name, "old", old)
    next
  }
  saveRDS(old, file.path(pkg_out(name), "old.rds"))
  update(
    name,
    status_old = counts(old),
    t_old = attr(old, "duration"),
    old_checked_at = now_utc()
  )

  if (entry$baseline_planned) {
    rds <- file.path(baseline_dir, "old-rds", paste0(name, ".rds"))
    baseline <- tryCatch(readRDS(rds), error = function(e) NULL)
    if (!is.null(baseline)) {
      agrees <- identical(counts(baseline), counts(old))
      update(name, baseline_agrees = agrees)
      if (!agrees) {
        inform(sprintf(
          "%s: the baseline said %s, the old check now says %s",
          name,
          counts(baseline),
          counts(old)
        ))
      }
    }
  }
  if (inherits(new, "error")) {
    check_failure(name, "new", new)
    next
  }
  saveRDS(new, file.path(pkg_out(name), "new.rds"))

  cmp <- tryCatch(
    rcmdcheck::compare_checks(old, new),
    error = function(e) NULL
  )
  if (is.null(cmp)) {
    update(
      name,
      result = "failed",
      status_new = counts(new),
      t_new = attr(new, "duration"),
      message = "both checks ran, but their results could not be compared"
    )
  } else {
    new_issues <- sum(cmp$cmp$change == 1)
    update(
      name,
      result = classify_status(cmp$status, new_issues),
      status = cmp$status,
      status_new = counts(new),
      # The pair's wall clock, charged to both halves: they ran side by side,
      # so neither one's own time is separable from the other's. It used to be
      # recorded only where the comparison failed, which left `t_new` null for
      # every package that compared -- that is, for all of them.
      t_new = attr(new, "duration"),
      new_issues = new_issues,
      # An install failure or a timeout leaves nothing to compare, so the
      # result is only "failed"; say which one it was.
      message = status_message(cmp$status)
    )
  }
  entry <- get(name, envir = state)
  inform(
    name,
    ": ",
    entry$result,
    " (old ",
    entry$status_old,
    ", new ",
    entry$status_new,
    ", ",
    attr(new, "duration"),
    "s for the pair)"
  )

  # The parsed results carry everything the reports need; raw check output is
  # kept only where a human will want to dig, and then as the *difference*
  # between the two logs rather than the whole of the new one. The whole log
  # is thousands of lines that are identical in both, and what a reader wants
  # is the handful that are not.
  if (entry$result == "ok") {
    unlink(file.path(work, "check", name), recursive = TRUE)
  } else {
    keep <- file.path(out_dir, "pkgs", name, "new-check")
    dir.create(keep, recursive = TRUE, showWarnings = FALSE)
    rcheck <- function(phase) {
      file.path(work, "check", name, phase, paste0(name, ".Rcheck"))
    }
    for (f in c(
      "00check.log",
      "00install.out",
      list.files(rcheck("new"), pattern = "[.]Rout[.]fail$", recursive = TRUE)
    )) {
      if (file.exists(file.path(rcheck("new"), f))) {
        file.copy(file.path(rcheck("new"), f), file.path(keep, basename(f)))
      }
    }
    old_log <- file.path(rcheck("old"), "00check.log")
    new_log <- file.path(rcheck("new"), "00check.log")
    if (file.exists(old_log) && file.exists(new_log)) {
      diff <- check_diff(name, old_log, new_log)
      writeLines(diff, file.path(keep, "00check.diff"))
      # And into the job log, where it is the one thing a reader of the run
      # actually wants: what the dev version changed about this package, in the
      # package's own words. Downloading an artifact to find out that a NOTE
      # gained a line is a poor trade. It is bounded because a package that
      # fails to install differs in thousands of lines and would bury the rest
      # of the shard; the whole diff is in the artifact either way.
      print_group(
        sprintf("%s: old vs new check log (%d line diff)", name, length(diff)),
        if (length(diff) == 0) {
          # Worth saying rather than leaving as an empty block. A package
          # called `newly_broken` whose two logs are identical once the paths
          # and the stage timings are out of them is not newly broken; it is
          # this harness getting it wrong, and this line is how a reader of the
          # run finds that out without downloading anything.
          "The two logs are identical apart from paths and stage timings."
        },
        head(diff, diff_max_lines),
        if (length(diff) > diff_max_lines) {
          sprintf(
            "[%d more lines; the whole diff is 00check.diff in the shard artifact]",
            length(diff) - diff_max_lines
          )
        }
      )
    }
    unlink(file.path(work, "check", name), recursive = TRUE)
  }
}


# ---------------------------------------------------------------- manifest ---

entries <- lapply(members, function(name) get(name, envir = state))
for (entry in entries) {
  entry$our_cran_version <- our_cran_version
  entry$our_dev_version <- our_dev_version
  cat(
    jsonlite::toJSON(entry, auto_unbox = TRUE, null = "null"),
    "\n",
    sep = "",
    file = manifest_path,
    append = TRUE
  )
}

# ----------------------------------------------------------------- timings ---

# What this shard cost, next to what the plan thought it would: the collector
# pools these into the run's timings artifact, and the next plan calibrates its
# cost model from them. The job's own minutes -- the runner image, R, TinyTeX,
# the artifact downloads before this script even starts -- are not visible from
# here; the collector reads those off the API and adds them.
write_json(
  list(
    index = shard_index,
    packages = length(members),
    checks = checks_started,
    install_packages = installed_state$install_packages,
    restored = installed_state$restored,
    restore_seconds = installed_state$restore_seconds,
    install_seconds = installed_state$install_seconds,
    check_seconds = round(check_seconds, 1),
    # The install phase is its own step now, so this is the check phase's own
    # wall clock; the two together are what the shard job cost.
    script_seconds = elapsed(script_started),
    started_at = format(script_started, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
    finished_at = now_utc(),
    planned_minutes = shard$estimate_minutes,
    planned_check_minutes = shard$check_minutes
  ),
  file.path(out_dir, "timing.json")
)

# ------------------------------------------------------------------ summary --

results <- vapply(entries, function(e) e$result, character(1))
df <- data.frame(
  Package = vapply(entries, function(e) e$package, character(1)),
  Version = vapply(entries, function(e) e$version, character(1)),
  Result = results,
  Old = vapply(entries, function(e) e$status_old, character(1)),
  New = vapply(entries, function(e) e$status_new, character(1)),
  Baseline = ifelse(
    vapply(entries, function(e) isTRUE(e$baseline_reused), logical(1)),
    "reused",
    ""
  )
)
append_summary(c(
  sprintf("### Shard %d", shard_index),
  "",
  sprintf(
    "%d ok, %d newly broken, %d failed, %d timed out, %d depfail, %d error, %d deferred.",
    sum(results == "ok"), sum(results == "newly_broken"), sum(results == "failed"),
    sum(results == "timeout"),
    sum(results == "depfail"), sum(results == "error"), sum(results == "deferred")
  ),
  "",
  md_table(df)
))
for (entry in entries) {
  if (entry$result %in% c("ok", "deferred")) {
    next
  }
  # The reason goes in the title, where `md_details()` cannot tail it away;
  # the body is the check log where there is one, because the reason alone
  # rarely says which check step broke.
  log <- file.path(out_dir, "pkgs", entry$package, "new-check", "00check.log")
  reason <- gsub("\n", " ", entry$message %||% "")
  lines <- if (file.exists(log)) {
    readLines(log, warn = FALSE)
  } else if (nzchar(reason)) {
    strsplit(entry$message, "\n")[[1]]
  } else {
    "(no log captured)"
  }
  append_summary(md_details(
    sprintf(
      "<code>%s</code> &mdash; %s%s",
      entry$package,
      entry$result,
      if (nzchar(reason)) paste0(": ", md_escape_html(reason)) else ""
    ),
    lines
  ))
}

inform(
  "Shard ",
  shard_index,
  " done: ",
  paste(names(table(results)), table(results), sep = "=", collapse = ", ")
)
