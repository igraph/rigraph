# Fan-in for revdep2: merge every shard's results into one report, one
# manifest, and one baseline for future runs to reuse.
#
# Reads all revdep2-results-* artifacts (every attempt; on a re-run the later
# attempt wins per package), folds in the untouched results of the run being
# retried so the report is always complete, and writes:
#
#   revdep/README.md     summary, revdepcheck-style
#   revdep/problems.md   details for packages with new problems
#   revdep/failures.md   details for packages that could not be checked
#   revdep/cran.md       the paragraph for cran-comments.md
#   revdep/manifest.json one entry per package, machine-readable
#   revdep/pkgs/<p>/     old.rds, new.rds, kept new-version check output
#
# plus the baseline artifact content (baseline.json, old-rds/<p>.rds): every
# reusable old-version result of this run, stamped with the metadata the next
# plan compares against -- versions, R series, dependency fingerprint, and the
# date the old check *actually* ran (reuse does not refresh it),
# and timings.json: what the checks and the shards actually cost, which is what
# the next plan calibrates its cost model with instead of guessing.
#
# Environment variables:
#   RESULTS_DIR  - directory the shard artifacts were downloaded into (required)
#   PLAN         - plan.json (default: plan.json)
#   RETRY_DIR    - the revdep2-report artifact of the run being retried, if any
#   OUT_DIR      - report directory (default: revdep)
#   BASELINE_OUT - baseline directory (default: baseline)
#   TIMINGS_OUT  - timings directory (default: timings)
#
# Reads GH_TOKEN, if it has one, only to ask the API how long the shard *jobs*
# took: the part of a shard's cost that happens before its driver starts.
#
# Always exits zero: check results are the report's business, not the job
# status's -- only a genuinely broken collector fails this job.

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

results_dir <- env_chr("RESULTS_DIR")
stopifnot(nzchar(results_dir))
plan <- read_json(env_chr("PLAN", "plan.json"))
retry_dir <- env_chr("RETRY_DIR")
out_dir <- env_chr("OUT_DIR", "revdep")
baseline_out <- env_chr("BASELINE_OUT", "baseline")
timings_out <- env_chr("TIMINGS_OUT", "timings")

dir.create(file.path(out_dir, "pkgs"), recursive = TRUE, showWarnings = FALSE)
dir.create(
  file.path(baseline_out, "old-rds"),
  recursive = TRUE,
  showWarnings = FALSE
)
dir.create(timings_out, recursive = TRUE, showWarnings = FALSE)

# ------------------------------------------------------------------- merge ---

# Shard artifacts are named revdep2-results-<shard>-<attempt>; walking them in
# attempt order makes the later attempt win when a shard was re-run.
attempt_of <- function(path) {
  n <- suppressWarnings(as.integer(sub("^.*-", "", basename(path))))
  if (is.na(n)) 0L else n
}
shard_dirs <- list.dirs(results_dir, recursive = FALSE)
shard_dirs <- shard_dirs[order(vapply(shard_dirs, attempt_of, integer(1)))]

entries <- list()
take <- function(entry, from) {
  entry$carried <- isTRUE(entry$carried)
  entries[[entry$package]] <<- entry
  src <- file.path(from, "pkgs", entry$package)
  if (dir.exists(src)) {
    dest <- file.path(out_dir, "pkgs", entry$package)
    unlink(dest, recursive = TRUE)
    dir.create(dest, recursive = TRUE, showWarnings = FALSE)
    file.copy(list.files(src, full.names = TRUE), dest, recursive = TRUE)
  }
}

shard_timings <- list()
for (dir in shard_dirs) {
  timing <- file.path(dir, "timing.json")
  if (file.exists(timing)) {
    row <- tryCatch(read_json(timing), error = function(e) NULL)
    if (!is.null(row$index)) {
      shard_timings[[as.character(row$index)]] <- row
    }
  }
  manifest <- file.path(dir, "manifest.ndjson")
  if (!file.exists(manifest)) {
    next
  }
  for (line in readLines(manifest, warn = FALSE)) {
    if (nzchar(trimws(line))) {
      take(jsonlite::fromJSON(line, simplifyVector = FALSE), dir)
    }
  }
}
inform(
  "Collected ",
  length(entries),
  " package(s) from ",
  length(shard_dirs),
  " shard artifact(s)"
)

