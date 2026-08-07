# Plan the sharded reverse-dependency check.
#
# Enumerates the reverse dependencies of the package in the current directory,
# weighs each one by what its check is expected to cost on these runners,
# decides which CRAN-baseline results from an earlier run can be reused, and
# partitions the packages into cost-balanced shards. One shard becomes one
# matrix leg of .github/workflows/revdep2.yaml.
#
# The partitioning is greedy, in two phases (see revdep2/README.md for why
# greedy beats an exact formulation here):
#
#   1. The K heaviest packages are dealt round-robin, one per shard, so no two
#      giants share a leg.
#   2. Every remaining package, heaviest first, goes to the shard where its
#      marginal cost is smallest: its own check weight plus an install penalty
#      for each dependency the shard does not already need. The penalty is what
#      pulls packages with overlapping dependency trees onto the same shard.
#
# K is bounded by the parallel capacity, not by the budget alone. Only
# `max-parallel` shards ever run at once, so shard K+1 of a full wave does not
# start any earlier for having been split off -- it just pays another setup.
# The rule is therefore: as many shards as the budget wants while they all fit
# in one wave, and beyond that, whole waves -- as many as the per-shard
# capacity demands, and no more.
#
# The cost model behind all of it -- how fast a check runs here, what a shard
# costs before it checks anything, what one more dependency costs to install --
# is calibrated from the timings artifact of the last runs, and falls back to
# CRAN's numbers and the defaults below when no run has measured anything yet.
#
# Environment variables (inputs):
#   REVDEP2_PACKAGES        - explicit packages to check (comma/space separated;
#                             default: all reverse dependencies)
#   REVDEP2_WHICH           - "strong" (default) or "most" (adds Suggests/
#                             Enhances dependents)
#   REVDEP2_RETRY_RUN       - run id of an earlier revdep2 run; check only the
#                             packages that run could not declare ok
#   REVDEP2_PART            - "i/G": check one G-th of the batch, for a revdep
#                             set too big for a single run (the plan refuses
#                             such a batch and prints the G it needs)
#   REVDEP2_SHARD_BUDGET_MINUTES - check-time target per shard (default: 45)
#   REVDEP2_SHARD_CAPACITY_MINUTES - check minutes one shard may be given at
#                             most, which is what forces a second wave
#                             (default: 80% of REVDEP2_DEADLINE_MINUTES)
#   REVDEP2_MAX_SHARDS      - matrix legs to emit at most (default: 250)
#   REVDEP2_MAX_PARALLEL    - legs to run concurrently, and so the size of one
#                             wave (default: 20)
#   REVDEP2_REFRESH_BASELINE- if truthy, ignore reusable baselines and re-check
#                             the CRAN version of everything
#   REVDEP2_BASELINE_MAX_AGE_DAYS - oldest baseline worth reusing (default: 30)
#   REVDEP2_PREBUILT_MAX_RUNS - earlier runs whose prebuilt package libraries
#                             this run may reuse (default: 5; 0 disables)
#   REVDEP2_PREBUILT_MAX_AGE_DAYS - oldest prebuilt library worth reusing
#                             (default: 14)
#   REVDEP2_HISTORY_RUNS    - earlier runs the donor walk looks at at all
#                             (default: 40)
#   REVDEP2_MEASURED_MAX_RUNS - earlier runs whose measured timings calibrate
#                             the cost model (default: 3; 0 disables)
#   REVDEP2_MEASURED_MAX_AGE_DAYS - oldest measurement worth trusting
#                             (default: 60)
#   REVDEP2_MEASURED_DIR    - offline hook: a directory holding a timings.json,
#                             used instead of walking the run history
#   REVDEP2_CHECK_SCALE     - check seconds here per second CRAN reports;
#                             overrides the measured value (default: measured,
#                             else 1)
#   REVDEP2_SETUP_MINUTES   - fixed cost of one shard before it checks anything;
#                             overrides the measured value (default: measured,
#                             else 6)
#   REVDEP2_INSTALL_SECONDS - marginal install cost charged per dependency a
#                             package adds to its shard; overrides the measured
#                             value (default: measured, else 2.5)
#   REVDEP2_TIMINGS_FILE    - offline hook: RDS or CSV with columns Package and
#                             T_total, used instead of tools::CRAN_check_results()
#   OUT                     - plan file to write (default: plan.json)
#
# Also reads GITHUB_REPOSITORY / GITHUB_SHA / GITHUB_REF_NAME and, for baseline
# discovery, uses the `gh` CLI with GH_TOKEN. Without gh or a token the plan
# simply reuses nothing.

source(file.path(
  dirname(sub("--file=", "", grep("^--file=", commandArgs(), value = TRUE))),
  "util.R"
))

