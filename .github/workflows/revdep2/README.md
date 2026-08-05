# `revdep2` — sharded reverse-dependency checking

`.github/workflows/revdep2.yaml` checks every CRAN reverse dependency of the
package twice — once against the CRAN version, once against the checked-out
dev version — and reports the difference,
the way [revdepcheck](https://github.com/r-lib/revdepcheck) does,
but spread over as many GitHub Actions jobs as the batch needs.
The trade is deliberate:
runner minutes are spent (duplicate setup, duplicate dependency installs)
to buy wall clock,
where the older `revdep.yaml` spends one job per package
and `revdepcheck::revdep_check()` spends one machine for everything.

## Topology

```
plan      (1 job, ~2 min)              build  (1 job, parallel to plan)
  ├─ enumerate revdeps to `depth`,       └─ R CMD build
  │    or take the retry/explicit list        + R CMD INSTALL --build
  ├─ weigh each by CRAN's check time             → revdep2-pkg artifact
  ├─ walk earlier runs youngest first:
  │    the baseline donor, and the
  │    prebuilt libraries to unpack
  ├─ decide per package what is reusable
  └─ partition into shards
       → plan.json (artifact) + matrix (job output)

preflight (1 job; a dry run stops before it)
  ├─ unpack the prebuilt packages the plan found
  ├─ install + load *every* dependency any revdep needs
  └─ pack the library for the next run
       → depfail.json, revdep2-lib(-index),
         warm pak cache (saved under the plan hash)

test      (one job per shard, max-parallel throttled, fail-fast: false)
  ├─ unpack the prebuilt packages the plan found
  ├─ install the shard's dependency union (pak, sysreqs on, warm cache)
  ├─ phase old: reuse baselines, check the rest against the CRAN version
  ├─ install the prebuilt dev binary
  ├─ phase new: check everything again, compare per package
  └─ results + manifest.ndjson → revdep2-results-<shard>-<attempt>

collect   (1 job, if: always() past plan/build/preflight)
  ├─ merge all shard attempts (+ carried results of a retried run)
  ├─ reports via revdepcheck: README.md, problems.md, failures.md, cran.md
  └─ manifest.json, job summary, revdep2-report + revdep2-baseline artifacts
```

The workflow is dispatch-only — nothing runs on push —
and `dry-run: true` stops after planning,
which is how a plan is inspected for free.
The `ref` input checks any branch, tag or commit SHA:
the dispatch itself can only target a branch or tag,
so arbitrary SHAs travel through the input,
with the one constraint that the tree must contain these scripts.

A failing check never fails anything:
`fail-fast: false` isolates shard-level accidents,
the shard driver records per-package failure as data,
the collector runs on `always()` past its prerequisites,
and check results never turn the run red —
the job summary and the `revdep2-report` artifact are the deliverable.
A red job means broken infrastructure, not a broken revdep.

## Weighing and partitioning

Enumeration is breadth-first to `depth`:
level 1 depends on the package directly,
level 2 on a level-1 package, and so on,
up to the fixpoint for `depth: all`.
Deeper levels break through their intermediaries,
so their CRAN-vs-dev comparison stays meaningful,
and their install closures pull the intermediaries in automatically.

CRAN publishes per-package check times for each flavor;
`tools::CRAN_check_results()` carries them as `T_total`.
The planner takes the `r-release-linux-x86_64` flavor as the proxy
for what a check costs here:
one check ≈ `T_total`, a package without a reusable baseline pays two,
plus a small fixed overhead.
Packages CRAN has no timing for get the cohort median.
The same number sizes the per-check timeout:
`max(REVDEP2_TIMEOUT_MIN_MINUTES, REVDEP2_TIMEOUT_FACTOR × T_total)`,
so a package gets killed relative to what it normally costs,
with the floor covering the gap between CRAN's machines and these runners.

The shard count is demand-driven:
the smallest `K` whose average check load fits `shard-budget-minutes`
(default 45), capped by the 250-leg matrix limit.
A smaller budget buys wall clock with more shards;
the per-shard setup (~6 min: R, pandoc, TinyTeX, dependency install)
is the price of each extra shard.

Assignment is greedy, in two phases:

1. **Round-robin the heavyweights.**
   The `K` heaviest packages are dealt one per shard,
   so no two giants end up queued behind each other.
2. **Marginal-cost placement for the rest.**
   Every remaining package, heaviest first,
   goes to the shard where
   `load + weight + install_seconds × |dependencies the shard does not yet have|`
   is smallest.
   The install penalty (default 2.5 s per package, from a warm binary cache)
   is what pulls packages with overlapping dependency trees together,
   so a shard's install phase is amortised over packages that share it.

### Why greedy, not an exact optimisation

The exact problem is makespan minimisation with sequence-dependent setup
costs — bin packing crossed with a coverage objective —
which is NP-hard in both halves,
and the classic greedy (LPT: longest processing time first)
is already within 4/3 − 1/(3K) of the optimal makespan.
The inputs do not deserve better:
CRAN timings come from a different machine under different load,
install costs are a scalar guess,
and the actual runtime moves with cache hits and CRAN's own state.
An ILP or local-search pass could shave minutes off the plan on paper
and would still be wrong by more than that in practice —
and it would need a solver in a job whose entire budget is two minutes.
The greedy pass is O(n · K) with a bitmap per shard,
runs in well under a second for thousands of revdeps,
and its plans are inspectable
(the plan job's summary prints per-shard estimates and contents).

`each.yaml` in duckdb-r solves the mirror-image problem
(contiguous slices of a commit history, reuse via ccache adjacency);
its two-pass rebalancing exists because contiguity pins its cuts.
Here nothing is contiguous — any package can sit anywhere —
so the whole plan family collapses into the one greedy pass
and the only dial left is the budget.

## The CRAN baseline, and when it is reused

The old-version check of a revdep does not involve the dev code at all:
it is the CRAN version of this package, the revdep, and their dependencies.
Its result therefore outlives the run that produced it,
and re-checking it every run would double the bill for no information.

The collector publishes every old-version result as `revdep2-baseline`
(`baseline.json` plus one `old.rds` per package),
and the planner reuses an entry only when *everything that shaped it*
is unchanged:

| Criterion | Compared |
| --- | --- |
| revdep version | baseline vs `available.packages()` now |
| our CRAN version | baseline vs CRAN now |
| R series | baseline vs the runner's `major.minor` |
| dependency versions | md5 over the sorted `package version` lines of the revdep's whole install closure, from CRAN metadata |
| age | `checked_at` within `baseline-max-age-days` (default 30) |

The dependency fingerprint is the load-bearing one:
a tidyverse point release changes the environment an old check ran in,
and versions-of-us-and-them alone would happily reuse a result
that release just invalidated.
The age cap backstops what CRAN metadata cannot see —
the runner image, system libraries, network state.
Reuse does not refresh `checked_at`:
a result ages from the day it actually ran.
`refresh-baseline: true` ignores all of it for one run.

Baselines are looked up newest-run-first across the workflow's history
(any branch — the dev code plays no part in an old check),
in the same single walk that picks the prebuilt libraries below,
and a retried run's own report doubles as its donor.
A missing, expired, or partially unusable baseline is never an error;
the affected packages are simply checked fresh.

## Prebuilt packages, and which runs they come from

Installing the dependency universe is the other half of the bill.
Every shard installs its own union,
and the preflight installs all of it once before them,
so a package that CRAN has not touched since the last run
is built again in every one of those jobs, every run,
for a result that is byte-for-byte what the last run already had.

So the preflight publishes what it installed.
Its library is packed into `revdep2-lib`
(one uncompressed `library.tar` — `upload-artifact` zips what it uploads,
and deflating gigabytes twice buys nothing),
next to `revdep2-lib-index`,
a small `lib.json` naming the R series, the platform,
and every package version in it.
The index is a separate artifact on purpose:
a later plan reads it to decide what a run is good for
without downloading the library it describes.

The plan then walks the workflow's completed runs, youngest first,
and takes libraries until it has covered
every package this run will install,
or has run out of runs:

* a run only donates while its library is younger than
  `REVDEP2_PREBUILT_MAX_AGE_DAYS` (default 14)
  and its index reports the same R series and platform —
  binaries are only portable that far;
* each donor is credited only with the packages
  no younger donor already had,
  so a run that adds nothing is never downloaded;
* at most `REVDEP2_PREBUILT_MAX_RUNS` runs donate (default 5, `0` turns
  reuse off) — every extra donor is another full library download.

What it settles lands in `plan.json` as `prebuilt.runs`,
and the preflight and every shard unpack from exactly that list,
taking only the packages they need
and never overwriting what is already in their library
(pak and everything the job itself installed stays untouched).

**pak still runs over the whole set afterwards.**
Unpacking is not installing:
CRAN moves between runs, and a package whose version changed
has to be built after all.
The install runs with `upgrade = TRUE` whenever anything was restored,
because the plan's dependency fingerprints — the ones that decide
baseline reuse — are computed from CRAN *now*,
and `upgrade = FALSE` would quietly freeze the donor's versions instead.
Reuse therefore skips *building* what has not changed;
it never skips resolving it.

The one failure mode reuse introduces is a stale binary:
a runner image moves under a package that was compiled against the old one.
The preflight load-tests everything it installs anyway,
so it catches exactly that — a restored package that will not load
is thrown away, rebuilt from source, and load-tested again
before it counts as a dependency failure.

## Results, artifacts, tooling

Every artifact this workflow writes:

| Artifact | Content | Lifetime |
| --- | --- | --- |
| `revdep2-plan` | `plan.json` | 30 days |
| `revdep2-pkg` | source tarball, platform binary, `meta.json` | 30 days |
| `revdep2-preflight` | `depfail.json` | 30 days |
| `revdep2-lib` | `library.tar` (the preflight's installed library), `lib.json` | 14 days |
| `revdep2-lib-index` | `lib.json`: R series, platform, package versions | 30 days |
| `revdep2-results-<shard>-<attempt>` | `manifest.ndjson`, `pkgs/<p>/{old,new}.rds`, kept check output | 30 days |
| `revdep2-report` | `README.md`, `problems.md`, `failures.md`, `cran.md`, `manifest.json`, all `pkgs/` | 90 days |
| `revdep2-baseline` | `baseline.json`, `old-rds/<p>.rds` | 90 days |

The reports are revdepcheck's own,
generated through its `results` injection point
(`cloud_report_summary()` and friends),
so `README.md` reads exactly like a local `revdep_check()`'s.

To fetch a run's results:

```sh
.github/workflows/revdep2/fetch.sh            # newest completed run
.github/workflows/revdep2/fetch.sh <run-id>   # a specific one
```

To re-check only what a run could not declare ok —
after fixing the code, after a flaky failure, after a deadline deferral:

```sh
gh workflow run revdep2.yaml -f retry-run=<run-id>
```

The retry's collector carries the donor run's untouched results over,
so its report is complete again, not a fragment.

## Failure modes

| Situation | Outcome |
| --- | --- |
| A revdep breaks under the dev version | `newly_broken` in manifest and report; the run stays green |
| A revdep fails under both versions | `ok` (no *new* problems), visible in the report's tables |
| A check times out | rcmdcheck kills it at `max(floor, factor × its CRAN time)`; compared as `t-`, reported `failed` |
| A revdep's strong dependencies cannot install | `depfail`, check not attempted, named in the shard summary |
| A dependency fails the preflight | reported in the preflight summary and `depfail.json`; shards still try their own subset |
| A shard hits its deadline | remaining packages `deferred`; finished old-halves still uploaded and baseline-fed |
| A shard job dies hard | its packages have no manifest entries; the collector reports what exists; `retry-run` re-plans the rest |
| A shard is re-run | new artifact per attempt; the collector lets the later attempt win per package |
| The baseline artifact is gone | planner reuses nothing, everything checked fresh |
| No earlier run has a usable library | nothing is unpacked, pak installs everything from scratch |
| A donor's library artifact expires between plan and shard | that shard installs those packages itself; the run is unaffected |
| A restored binary will not load | the preflight rebuilds it from source and re-tests; only a second failure is a `depfail` |
| CRAN bumps a dependency mid-run | shards install what resolves at their start; the recorded fingerprint is the plan's — next run re-fingerprints |
| The package is not on CRAN | plan emits zero shards, run ends green |
| `collect` finds new problems | reported in the summary and the report artifact; the run stays green |

## Knobs

| Knob | Input | Variable | Default |
| --- | --- | --- | --- |
| Ref to check (branch, tag, SHA) | `ref` | — | the dispatched ref |
| Packages to check | `packages` | — | all revdeps |
| Revdep set | `which` | — | `strong` |
| Revdep depth (`1`, `2`, …, `all`) | `depth` | — | 1 |
| Retry a run | `retry-run` | — | — |
| Plan only | `dry-run` | — | false |
| Check-time target per shard | `shard-budget-minutes` | `REVDEP2_SHARD_BUDGET_MINUTES` | 45 |
| Concurrent shards | `max-parallel` | `REVDEP2_MAX_PARALLEL` | 20 |
| Ignore reusable baselines | `refresh-baseline` | — | false |
| Oldest reusable baseline | `baseline-max-age-days` | `REVDEP2_BASELINE_MAX_AGE_DAYS` | 30 days |
| Runs donating prebuilt packages | — | `REVDEP2_PREBUILT_MAX_RUNS` | 5 (`0` disables) |
| Oldest reusable prebuilt library | — | `REVDEP2_PREBUILT_MAX_AGE_DAYS` | 14 days |
| Runs the history walk looks at | — | `REVDEP2_HISTORY_RUNS` | 40 |
| Per-check timeout factor | — | `REVDEP2_TIMEOUT_FACTOR` | 1.5 × CRAN time |
| Per-check timeout floor | — | `REVDEP2_TIMEOUT_MIN_MINUTES` | 10 |
| Shard graceful deadline | — | `REVDEP2_DEADLINE_MINUTES` | 300 |

## Prior art

Surveyed before building this; what each contributed:

* [r-lib/revdepcheck](https://github.com/r-lib/revdepcheck) —
  the comparison model (old vs new `rcmdcheck`, `compare_checks()`),
  the report format, and the `results` injection point the collector uses.
  Its `cloud_check()` (one AWS Batch job per package, fetch, compare locally)
  is the closest architectural relative.
* [r-devel/recheck](https://github.com/r-devel/recheck) —
  CRAN-parity system libraries, binary-first dependency installs,
  and the honest framing that revdep results are diagnostics,
  too volatile for a pass/fail gate (hence check results never fail the run).
* [yihui/crandalf](https://github.com/yihui/crandalf) —
  batching revdeps across CI jobs,
  and re-checking only previously failed packages (`retry-run` here).
* [HenrikBengtsson/revdepcheck.extras](https://github.com/HenrikBengtsson/revdepcheck.extras) —
  pre-installing the dependency universe before the checks start
  (the preflight job).
* duckdb-r's `each.yaml` —
  the plan/matrix/fan-in shape, cost-balanced shards under a budget,
  graceful deadlines with deferral, per-attempt artifacts,
  and empty-matrix/fallback-output hygiene.

No published workflow was found that balances revdep shards
by CRAN check timings or by dependency overlap;
that part is new here.

## Not yet validated

1. The cost model's constants
   (45 min budget, 6 min setup, 2.5 s per dependency install, 0.5 min
   per-package overhead) are estimates, not fits.
   Shard manifests record actual durations, so they can be fitted
   from real runs the way duckdb-r recalibrated `each`.
2. Bioconductor revdeps are out of scope:
   enumeration, versions and fingerprints all come from CRAN metadata.
3. The report generation leans on unexported revdepcheck internals
   (`try_compare_checks()`, `rcmdcheck_error()`) via `:::`,
   with a manifest-only fallback when they drift.
4. Baselines live in artifacts, whose retention caps reuse at 90 days
   and whose availability is per-repository;
   an orphan branch (the `rcc` model) would be durable and fetchable
   but grows the repository.
5. Prebuilt-library reuse trades download for build:
   every shard fetches each donor library whole,
   because artifacts cannot be fetched in part.
   That is a clear win where the runner has no binaries to install from
   and a marginal one where it does,
   and the crossover has not been measured —
   `REVDEP2_PREBUILT_MAX_RUNS=0` turns it off if it ever stops paying.