# A retried run reports the whole picture: results the retry did not touch are
# carried over from the earlier run's report, marked as such.
if (nzchar(retry_dir) && file.exists(file.path(retry_dir, "manifest.json"))) {
  carried <- 0L
  for (entry in read_json(file.path(retry_dir, "manifest.json"))) {
    if (is.null(entries[[entry$package]])) {
      entry$carried <- TRUE
      take(entry, retry_dir)
      carried <- carried + 1L
    }
  }
  inform(
    "Carried ",
    carried,
    " untouched result(s) over from run ",
    plan$retry_of
  )
}

entries <- entries[order(names(entries))]
results_tbl <- vapply(entries, function(e) e$result, character(1))

# ---------------------------------------------------------------- manifest ---

write_json(
  list(
    package = plan$package,
    dev_version = plan$dev_version,
    cran_version = plan$cran_version,
    r_version = plan$r_version,
    sha = plan$sha,
    run_id = env_chr("GITHUB_RUN_ID"),
    retry_of = plan$retry_of,
    generated_at = now_utc()
  ),
  file.path(out_dir, "run.json")
)
write_json(unname(entries), file.path(out_dir, "manifest.json"))

# ---------------------------------------------------------------- baseline ---

baseline <- list()
for (entry in entries) {
  rds <- file.path(out_dir, "pkgs", entry$package, "old.rds")
  if (
    !file.exists(rds) ||
      is.null(entry$old_checked_at) ||
      is.na(entry$old_checked_at)
  ) {
    next
  }
  file.copy(
    rds,
    file.path(baseline_out, "old-rds", paste0(entry$package, ".rds"))
  )
  baseline[[length(baseline) + 1]] <- list(
    package = entry$package,
    version = entry$version,
    our_cran_version = entry$our_cran_version,
    r_version = plan$r_version,
    dep_fingerprint = entry$dep_fingerprint,
    checked_at = entry$old_checked_at,
    status_old = entry$status_old,
    has_old = TRUE
  )
}
write_json(baseline, file.path(baseline_out, "baseline.json"))
inform("Baseline carries ", length(baseline), " old-version result(s)")

# ----------------------------------------------------------------- timings ---

# What this run cost, in the form the next plan can use: one row per package
# (seconds per check here, next to the seconds CRAN reports) and one per shard
# (install, check, script and job minutes, next to what was predicted).
#
# The plan's cost model is three constants -- how fast checks run here, what a
# shard costs before it checks anything, what one more dependency costs to
# install -- and every one of them is measurable. Measuring them is what keeps
# the shard count honest: a model that overestimates the work cuts it into more
# shards than the parallel capacity can run, and each extra shard is another
# setup paid for nothing.
seconds_of <- function(entry) {
  both <- suppressWarnings(as.numeric(c(entry$t_old, entry$t_new)))
  both <- both[!is.na(both) & both > 0]
  if (length(both) == 0) {
    NULL
  } else {
    list(seconds = mean(both), checks = length(both))
  }
}
package_rows <- list()
for (entry in entries) {
  measured <- seconds_of(entry)
  if (is.null(measured)) {
    next
  }
  package_rows[[length(package_rows) + 1]] <- list(
    package = entry$package,
    version = entry$version,
    t_total = entry$t_total %||% 0,
    checks = measured$checks,
    seconds = round(measured$seconds, 1)
  )
}