out_path <- env_chr("OUT", "plan.json")
which_input <- match.arg(
  env_chr("REVDEP2_WHICH", "strong"),
  c("strong", "most")
)
depth_raw <- tolower(env_chr("REVDEP2_DEPTH", "1"))
depth <- if (depth_raw %in% c("all", "max", "inf", "infinity")) {
  Inf
} else {
  suppressWarnings(as.numeric(depth_raw))
}
if (is.na(depth) || depth < 1) {
  depth <- 1
}
budget <- env_num("REVDEP2_SHARD_BUDGET_MINUTES", 45)
max_shards <- min(env_num("REVDEP2_MAX_SHARDS", 250), 250)
max_parallel <- env_num("REVDEP2_MAX_PARALLEL", 20)
# A shard stops starting checks at its own deadline and defers the rest, so the
# deadline is what actually caps a shard's check load; the plan aims below it,
# leaving the rest of the job for installing and for the checks running long.
deadline_minutes <- env_num("REVDEP2_DEADLINE_MINUTES", 300)
capacity <- env_num("REVDEP2_SHARD_CAPACITY_MINUTES", 0.8 * deadline_minutes)
refresh_baseline <- env_flag("REVDEP2_REFRESH_BASELINE")
baseline_max_age <- env_num("REVDEP2_BASELINE_MAX_AGE_DAYS", 30)
max_prebuilt_runs <- env_num("REVDEP2_PREBUILT_MAX_RUNS", 5)
prebuilt_max_age <- env_num("REVDEP2_PREBUILT_MAX_AGE_DAYS", 14)
history_runs <- env_num("REVDEP2_HISTORY_RUNS", 40)
max_measured_runs <- env_num("REVDEP2_MEASURED_MAX_RUNS", 3)
measured_max_age <- env_num("REVDEP2_MEASURED_MAX_AGE_DAYS", 60)
overhead_minutes <- env_num("REVDEP2_PACKAGE_OVERHEAD_MINUTES", 0.5)
retry_run <- env_chr("REVDEP2_RETRY_RUN")
repo <- env_chr("GITHUB_REPOSITORY")
timing_flavor <- env_chr("REVDEP2_TIMING_FLAVOR", "r-release-linux-x86_64")

r_version <- paste(
  R.version$major,
  sub("[.].*$", "", R.version$minor),
  sep = "."
)

# ------------------------------------------------------------ empty plans ----

plan_nothing <- function(reason) {
  inform("Planning nothing: ", reason)
  set_output("matrix", '{"shard":["none"]}')
  set_output("shards", "0")
  set_output("packages", "0")
  set_output("max_parallel", "1")
  set_output("baseline_run", "0")
  set_output("plan_hash", "none")
  append_summary(c("## revdep2 plan", "", paste0("Nothing to check: ", reason)))
  quit(save = "no", status = 0)
}

# ------------------------------------------------------------ run history ----

# The gh plumbing itself lives in util.R, because the preflight and the shards
# fetch artifacts too; what is planned here is *which* earlier runs to take
# them from.
#
# One walk over the workflow's completed runs, youngest first, answers every
# question this plan asks of its history, and asks the API for a run's
# artifacts at most once:
#
#   * which run donates the CRAN baseline -- the newest one that still has it;
#   * which runs donate prebuilt package libraries -- as many as it takes to
#     cover everything this run installs, youngest first, each one credited
#     only with what the younger ones did not already have;
#   * which runs donate measured timings -- the youngest few, whose numbers
#     calibrate the cost model below.
#
# The walk stops as soon as it has all of them, and never looks at more than
# `history_runs` runs; reuse is an optimization, and an optimization does not
# get to spend the planning budget.
scan_history <- function(want_baseline, want_timings, needed) {
  empty <- list(
    baseline_run = NULL,
    prebuilt = list(),
    timings = list(),
    timings_runs = character(),
    scanned = 0L,
    missing = needed
  )
  if (!gh_ok() || !nzchar(repo)) {
    return(empty)
  }
  rows <- gh_lines(
    "api",
    sprintf(
      "repos/%s/actions/workflows/revdep2.yaml/runs?status=completed&per_page=%d",
      repo,
      history_runs
    ),
    "--jq",
    ".workflow_runs[] | [.id, .created_at] | @tsv"
  )
  rows <- rows[nzchar(rows)]
  if (length(rows) == 0) {
    return(empty)
  }
  this_run <- env_chr("GITHUB_RUN_ID")
  baseline_run <- NULL
  prebuilt <- list()
  timings <- list()
  timings_runs <- character()
  scanned <- 0L
  for (row in rows) {
    if (
      !want_baseline &&
        length(timings) >= want_timings &&
        (length(needed) == 0 || length(prebuilt) >= max_prebuilt_runs)
    ) {
      break
    }
    fields <- strsplit(row, "\t", fixed = TRUE)[[1]]
    run <- fields[[1]]
    if (identical(run, this_run)) {
      next
    }
    created <- suppressWarnings(as.Date(fields[[2]]))
    scanned <- scanned + 1L
    ids <- run_artifacts(run)
    artifacts <- names(ids)
    if (want_baseline && "revdep2-baseline" %in% artifacts) {
      baseline_run <- run
      want_baseline <- FALSE
    }
    # Timings age the way baselines do: a runner image moves, and with it what
    # a check costs. They are tiny, so taking the youngest few and pooling them
    # is cheaper than trusting a single run that may have been a small retry.
    take_timings <- length(timings) < want_timings &&
      "revdep2-timings" %in% artifacts &&
      !is.na(created) &&
      as.numeric(Sys.Date() - created) <= measured_max_age
    if (take_timings) {
      dir <- fetch_artifact_id(ids[["revdep2-timings"]], tempfile("timings-"))
      measured <- read_timings(dir)
      unlink(dir, recursive = TRUE)
      if (
        !is.null(measured) &&
          identical(measured$platform, R.version$platform)
      ) {
        timings[[length(timings) + 1]] <- measured
        timings_runs <- c(timings_runs, run)
      }
    }
    # A library is only worth carrying while its binaries still match the R
    # series and the platform they were built for, and while the runner image
    # they were built on is plausibly the current one -- which is what the age
    # cap stands in for, the same way it does for baselines.
    take_library <- length(needed) > 0 &&
      length(prebuilt) < max_prebuilt_runs &&
      all(c("revdep2-lib", "revdep2-lib-index") %in% artifacts) &&
      !is.na(created) &&
      as.numeric(Sys.Date() - created) <= prebuilt_max_age
    if (take_library) {
      dir <- fetch_artifact_id(
        ids[["revdep2-lib-index"]],
        tempfile("lib-index-")
      )
      index_path <- if (is.null(dir)) NULL else file.path(dir, "lib.json")
      index <- if (!is.null(index_path) && file.exists(index_path)) {
        read_json(index_path)
      } else {
        NULL
      }
      unlink(dir, recursive = TRUE)
      if (
        !is.null(index) &&
          identical(index$r_version, r_version) &&
          identical(index$platform, R.version$platform)
      ) {
        have <- vapply(index$packages, function(e) e$package, character(1))
        gain <- intersect(needed, have)
        if (length(gain) > 0) {
          prebuilt[[length(prebuilt) + 1]] <- list(
            run_id = run,
            created_at = fields[[2]],
            packages = as.list(gain)
          )
          needed <- setdiff(needed, gain)
        }
      }
    }
  }
  list(
    baseline_run = baseline_run,
    prebuilt = prebuilt,
    timings = timings,
    timings_runs = timings_runs,
    scanned = scanned,
    missing = needed
  )
}

