# Plan the sharded reverse-dependency check.
#
# Enumerates the reverse dependencies of the package in the current directory,
# weighs each one by the time CRAN's own check machine spends on it, decides
# which CRAN-baseline results from an earlier run can be reused, and partitions
# the packages into cost-balanced shards. One shard becomes one matrix leg of
# .github/workflows/revdep2.yaml.
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
# K itself is the smallest shard count whose average check load fits the
# per-shard budget, capped by the matrix limit -- so wall clock is bought with
# more shards until the budget says the shards are small enough.
#
# Environment variables (inputs):
#   REVDEP2_PACKAGES        - explicit packages to check (comma/space separated;
#                             default: all reverse dependencies)
#   REVDEP2_WHICH           - "strong" (default) or "most" (adds Suggests/
#                             Enhances dependents)
#   REVDEP2_RETRY_RUN       - run id of an earlier revdep2 run; check only the
#                             packages that run could not declare ok
#   REVDEP2_SHARD_BUDGET_MINUTES - check-time target per shard (default: 45)
#   REVDEP2_MAX_SHARDS      - matrix legs to emit at most (default: 250)
#   REVDEP2_MAX_PARALLEL    - legs to run concurrently (default: 20)
#   REVDEP2_REFRESH_BASELINE- if truthy, ignore reusable baselines and re-check
#                             the CRAN version of everything
#   REVDEP2_BASELINE_MAX_AGE_DAYS - oldest baseline worth reusing (default: 30)
#   REVDEP2_PREBUILT_MAX_RUNS - earlier runs whose prebuilt package libraries
#                             this run may reuse (default: 5; 0 disables)
#   REVDEP2_PREBUILT_MAX_AGE_DAYS - oldest prebuilt library worth reusing
#                             (default: 14)
#   REVDEP2_HISTORY_RUNS    - earlier runs the donor walk looks at at all
#                             (default: 40)
#   REVDEP2_INSTALL_SECONDS - marginal install cost charged per dependency a
#                             package adds to its shard (default: 2.5)
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
refresh_baseline <- env_flag("REVDEP2_REFRESH_BASELINE")
baseline_max_age <- env_num("REVDEP2_BASELINE_MAX_AGE_DAYS", 30)
max_prebuilt_runs <- env_num("REVDEP2_PREBUILT_MAX_RUNS", 5)
prebuilt_max_age <- env_num("REVDEP2_PREBUILT_MAX_AGE_DAYS", 14)
history_runs <- env_num("REVDEP2_HISTORY_RUNS", 40)
install_seconds <- env_num("REVDEP2_INSTALL_SECONDS", 2.5)
setup_minutes <- env_num("REVDEP2_SETUP_MINUTES", 6)
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
# One walk over the workflow's completed runs, youngest first, answers both
# questions this plan asks of its history, and asks the API for a run's
# artifacts at most once:
#
#   * which run donates the CRAN baseline -- the newest one that still has it;
#   * which runs donate prebuilt package libraries -- as many as it takes to
#     cover everything this run installs, youngest first, each one credited
#     only with what the younger ones did not already have.
#
# The walk stops as soon as it has both, and never looks at more than
# `history_runs` runs; reuse is an optimization, and an optimization does not
# get to spend the planning budget.
scan_history <- function(want_baseline, needed) {
  empty <- list(
    baseline_run = NULL,
    prebuilt = list(),
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
  scanned <- 0L
  for (row in rows) {
    if (
      !want_baseline &&
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

selection <- "all"
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
history <- scan_history(
  # A retried run donates its own baseline, and the two offline hooks bypass
  # discovery entirely; the walk then only looks for prebuilt libraries.
  want_baseline = !refresh_baseline &&
    !nzchar(local_baseline) &&
    !nzchar(retry_run),
  needed = universe
)

# ---------------------------------------------------------------- baseline ---

baseline_run <- 0L
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
      baseline_run <- as.integer(donor)
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
if (baseline_run > 0) {
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

# Weight: one check of the revdep costs about what CRAN's Linux machine spends
# on it end to end; a package without a reusable baseline is checked twice.
weight <- ((!reuse) + 1) * t_total / 60 + overhead_minutes

# ------------------------------------------------------------- partitioning --

n <- length(packages)
total_check <- sum(weight)
k <- max(1L, min(as.integer(ceiling(total_check / budget)), max_shards, n))
inform(
  sprintf(
    "%d packages, ~%.0f check minutes, budget %.0f min/shard -> %d shard(s)",
    n,
    total_check,
    budget,
    k
  )
)

dep_idx <- lapply(closure, function(deps) match(deps, universe))
penalty <- install_seconds / 60

ord <- order(-weight)
assignment <- integer(n)
load <- rep(setup_minutes + length(dev_closure) * penalty, k)
check_load <- numeric(k)
install_count <- rep(length(dev_closure), k)
have <- matrix(FALSE, nrow = length(universe), ncol = k)
have[match(dev_closure, universe), ] <- TRUE

place <- function(i, s) {
  p <- ord[[i]]
  fresh <- sum(!have[dep_idx[[p]], s])
  assignment[[p]] <<- s
  check_load[[s]] <<- check_load[[s]] + weight[[p]]
  load[[s]] <<- load[[s]] + weight[[p]] + fresh * penalty
  install_count[[s]] <<- install_count[[s]] + fresh
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
        timing_source = if (known[[match(p, packages)]]) "cran" else "median",
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
  generated_at = now_utc(),
  timing_flavor = timing_flavor,
  retry_of = if (nzchar(retry_run)) as.integer(retry_run) else 0L,
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
  params = list(
    shard_budget_minutes = budget,
    max_shards = max_shards,
    max_parallel = max_parallel,
    install_seconds_per_package = install_seconds,
    setup_minutes = setup_minutes,
    package_overhead_minutes = overhead_minutes
  ),
  totals = list(
    revdeps = length(revdeps),
    packages = n,
    check_minutes = round(total_check, 1),
    estimate_minutes = round(sum(load), 1),
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
set_output("baseline_run", as.character(baseline_run))
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
  sprintf("| Selection | %s |", selection),
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
        if (baseline_run > 0) sprintf("run %d", baseline_run) else "local",
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
        paste(vapply(prebuilt, function(d) d$run_id, character(1)), collapse = ", ")
      )
    } else {
      "none"
    }
  ),
  sprintf("| Shards | %d (max-parallel %d, budget %.0f min) |", k, parallel, budget),
  sprintf("| Estimated runner time | ~%.0f min |", sum(load)),
  "",
  md_table(summary_df)
))