# The shard's own clock covers install and checks; the minutes before its
# driver starts -- runner image, R, pandoc, TinyTeX, artifact downloads -- are
# only visible from the API, and they are precisely the price of one more
# shard.
job_minutes <- run_shard_job_minutes(env_chr("GITHUB_RUN_ID"))
shard_rows <- lapply(shard_timings, function(t) {
  index <- as.character(t$index)
  install <- ((t$restore_seconds %||% 0) + (t$install_seconds %||% 0)) / 60
  list(
    index = t$index,
    packages = t$packages %||% 0,
    checks = t$checks %||% 0,
    install_packages = t$install_packages %||% 0,
    restored = t$restored %||% 0,
    install_minutes = round(install, 2),
    check_minutes = round((t$check_seconds %||% 0) / 60, 2),
    script_minutes = round((t$script_seconds %||% 0) / 60, 2),
    job_minutes = if (index %in% names(job_minutes)) {
      round(unname(job_minutes[[index]]), 2)
    } else {
      NULL
    },
    planned_minutes = t$planned_minutes,
    planned_check_minutes = t$planned_check_minutes
  )
})
shard_rows <- unname(shard_rows[order(as.numeric(names(shard_rows)))])

timings <- list(
  run_id = env_chr("GITHUB_RUN_ID"),
  generated_at = now_utc(),
  r_version = plan$r_version,
  platform = R.version$platform,
  timing_flavor = plan$timing_flavor,
  packages = package_rows,
  shards = shard_rows
)
cal <- calibration(list(timings))
timings$calibration <- list(
  check_scale = cal$check_scale,
  setup_minutes = cal$setup_minutes,
  install_seconds = cal$install_seconds
)
write_json(timings, file.path(timings_out, "timings.json"))
inform(
  "Timings: ",
  length(package_rows),
  " package(s), ",
  length(shard_rows),
  " shard(s)",
  if (length(job_minutes) == 0) " (job durations unavailable)" else ""
)

# ----------------------------------------------------------------- reports ---

# The report machinery is revdepcheck's own, fed through its `results`
# injection point; when the package is unavailable the manifest-derived
# summary below still stands on its own.
has_revdepcheck <- requireNamespace("revdepcheck", quietly = TRUE)

comparison_of <- function(entry) {
  dir <- file.path(out_dir, "pkgs", entry$package)
  old_path <- file.path(dir, "old.rds")
  new_path <- file.path(dir, "new.rds")
  shim <- function(message) {
    res <- revdepcheck:::rcmdcheck_error(
      entry$package,
      old = list(stdout = message, stderr = ""),
      new = list(stdout = message, stderr = "")
    )
    res$version <- entry$version
    res
  }
  if (!file.exists(old_path) || !file.exists(new_path)) {
    message <- if (nzchar(entry$message %||% "")) {
      entry$message
    } else {
      sprintf("Not checked (%s)", entry$result)
    }
    return(shim(message))
  }
  tryCatch(
    revdepcheck:::try_compare_checks(
      entry$package,
      readRDS(old_path),
      readRDS(new_path)
    ),
    error = function(e) shim(conditionMessage(e))
  )
}

preamble <- c(
  "# Platform",
  "",
  md_table(data.frame(
    field = c("package", "dev", "CRAN", "commit", "R", "platform", "run", "date"),
    value = c(
      plan$package,
      plan$dev_version,
      plan$cran_version,
      substr(plan$sha, 1, 9),
      plan$r_version,
      R.version$platform,
      env_chr("GITHUB_RUN_ID", "local"),
      format(Sys.Date())
    )
  )),
  ""
)

if (has_revdepcheck) {
  results <- lapply(unname(entries), comparison_of)
  names(results) <- names(entries)

  capture_report <- function(fun, ...) {
    path <- tempfile()
    fun(..., file = path)
    readLines(path, warn = FALSE)
  }
  writeLines(
    c(
      preamble,
      capture_report(revdepcheck::cloud_report_summary, pkg = ".", results = results)
    ),
    file.path(out_dir, "README.md")
  )
  writeLines(
    capture_report(
      revdepcheck::cloud_report_problems,
      pkg = ".",
      results = results
    ),
    file.path(out_dir, "problems.md")
  )
  writeLines(
    capture_report(
      revdepcheck::cloud_report_failures,
      pkg = ".",
      results = results
    ),
    file.path(out_dir, "failures.md")
  )
  writeLines(
    capture_report(
      revdepcheck::revdep_report_cran,
      pkg = ".",
      results = results
    ),
    file.path(out_dir, "cran.md")
  )
  inform("Reports written to ", out_dir)
} else {
  inform(
    "revdepcheck is not installed; writing the manifest-derived summary only"
  )
  df <- data.frame(
    package = names(entries),
    version = vapply(entries, function(e) e$version %||% "?", character(1)),
    result = results_tbl,
    old = vapply(entries, function(e) e$status_old %||% "", character(1)),
    new = vapply(entries, function(e) e$status_new %||% "", character(1))
  )
  writeLines(
    c(preamble, "# Revdeps", "", md_table(df)),
    file.path(out_dir, "README.md")
  )
}