# ------------------------------------------------- the package under test ----

desc <- read.dcf("DESCRIPTION")[1, ]
package <- unname(desc[["Package"]])
dev_version <- unname(desc[["Version"]])
inform("Package under test: ", package, " ", dev_version)

db <- cran_db()
if (!package %in% rownames(db)) {
  plan_nothing(sprintf(
    "%s is not on CRAN, so it has no CRAN reverse dependencies",
    package
  ))
}
cran_version <- unname(db[package, "Version"])
inform("CRAN version: ", cran_version)

# ------------------------------------------------------------- enumeration ---

# Breadth-first over reverse dependencies: level 1 depends on the package
# directly, level 2 on a level-1 package, and so on. Deeper levels break
# through their intermediaries, so checking them still compares CRAN vs dev
# meaningfully. The walk stops at `depth`, or at the fixpoint for "all".
level_of <- integer()
frontier <- package
level <- 0L
while (level < depth && length(frontier) > 0) {
  found <- tools::package_dependencies(
    frontier,
    db = db,
    which = if (which_input == "most") "most" else "strong",
    reverse = TRUE
  )
  fresh <- setdiff(
    unique(unlist(found, use.names = FALSE)),
    c(names(level_of), package)
  )
  level <- level + 1L
  level_of[fresh] <- level
  frontier <- fresh
}
revdeps <- sort(names(level_of))
level_counts <- table(level_of)
inform(
  length(revdeps),
  " reverse dependencies (",
  which_input,
  ", depth ",
  depth_raw,
  if (length(level_counts) > 1) {
    paste0(
      "; ",
      paste0("level ", names(level_counts), ": ", level_counts, collapse = ", ")
    )
  } else {
    ""
  },
  ")"
)

# `selection` goes into plan.json, so it stays plain; `selection_md` is the
# same thing with the run id clickable, for the job summary.
selection <- "all"
selection_md <- NULL
retry_manifest <- NULL
packages_input <- trimws(strsplit(
  env_chr("REVDEP2_PACKAGES"),
  "[,[:space:]]+"
)[[1]])
packages_input <- packages_input[nzchar(packages_input)]

if (length(packages_input) > 0) {
  selection <- "explicit"
  candidates <- unique(packages_input)
} else if (nzchar(retry_run)) {
  selection <- sprintf("retry of run %s", retry_run)
  selection_md <- sprintf("retry of run %s", run_link(retry_run))
  dir <- fetch_artifact(retry_run, "revdep2-report", tempfile("retry-"))
  manifest_path <- if (is.null(dir)) NULL else file.path(dir, "manifest.json")
  if (is.null(manifest_path) || !file.exists(manifest_path)) {
    stop(
      "Cannot fetch the revdep2-report artifact of run ",
      retry_run,
      call. = FALSE
    )
  }
  retry_manifest <- read_json(manifest_path)
  results <- vapply(retry_manifest, function(e) e$result, character(1))
  candidates <- vapply(retry_manifest, function(e) e$package, character(1))[
    vapply(results, needs_recheck, logical(1))
  ]
  inform(
    "Retrying ",
    length(candidates),
    " of ",
    length(retry_manifest),
    " packages from run ",
    retry_run
  )
} else {
  candidates <- revdeps
}

dropped <- setdiff(candidates, rownames(db))
if (length(dropped) > 0) {
  inform("Not on CRAN, dropped: ", paste(dropped, collapse = ", "))
}
packages <- intersect(candidates, rownames(db))
if (length(packages) == 0) {
  plan_nothing("no packages left to check")
}
their_version <- setNames(unname(db[packages, "Version"]), packages)

# ------------------------------------------------------------------ weights --

timings_file <- env_chr("REVDEP2_TIMINGS_FILE")
if (nzchar(timings_file)) {
  inform("Reading check timings from ", timings_file)
  timings <- if (grepl("[.]rds$", timings_file)) {
    readRDS(timings_file)
  } else {
    utils::read.csv(timings_file)
  }
} else {
  inform("Fetching CRAN check timings (flavor ", timing_flavor, ")")
  timings <- tools::CRAN_check_results()
  timings <- timings[timings$Flavor == timing_flavor, c("Package", "T_total")]
}
t_total <- setNames(
  as.numeric(timings$T_total)[match(packages, timings$Package)],
  packages
)
known <- !is.na(t_total)
fallback <- if (any(known)) stats::median(t_total[known]) else 300
t_total[!known] <- fallback
t_total <- pmax(t_total, 60)

# ---------------------------------------------------------------- parts -----

# `part: i/G` takes one G-th of the batch, for a revdep set too big to check in
# one run (see the refusal in the partitioning section, which computes G and
# prints the dispatch lines). The cut is made here, on CRAN's times, because
# everything downstream -- closures, the dependency universe, the prebuilt
# lookup -- should see only the packages this run will check.
#
# Dealing the weight-ordered list round robin keeps the parts of similar size
# without any coordination between the runs: each one re-derives the same
# order from the same CRAN metadata. A package that moves between dispatches
# can land in another part or in none; `retry-run` on the union is the sweep
# for that, and nothing here depends on the parts being exact.
part_input <- trimws(env_chr("REVDEP2_PART"))
part <- NULL
if (nzchar(part_input)) {
  fields <- suppressWarnings(as.integer(strsplit(part_input, "/")[[1]]))
  if (
    length(fields) != 2 ||
      anyNA(fields) ||
      fields[[1]] < 1 ||
      fields[[2]] < 1 ||
      fields[[1]] > fields[[2]]
  ) {
    stop(
      "REVDEP2_PART must be `i/G` with 1 <= i <= G, not ",
      part_input,
      call. = FALSE
    )
  }
  part <- list(index = fields[[1]], of = fields[[2]])
  mine <- order(-t_total)[
    seq(part$index, length(packages), by = part$of)
  ]
  packages <- sort(packages[mine])
  t_total <- t_total[packages]
  known <- known[packages]
  their_version <- their_version[packages]
  suffix <- sprintf(", part %d of %d", part$index, part$of)
  selection <- paste0(selection, suffix)
  if (!is.null(selection_md)) {
    selection_md <- paste0(selection_md, suffix)
  }
  inform(
    "Part ",
    part$index,
    " of ",
    part$of,
    ": ",
    length(packages),
    " packages, ~",
    round(sum(t_total) / 60),
    " CRAN check minutes"
  )
  if (length(packages) == 0) {
    plan_nothing(sprintf("part %d of %d is empty", part$index, part$of))
  }
}
inform(
  sum(known),
  " of ",
  length(packages),
  " check times known from CRAN; ",
  "median fallback ",
  round(fallback),
  "s for the rest"
)

# --------------------------------------------------------------- closures ----

inform("Computing dependency closures")
closure <- install_closure(packages, db)
fingerprint <- vapply(
  packages,
  function(p) dep_fingerprint(closure[[p]], db),
  character(1)
)

# The dev version's own dependencies: every shard installs the dev binary, so
# every shard needs them even when no revdep pulls them in. Parsed from the
# checkout's DESCRIPTION, resolved against CRAN.
parse_dep_field <- function(field) {
  value <- desc[field]
  if (is.na(value)) {
    return(character())
  }
  entries <- strsplit(value, ",")[[1]]
  names <- trimws(sub("[([].*$", "", entries))
  names[nzchar(names) & names != "R"]
}
dev_deps <- unique(unlist(lapply(
  c("Depends", "Imports", "LinkingTo"),
  parse_dep_field
)))
dev_deps <- intersect(dev_deps, rownames(db))
dev_closure <- sort(setdiff(
  unique(c(
    dev_deps,
    unlist(
      tools::package_dependencies(dev_deps, db = db, which = "strong", recursive = TRUE),
      use.names = FALSE
    )
  )),
  base_packages()
))

# Everything this run installs anywhere: the union of the revdeps' closures
# and the dev version's own dependencies. It prices the partitioning penalty
# below, and it is the set the prebuilt libraries of earlier runs are matched
# against.
universe <- unique(c(unlist(closure, use.names = FALSE), dev_closure))

# ------------------------------------------------------------ earlier runs ---

local_baseline <- env_chr("REVDEP2_BASELINE_DIR")
local_measured <- env_chr("REVDEP2_MEASURED_DIR")
history <- scan_history(
  # A retried run donates its own baseline, and the offline hooks bypass
  # discovery entirely; whatever is supplied that way, the walk stops looking
  # for.
  want_baseline = !refresh_baseline &&
    !nzchar(local_baseline) &&
    !nzchar(retry_run),
  want_timings = if (nzchar(local_measured)) 0 else max_measured_runs,
  needed = universe
)

# ---------------------------------------------------------------- baseline ---

baseline_run <- "0"
baseline_manifest <- list()
if (refresh_baseline) {
  inform("Baseline reuse disabled by input")
} else if (nzchar(local_baseline)) {
  # Offline hook for testing the eligibility rules without a GitHub run: a
  # directory holding baseline.json, e.g. a downloaded revdep2-baseline
  # artifact. The shard reads the same directory through BASELINE_DIR.
  manifest_path <- file.path(local_baseline, "baseline.json")
  if (file.exists(manifest_path)) {
    entries <- read_json(manifest_path)
    baseline_manifest <- setNames(
      entries,
      vapply(entries, function(e) e$package, character(1))
    )
    inform(
      "Baseline from ",
      local_baseline,
      " (",
      length(baseline_manifest),
      " entries)"
    )
  }
} else {
  donor <- if (nzchar(retry_run)) retry_run else history$baseline_run
  if (is.null(donor) || !nzchar(donor)) {
    inform("No earlier run with a baseline artifact found")
  } else {
    dir <- fetch_artifact(donor, "revdep2-baseline", tempfile("baseline-"))
    manifest_path <- if (is.null(dir)) NULL else file.path(dir, "baseline.json")
    if (is.null(manifest_path) || !file.exists(manifest_path)) {
      inform(
        "Baseline artifact of run ",
        donor,
        " is unavailable; reusing nothing"
      )
    } else {
      baseline_run <- run_id_chr(donor)
      entries <- read_json(manifest_path)
      baseline_manifest <- setNames(
        entries,
        vapply(entries, function(e) e$package, character(1))
      )
      inform(
        "Baseline donor: run ",
        donor,
        " (",
        length(baseline_manifest),
        " entries)"
      )
    }
  }
}