# ------------------------------------------------------------------ summary --

tally <- function(what) sum(results_tbl == what)
not_ok <- sum(results_tbl != "ok")

# The one sentence a reader needs, before any table.
headline <- if (tally("newly_broken") > 0) {
  sprintf(
    "**%d of %d packages newly broken.**",
    tally("newly_broken"),
    length(entries)
  )
} else if (not_ok > 0) {
  sprintf(
    "No new breakage; %d of %d packages could not be fully checked.",
    not_ok,
    length(entries)
  )
} else {
  sprintf("All good: no new problems in %d packages.", length(entries))
}

counts_df <- data.frame(
  Result = c(
    "ok", "newly broken", "failed to check",
    "dependencies not installable", "shard error", "deferred"
  ),
  Packages = c(
    tally("ok"), tally("newly_broken"), tally("failed"),
    tally("depfail"), tally("error"), tally("deferred")
  )
)
counts_df <- counts_df[counts_df$Packages > 0 | counts_df$Result == "ok", ]

# Packages that produced no comparison at all. revdepcheck lists them too, but
# only as bare names under "Failed to check" -- no version it could resolve and
# no reason, because the shim it is fed carries neither. The manifest has both,
# so that section is dropped from the embedded report and this table takes its
# place.
unchecked <- Filter(
  function(e) !e$result %in% c("ok", "newly_broken"),
  unname(entries)
)
reason_of <- function(e) {
  message <- gsub("[[:space:]]+", " ", trimws(e$message %||% ""))
  # Results carried over from an older run predate the shard recording one.
  if (!nzchar(message) && nzchar(e$status %||% "")) {
    message <- status_message(e$status)
  }
  if (nzchar(message)) {
    return(message)
  }
  switch(
    e$result,
    deferred = "the shard hit its deadline before this package was checked",
    depfail = "dependencies could not be installed",
    sprintf("no reason recorded (result `%s`)", e$result)
  )
}
unchecked_df <- data.frame(
  Package = vapply(unchecked, function(e) cran_link(e$package), character(1)),
  Version = vapply(unchecked, function(e) e$version %||% "?", character(1)),
  Result = vapply(unchecked, function(e) e$result, character(1)),
  Shard = vapply(
    unchecked,
    function(e) as.character(e$shard %||% ""),
    character(1)
  ),
  Old = vapply(unchecked, function(e) e$status_old %||% "", character(1)),
  New = vapply(unchecked, function(e) e$status_new %||% "", character(1)),
  Reason = vapply(unchecked, reason_of, character(1))
)

# The report itself, nested under this section: headings demoted two levels,
# and the platform preamble dropped -- the sentence above already says what
# was compared against what.
readme <- readLines(file.path(out_dir, "README.md"), warn = FALSE)
revdeps_at <- grep("^# Revdeps", readme)[1]
if (!is.na(revdeps_at)) {
  readme <- readme[seq(revdeps_at, length(readme))]
}
readme <- drop_section(readme, "^## Failed to check")
# revdepcheck's tables link into the sibling report files, which is right
# inside the artifact and wrong here: a job summary is served from the run's
# own URL, where `problems.md#pkg` resolves to /actions/runs/problems.md and
# 404s. The package's CRAN page is the reachable equivalent; where the details
# actually live is said once, below.
readme <- gsub(
  "\\[([^][]+)\\]\\([^)]*[.]md(#[^)]*)?\\)",
  "[\\1](https://cran.r-project.org/package=\\1)",
  readme
)
readme <- gsub("^(#+)(\\s)", "##\\1\\2", readme)