# Reuse an old-version verdict only when everything that shaped it is
# unchanged: the revdep's version, the CRAN version of the package under test,
# the R series, and the resolved versions of the whole install closure -- plus
# an age cap as the backstop for what metadata cannot see (system libraries,
# the runner image).
baseline_verdict <- function(p) {
  e <- baseline_manifest[[p]]
  if (is.null(e)) {
    return("none")
  }
  if (!identical(e$version, unname(their_version[[p]]))) {
    return("their-version")
  }
  if (!identical(e$our_cran_version, cran_version)) {
    return("our-version")
  }
  if (!identical(e$r_version, r_version)) {
    return("r-version")
  }
  if (!identical(e$dep_fingerprint, unname(fingerprint[[p]]))) {
    return("dependencies")
  }
  checked <- suppressWarnings(as.Date(e$checked_at))
  if (is.na(checked) || as.numeric(Sys.Date() - checked) > baseline_max_age) {
    return("age")
  }
  if (!isTRUE(e$has_old)) {
    return("missing-rds")
  }
  "reuse"
}
verdicts <- vapply(packages, baseline_verdict, character(1))
reuse <- verdicts == "reuse"
if (has_run(baseline_run)) {
  stale <- table(verdicts[!reuse])
  inform(
    "Baseline: ",
    sum(reuse),
    " reusable, ",
    sum(!reuse),
    " to check fresh",
    if (length(stale) > 0) {
      paste0(" (", paste(names(stale), stale, sep = ": ", collapse = ", "), ")")
    } else {
      ""
    }
  )
}

# --------------------------------------------------------------- prebuilt ---

# What the preflight and the shards will unpack instead of building. Recording
# it here rather than letting every job walk the history itself keeps the
# decision in one place, makes it inspectable in the plan and the summary, and
# spends the API calls once.
prebuilt <- history$prebuilt
prebuilt_covered <- length(universe) - length(history$missing)
if (length(prebuilt) > 0) {
  inform(
    "Prebuilt libraries: ",
    prebuilt_covered,
    " of ",
    length(universe),
    " packages from ",
    length(prebuilt),
    " run(s) (",
    paste(
      vapply(
        prebuilt,
        function(d) sprintf("%s: %d", d$run_id, length(d$packages)),
        character(1)
      ),
      collapse = ", "
    ),
    ")"
  )
} else if (max_prebuilt_runs > 0) {
  inform(
    "No reusable prebuilt package library found; everything is installed fresh"
  )
}

# ------------------------------------------------------------- calibration ---

# CRAN's `T_total` ranks packages well and predicts minutes here badly: it
# comes from a different machine under a different load, and it is the only
# number available for a package this workflow has never checked. So the last
# runs' own measurements come first, and CRAN's number is scaled by what those
# runs say the ratio between the two is.
#
# Every constant is overridable by hand, and every fallback is the value that
# was hard-coded before anything measured itself.
measured_runs <- if (nzchar(local_measured)) {
  # Offline hook for reading a downloaded revdep2-timings artifact, the way
  # REVDEP2_BASELINE_DIR reads a downloaded baseline.
  Filter(Negate(is.null), list(read_timings(local_measured)))
} else {
  history$timings
}
cal <- calibration(measured_runs)
measured_seconds <- measured_check_seconds(measured_runs)

check_scale <- env_num_opt("REVDEP2_CHECK_SCALE") %||% cal$check_scale %||% 1
setup_minutes <- env_num_opt("REVDEP2_SETUP_MINUTES") %||%
  cal$setup_minutes %||%
  6
install_seconds <- env_num_opt("REVDEP2_INSTALL_SECONDS") %||%
  cal$install_seconds %||%
  2.5

if (length(measured_runs) > 0) {
  inform(
    sprintf(
      "Calibrated from %d run(s) (%s): checks run at %.2fx their CRAN time, %.1f min setup per shard, %.1f s per dependency installed",
      length(measured_runs),
      paste(
        if (nzchar(local_measured)) local_measured else history$timings_runs,
        collapse = ", "
      ),
      check_scale,
      setup_minutes,
      install_seconds
    )
  )
} else {
  inform(
    "No measured timings found; using CRAN check times as they are, with the default shard costs"
  )
}

# What one check of each package is expected to cost *here*: what the last runs
# measured, or CRAN's time scaled to this machine. The floor keeps a package
# with an implausibly small measurement from looking free.
check_seconds <- t_total * check_scale
seen <- intersect(packages, names(measured_seconds))
check_seconds[seen] <- measured_seconds[seen]
check_seconds <- pmax(check_seconds, 30)
timing_source <- ifelse(
  packages %in% seen,
  "measured",
  ifelse(known, "cran", "median")
)
inform(
  sum(packages %in% seen),
  " of ",
  length(packages),
  " check times measured by an earlier run"
)

# Weight: one check of the revdep costs what it is expected to cost here; a
# package without a reusable baseline is checked twice.
weight <- ((!reuse) + 1) * check_seconds / 60 + overhead_minutes

# ------------------------------------------------------------- partitioning --

n <- length(packages)
total_check <- sum(weight)

# How many shards can actually run at the same time. Everything past that waits
# for a lane, so the shard count is counted in waves of this size.
lanes <- max(1L, min(as.integer(max_parallel), as.integer(max_shards), n))

# Two demands, and they do not agree once the batch is large:
#
#   * the budget wants shards of at most `budget` check minutes -- short legs,
#     quick feedback, cheap re-runs;
#   * the capacity says a shard can hold `capacity` check minutes before its
#     own deadline starts deferring packages.
#
# While the budget's answer fits in one wave, it wins: those shards all start
# at once, so cutting finer really does buy wall clock. Past that it stops
# buying anything -- shard 21 of 40 waits for shard 1 to finish either way, and
# arrives having paid a second setup for the privilege. So beyond one wave the
# capacity decides, and it decides in whole waves: as many as it takes to keep
# every shard under its deadline, and not one more.
by_budget <- max(1L, as.integer(ceiling(total_check / budget)))
by_capacity <- max(1L, as.integer(ceiling(total_check / max(capacity, 1))))
# Neither dial may be violated inside a wave, so the larger of the two wins
# there; a capacity smaller than the budget is a contradiction, and the one
# that keeps shards inside their deadline is the one to honour.
k <- if (max(by_budget, by_capacity) <= lanes) {
  max(by_budget, by_capacity)
} else {
  lanes * as.integer(ceiling(by_capacity / lanes))
}
max_k <- max(1L, min(as.integer(max_shards), n))
k <- max(1L, min(k, max_k))
inform(
  sprintf(
    "%d packages, ~%.0f check minutes; budget %.0f min asks for %d shard(s), capacity %.0f min needs %d, %d lane(s) -> %d shard(s), ~%.0f check min each",
    n,
    total_check,
    budget,
    by_budget,
    capacity,
    by_capacity,
    lanes,
    k,
    total_check / k
  )
)

dep_idx <- lapply(closure, function(deps) match(deps, universe))
penalty <- install_seconds / 60

ord <- order(-weight)

# The greedy pass, for a given shard count. It is cheap enough (O(n x K) with a
# bitmap per shard) to run more than once, which is what lets the deadline
# check below see a real partition rather than an average.
partition <- function(k) {
  assignment <- integer(n)
  load <- rep(setup_minutes + length(dev_closure) * penalty, k)
  check_load <- numeric(k)
  have <- matrix(FALSE, nrow = length(universe), ncol = k)
  have[match(dev_closure, universe), ] <- TRUE

  place <- function(i, s) {
    p <- ord[[i]]
    fresh <- sum(!have[dep_idx[[p]], s])
    assignment[[p]] <<- s
    check_load[[s]] <<- check_load[[s]] + weight[[p]]
    load[[s]] <<- load[[s]] + weight[[p]] + fresh * penalty
    have[dep_idx[[p]], s] <<- TRUE
  }

  # Phase 1: the K heaviest packages, dealt round-robin.
  for (i in seq_len(min(k, n))) {
    place(i, i)
  }

  # Phase 2: everything else goes where it costs least, dependency reuse folded
  # into the price.
  if (n > k) {
    for (i in seq(k + 1L, n)) {
      p <- ord[[i]]
      fresh <- colSums(!have[dep_idx[[p]], , drop = FALSE])
      score <- load + weight[[p]] + fresh * penalty
      place(i, which.min(score))
    }
  }

  list(assignment = assignment, load = load, check_load = check_load)
}

# `capacity` bounds the *checks* a shard may hold; the shard also spends its
# setup and its installs inside the same deadline, and only a real partition
# says how much that is -- the install union of a shard is not a per-package
# constant. So the estimate is checked against the deadline here, and a shard
# count that cannot hold it grows by whole waves until it can.
fit <- partition(k)
while (max(fit$load) > deadline_minutes && k < max_k) {
  grown <- min(as.integer(k + lanes), max_k)
  inform(sprintf(
    "Heaviest shard estimated at ~%.0f min, past the %.0f min deadline; growing to %d shard(s)",
    max(fit$load),
    deadline_minutes,
    grown
  ))
  k <- grown
  fit <- partition(k)
}
assignment <- fit$assignment
load <- fit$load
check_load <- fit$check_load
waves <- as.integer(ceiling(k / lanes))