run_id <- env_chr("GITHUB_RUN_ID")
append_summary(c(
  "## revdep2 results",
  "",
  sprintf(
    "`%s` %s (dev) vs %s (CRAN), R %s%s.",
    plan$package, plan$dev_version, plan$cran_version, plan$r_version,
    if (has_run(plan$retry_of)) {
      sprintf(", retry of run %s", run_link(plan$retry_of))
    } else {
      ""
    }
  ),
  "",
  headline,
  "",
  md_table(counts_df),
  "",
  readme,
  "",
  if (nrow(unchecked_df) > 0) {
    # A run where everything defers would put every revdep in this table; the
    # summary has a size limit, and losing it whole is worse than a cut list.
    shown <- utils::head(unchecked_df, 200)
    c(
      sprintf("### Could not be checked (%d)", nrow(unchecked_df)),
      "",
      paste(
        "No comparison was produced for these, so they say nothing about the",
        "dev version either way. The shard job named in `Shard` has the full",
        "check log for each."
      ),
      "",
      md_table(shown),
      if (nrow(shown) < nrow(unchecked_df)) {
        c("", sprintf(
          "... and %d more; the full list is `manifest.json` in the report artifact.",
          nrow(unchecked_df) - nrow(shown)
        ))
      },
      ""
    )
  },
  # What the run cost, in the terms the next plan is sized in. A plan that
  # overestimates buys shards it cannot run in parallel, so these three numbers
  # are worth showing next to the results they came from.
  if (length(package_rows) > 0 || length(shard_rows) > 0) {
    or_unmeasured <- function(x, fmt, ...) {
      if (is.null(x)) "not measured" else sprintf(fmt, x, ...)
    }
    # From the package rows, not the shard rows: a shard whose job died leaves
    # no timing of its own, but the checks it did finish are still in the
    # manifest the collector just merged.
    check_minutes <- sum(vapply(
      package_rows,
      function(p) p$seconds * p$checks / 60,
      numeric(1)
    ))
    job <- vapply(
      shard_rows,
      function(s) s$job_minutes %||% NA_real_,
      numeric(1)
    )
    c(
      "### What this run cost",
      "",
      md_table(data.frame(
        Measured = c(
          "Checks",
          "Check speed",
          "Shard jobs",
          "Setup per shard",
          "Install per dependency"
        ),
        Value = c(
          sprintf(
            "%d in %d package(s), ~%.0f min",
            sum(vapply(package_rows, function(p) p$checks, numeric(1))),
            length(package_rows),
            check_minutes
          ),
          or_unmeasured(cal$check_scale, "%.2f x the time CRAN reports"),
          if (all(is.na(job))) {
            sprintf("%d shard(s), job durations unavailable", length(shard_rows))
          } else {
            sprintf(
              "%d shard(s), median ~%.0f min, longest ~%.0f min",
              length(shard_rows),
              stats::median(job, na.rm = TRUE),
              max(job, na.rm = TRUE)
            )
          },
          or_unmeasured(
            cal$setup_minutes,
            "~%.1f min before the driver starts"
          ),
          or_unmeasured(cal$install_seconds, "~%.1f s")
        ),
        check.names = FALSE
      )),
      "",
      sprintf(
        "The next plan reads these from the `revdep2-timings` artifact of %s and sizes its shards with them.",
        this_run_link("this run")
      ),
      ""
    )
  },
  "### Getting the results",
  "",
  sprintf(
    "The full report -- `problems.md`, `failures.md`, `cran.md` and every check's output -- is the `revdep2-report` artifact of %s.",
    this_run_link("this run")
  ),
  "",
  "```sh",
  sprintf("gh run download %s --name revdep2-report --dir revdep/", run_id),
  "# retry everything that is not ok:",
  sprintf("gh workflow run revdep2.yaml -f retry-run=%s", run_id),
  "```"
))

inform(
  length(entries),
  " package(s): ",
  sum(results_tbl == "ok"),
  " ok, ",
  not_ok,
  " with findings -- see the summary and the revdep2-report artifact"
)