# Out of room: the matrix limit (or the package count) caps the shards below
# what the work needs, so every shard would run into its deadline and defer.
# That is a plan worth refusing -- a run started this way spends hours to
# report half its packages as deferred, and says so only at the end.
#
# How many runs it takes instead: splitting into G parts divides a shard's
# check load by G, but not its setup or its installs, so the question is how
# much of the deadline is left for checks once those are paid.
plan_too_big <- function() {
  worst <- which.max(load)
  overhead <- load[[worst]] - check_load[[worst]]
  headroom <- deadline_minutes - overhead
  # A package is never split across shards, so one package heavier than the
  # room a shard has is a wall that no number of parts gets around. Say which
  # package, and stop recommending a split that cannot work.
  giants <- names(weight)[weight > headroom]
  parts <- if (headroom <= 0 || length(giants) > 0) {
    NA_integer_
  } else {
    max(2L, as.integer(ceiling(check_load[[worst]] / headroom)))
  }
  inform(sprintf(
    "Too big for one run: %d shard(s) is the limit, and the heaviest would be ~%.0f min against a %.0f min deadline",
    k,
    load[[worst]],
    deadline_minutes
  ))
  append_summary(c(
    "## revdep2 plan",
    "",
    "**Too big for one run — nothing was started.**",
    "",
    sprintf(
      "%d packages need ~%.0f check minutes. At most %d shard%s can be planned (%s), which puts the heaviest at ~%.0f min: ~%.0f min of checks on top of ~%.0f min of setup and installs, against the %.0f min a shard has before its deadline starts deferring packages.",
      n,
      total_check,
      max_k,
      if (max_k == 1) "" else "s",
      if (max_k < as.integer(max_shards)) {
        sprintf("one per package, and there are only %d", n)
      } else {
        sprintf("`max-shards`, itself capped at 250 by the matrix limit")
      },
      load[[worst]],
      check_load[[worst]],
      overhead,
      deadline_minutes
    ),
    "",
    if (headroom <= 0) {
      c(
        sprintf(
          "Setup and installs alone (~%.0f min) already exceed the deadline, so splitting the packages will not help: raise `REVDEP2_DEADLINE_MINUTES` (and the job's `timeout-minutes`, up to GitHub's 6 h ceiling) first.",
          overhead
        ),
        ""
      )
    } else if (length(giants) > 0) {
      # Naming them matters: this is the one case where the operator has to
      # decide something (wait longer, or check less), and the decision is
      # about these packages specifically.
      c(
        sprintf(
          "%s alone %s more than the ~%.0f min a shard has left for checks, and a package is never split across shards — so no `part` split helps here.",
          paste0("`", paste(utils::head(sort(giants), 5), collapse = "`, `"), "`"),
          if (length(giants) == 1) "needs" else "need",
          headroom
        ),
        "",
        sprintf(
          "Raise `REVDEP2_DEADLINE_MINUTES` (now %.0f) and the shard job's `timeout-minutes` (now 350, GitHub's ceiling is 6 h), or leave %s out of the run with an explicit `packages` list.",
          deadline_minutes,
          if (length(giants) == 1) "it" else "them"
        ),
        ""
      )
    } else {
      c(
        sprintf("Split it into %d runs, each an independent report:", parts),
        "",
        "```sh",
        paste0(
          sprintf(
            "gh workflow run revdep2.yaml -f part=%d/%d",
            seq_len(parts),
            parts
          ),
          collapse = "\n"
        ),
        "```",
        "",
        paste(
          "The parts are cut from the same weight-ordered list, dealt round",
          "robin, so they are of similar size and together cover everything —",
          "and each part re-plans itself, so a part that is still too big says",
          "so in turn. They share baselines and prebuilt libraries through the",
          "usual artifacts, so the later parts start warmer than the first."
        ),
        ""
      )
    },
    "Or keep it in one run by making the shards fit:",
    "",
    sprintf(
      "* `max-parallel` above %d does not change this — the limit is how many shards may exist (250), not how many run at once.",
      max_parallel
    ),
    sprintf(
      "* raise `shard-capacity-minutes` (now %.0f) only together with `REVDEP2_DEADLINE_MINUTES` (now %.0f) and the shard job's `timeout-minutes` (350): the deadline is what a shard actually has.",
      capacity,
      deadline_minutes
    ),
    "* pass an explicit `packages` list, or a smaller `depth`, to check less.",
    ""
  ))
  quit(save = "no", status = 1)
}
if (max(load) > deadline_minutes) {
  plan_too_big()
}

inform(sprintf(
  "%d shard(s) in %d wave(s); heaviest ~%.0f min (checks ~%.0f, deadline %.0f)",
  k,
  waves,
  max(load),
  max(check_load),
  deadline_minutes
))

# ------------------------------------------------------------------ output ---

shard_list <- lapply(seq_len(k), function(s) {
  members <- packages[assignment == s]
  members <- members[order(-weight[members])]
  install <- sort(unique(c(
    dev_closure,
    unlist(closure[members], use.names = FALSE)
  )))
  list(
    index = s,
    estimate_minutes = round(load[[s]], 1),
    check_minutes = round(check_load[[s]], 1),
    install_packages = length(install),
    install = as.list(install),
    packages = lapply(members, function(p) {
      list(
        name = p,
        version = unname(their_version[[p]]),
        level = if (p %in% names(level_of)) unname(level_of[[p]]) else 0L,
        weight_minutes = round(unname(weight[[p]]), 2),
        t_total = unname(t_total[[p]]),
        check_seconds = round(unname(check_seconds[[p]])),
        timing_source = timing_source[[match(p, packages)]],
        dep_fingerprint = unname(fingerprint[[p]]),
        baseline = unname(reuse[[p]])
      )
    })
  )
})

# The dispatched ref and the checked-out tree differ when the `ref` input
# names another branch or SHA; the tree is what is being tested.
head_sha <- tryCatch(
  system2("git", c("rev-parse", "HEAD"), stdout = TRUE, stderr = NULL)[[1]],
  error = function(e) ""
)
if (!nzchar(head_sha)) {
  head_sha <- env_chr("GITHUB_SHA")
}

plan <- list(
  package = package,
  dev_version = dev_version,
  cran_version = cran_version,
  r_version = r_version,
  sha = head_sha,
  ref = env_chr("GITHUB_REF_NAME"),
  which = which_input,
  depth = depth_raw,
  levels = as.list(level_counts),
  selection = selection,
  part = part,
  generated_at = now_utc(),
  timing_flavor = timing_flavor,
  retry_of = if (nzchar(retry_run)) run_id_chr(retry_run) else "0",
  baseline = list(
    run_id = baseline_run,
    max_age_days = baseline_max_age,
    reused = sum(reuse),
    fresh = sum(!reuse)
  ),
  prebuilt = list(
    max_runs = max_prebuilt_runs,
    max_age_days = prebuilt_max_age,
    runs_scanned = history$scanned,
    covered = prebuilt_covered,
    missing = length(history$missing),
    runs = prebuilt
  ),
  calibration = list(
    runs = if (nzchar(local_measured)) {
      as.list(local_measured)
    } else {
      as.list(history$timings_runs)
    },
    max_runs = max_measured_runs,
    max_age_days = measured_max_age,
    packages_measured = sum(packages %in% seen),
    check_scale = round(check_scale, 3),
    setup_minutes = round(setup_minutes, 2),
    install_seconds = round(install_seconds, 2)
  ),
  params = list(
    shard_budget_minutes = budget,
    shard_capacity_minutes = capacity,
    max_shards = max_shards,
    max_parallel = max_parallel,
    lanes = lanes,
    waves = waves,
    install_seconds_per_package = install_seconds,
    setup_minutes = setup_minutes,
    package_overhead_minutes = overhead_minutes
  ),
  totals = list(
    revdeps = length(revdeps),
    packages = n,
    check_minutes = round(total_check, 1),
    estimate_minutes = round(sum(load), 1),
    wave_minutes = round(waves * max(load), 1),
    install_union = length(universe)
  ),
  dropped_unknown = as.list(dropped),
  install_union = as.list(sort(universe)),
  dev_closure = as.list(dev_closure),
  shards = shard_list
)
write_json(plan, out_path)
plan_hash <- unname(tools::md5sum(out_path))
inform("Plan written to ", out_path)

parallel <- max(1L, min(as.integer(max_parallel), k))
matrix <- list(
  include = lapply(shard_list, function(s) {
    list(
      shard = s$index,
      label = sprintf(
        "%d pkgs, ~%.0f min",
        length(s$packages),
        s$estimate_minutes
      )
    )
  })
)

set_output("matrix", jsonlite::toJSON(matrix, auto_unbox = TRUE))
set_output("shards", as.character(k))
set_output("packages", as.character(n))
set_output("max_parallel", as.character(parallel))
set_output("baseline_run", baseline_run)
set_output("plan_hash", plan_hash)

# ------------------------------------------------------------------ summary --

top <- function(s) {
  names <- vapply(s$packages, function(p) p$name, character(1))
  paste(utils::head(names, 3), collapse = ", ")
}
summary_df <- data.frame(
  Shard = vapply(shard_list, function(s) s$index, integer(1)),
  Packages = vapply(shard_list, function(s) length(s$packages), integer(1)),
  `Check est.` = sprintf(
    "~%.0f min",
    vapply(shard_list, function(s) s$check_minutes, numeric(1))
  ),
  `Total est.` = sprintf(
    "~%.0f min",
    vapply(shard_list, function(s) s$estimate_minutes, numeric(1))
  ),
  Installs = vapply(shard_list, function(s) s$install_packages, integer(1)),
  Heaviest = vapply(shard_list, top, character(1)),
  check.names = FALSE
)
append_summary(c(
  "## revdep2 plan",
  "",
  if (env_flag("REVDEP2_DRY_RUN")) c("**Dry run: planning only, no checks started.**", ""),
  "| | |",
  "| --- | --- |",
  sprintf("| Package | `%s` %s (CRAN: %s) |", package, dev_version, cran_version),
  sprintf("| Selection | %s |", selection_md %||% selection),
  sprintf(
    "| Packages to check | %d (of %d revdeps%s) |",
    n,
    length(revdeps),
    if (length(level_counts) > 1) {
      paste0(
        "; ",
        paste0("level ", names(level_counts), ": ", level_counts, collapse = ", ")
      )
    } else {
      ""
    }
  ),
  sprintf(
    "| Baseline | %s |",
    if (length(baseline_manifest) > 0) {
      sprintf(
        "%s: %d reused, %d fresh",
        if (has_run(baseline_run)) {
          paste("run", run_link(baseline_run))
        } else {
          "local"
        },
        sum(reuse),
        sum(!reuse)
      )
    } else {
      "none"
    }
  ),
  sprintf(
    "| Prebuilt packages | %s |",
    if (length(prebuilt) > 0) {
      sprintf(
        "%d of %d from run%s %s",
        prebuilt_covered,
        length(universe),
        if (length(prebuilt) > 1) "s" else "",
        paste(
          vapply(prebuilt, function(d) run_link(d$run_id), character(1)),
          collapse = ", "
        )
      )
    } else {
      "none"
    }
  ),
  sprintf(
    "| Cost model | %s |",
    if (length(measured_runs) > 0) {
      sprintf(
        "measured by %s: checks at %.2f&times; their CRAN time, %.1f min setup per shard, %.1f s per dependency installed (%d of %d packages timed here before)",
        if (nzchar(local_measured)) {
          sprintf("`%s`", local_measured)
        } else {
          sprintf(
            "run%s %s",
            if (length(history$timings_runs) > 1) "s" else "",
            paste(
              vapply(history$timings_runs, run_link, character(1)),
              collapse = ", "
            )
          )
        },
        check_scale,
        setup_minutes,
        install_seconds,
        sum(packages %in% seen),
        n
      )
    } else {
      "uncalibrated: CRAN check times as they are, default shard costs"
    }
  ),
  sprintf(
    "| Shards | %d in %d wave(s) of %d (budget %.0f min, capacity %.0f min per shard) |",
    k,
    waves,
    parallel,
    budget,
    capacity
  ),
  sprintf(
    "| Estimated wall clock | ~%.0f min (%d wave(s) of ~%.0f min) |",
    waves * max(load),
    waves,
    max(load)
  ),
  sprintf("| Estimated runner time | ~%.0f min |", sum(load)),
  "",
  # A run in more than one wave is waiting on lanes, not on work, and the
  # dispatch form is where that is fixed -- so say it here, with the number.
  if (waves > 1) {
    c(
      sprintf(
        "These %d shards run %d at a time, so %d waves. Dispatching with `max-parallel: %d` would run them in one, at roughly %.0f min instead of %.0f — worth it if that many runners are available.",
        k,
        lanes,
        waves,
        k,
        max(load),
        waves * max(load)
      ),
      ""
    )
  },
  md_table(summary_df)
))
