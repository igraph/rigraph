# `revdep2` — sharded reverse-dependency checking

`.github/workflows/revdep2.yaml` checks every CRAN reverse dependency of the
package twice — once against the CRAN version, once against the checked-out
dev version — and reports the difference,
the way [revdepcheck](https://github.com/r-lib/revdepcheck) does,
but spread over as many GitHub Actions jobs as can actually run at once.
The trade is deliberate:
runner minutes are spent (duplicate setup, duplicate dependency installs)
to buy wall clock —
but only while a free lane makes that a trade at all,
which is why the shard count follows `max-parallel` rather than the budget.
The older `revdep.yaml` spends one job per package,
and `revdepcheck::revdep_check()` spends one machine for everything.

## Topology

```
plan      (1 job, ~2 min)              build  (1 job, parallel to plan)
  ├─ enumerate revdeps to `depth`,       └─ R CMD build
  │    or take the retry/explicit list        + R CMD INSTALL --build
  ├─ weigh each by what its check cost           → revdep2-pkg artifact
  │    here last time, else by CRAN's
  │    time scaled to this machine
  ├─ walk earlier runs youngest first:
  │    the baseline donor, the prebuilt
  │    libraries, the measured timings
  ├─ decide per package what is reusable
  └─ partition into as many shards as
       one wave can run, in whole waves
       → plan.json (artifact) + matrix (job output)

preflight (1 job; a dry run stops before it; failure does not stop the run)
  ├─ unpack the prebuilt packages the plan found
  ├─ install + load *every* dependency any revdep needs
  └─ pack the library for the next run
       → depfail.json, revdep2-lib(-index),
         warm pak cache (saved under the plan hash)

test      (one job per shard, max-parallel throttled, fail-fast: false)
  ├─ unpack this run's preflight library, then the plan's donors
  ├─ install the shard's dependency union (pak, sysreqs on, warm cache)
  ├─ phase old: reuse baselines, check the rest against the CRAN version
  ├─ install the prebuilt dev binary
  ├─ phase new: check everything again, compare per package
  └─ results + manifest.ndjson → revdep2-results-<shard>-<attempt>

collect   (1 job, if: always() past plan/build/preflight)
  ├─ merge all shard attempts (+ carried results of a retried run)
  ├─ reports via revdepcheck: README.md, problems.md, failures.md, cran.md
  ├─ pool what every check and every shard cost, job durations included
  └─ manifest.json, job summary, revdep2-report + revdep2-baseline
       + revdep2-timings artifacts
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

A package's weight is what its two checks are expected to cost *here*.
The best answer is what they cost here last time —
the timings artifact below carries it per package.
Where no run has checked the package yet,
CRAN's own number stands in:
`tools::CRAN_check_results()` publishes per-package check times per flavor as
`T_total`,
the planner takes the `r-release-linux-x86_64` flavor,
and scales it by the ratio the last runs measured between CRAN's machine and
this one
(0.47 in the first calibrated run: these runners check faster than CRAN
reports).
Packages CRAN has no timing for either get the cohort median.
A package without a reusable baseline is checked twice, so it weighs double,
plus a small fixed overhead.

The per-check timeout stays on CRAN's number and is not calibrated:
`max(REVDEP2_TIMEOUT_MIN_MINUTES, REVDEP2_TIMEOUT_FACTOR × T_total)`.
A timeout is a safety net for a check that has gone wrong,
so it should be generous where the estimate is merely typical —
and against the local estimate that same factor would be a third as forgiving.
The floor matters more than the factor:
19 of 770 packages in run 31048405399 were killed by a 10-minute one,
all of them compile-heavy (Stan models, mostly) and cheap by CRAN's numbers,
13 with the floor as their entire budget.
It is 20 minutes now, which covers every one of them.

### The shard count is bounded by the parallel capacity

Only `max-parallel` shards run at once (default 20),
so shards come in waves of that size.
That default is not arbitrary and raising it is not free:
GitHub caps how many jobs an account may run concurrently
(20 on the free plan, more on paid ones),
and 20 leaves room for the rest of the repository's CI.
Past that ceiling GitHub queues jobs whatever `max-parallel` says —
so a plan told it has more lanes than the account really has
does not get them, it just cuts more shards,
each paying its own setup while it waits for one.
**`max-parallel` should be the concurrency that actually exists, never more.**

Waves are what makes the shard count a real decision:
a shard after a full wave does not start any earlier for existing.
It waits for a lane, and arrives having paid another setup
(runner image, R, pandoc, TinyTeX, artifact downloads —
charged at 6 minutes until a run measures it)
plus its own dependency install.
Splitting past one wave therefore buys nothing and costs per shard,
which is what a 45-minute budget did to the 771-revdep batch:
111 shards, six waves, 6 h 16 min end to end,
for 2233 minutes of checking that one wave of 20 shards holds comfortably.

So the count is decided in two steps:

* **while one wave is enough, the budget decides.**
  `ceil(check minutes / shard-budget-minutes)`, capped at `max-parallel`.
  Below a full wave every extra shard really does start immediately,
  so cutting finer buys wall clock, and a small batch stays cheap.
* **past that, the capacity decides, in whole waves.**
  `shard-capacity-minutes` (default 80% of the shard's own deadline,
  so 240 min) is the most check time one shard may be given
  before its deadline starts deferring packages.
  The plan takes `ceil(check minutes / capacity)` shards,
  rounded up to a whole number of waves,
  and never more than the 250-leg matrix limit.

The result is `max-parallel` shards for anything that fits in one wave,
`2 × max-parallel` for twice that, and so on —
the capacity is filled, and nothing is split for the sake of splitting.

Both steps count *check* minutes,
but a shard also pays its setup and its installs inside the same deadline,
and how much that is only a real partition can say
(a shard's install union is not a per-package constant).
So the greedy pass below runs, the heaviest shard's **full** estimate is
compared against `REVDEP2_DEADLINE_MINUTES`,
and a shard count that cannot hold it grows by another whole wave
and partitions again.
The 20% between `shard-capacity-minutes` and the deadline is the room
this check normally finds sufficient;
the re-partition is what happens when it is not.

### When even the matrix is not enough

A matrix holds at most 256 legs, so `max-shards` caps at 250,
and 250 shards × 240 check minutes is the ceiling of one run:
about 60 000 check minutes.
Past that the plan **refuses to start**, with the numbers that make the case
and the ways out — rather than dispatching a run
that spends hours to report half its packages as `deferred`.

That ceiling is about the matrix, not about patience.
At 20 lanes, 250 shards is thirteen waves;
a batch anywhere near the limit is a multi-day run long before it is
an impossible one, and the wave count in the plan summary is what says so.

The way out it recommends is `part`:

```sh
gh workflow run revdep2.yaml -f part=1/3
gh workflow run revdep2.yaml -f part=2/3
gh workflow run revdep2.yaml -f part=3/3
```

Each part is an ordinary, independent run with its own report.
The cut is made on the weight-ordered package list, dealt round robin,
so the parts are of similar size and no coordination is needed:
every part re-derives the same order from the same CRAN metadata,
and a part that is still too big refuses in turn and names a bigger `G`.
Later parts start warmer than the first,
because baselines and prebuilt libraries are shared through the usual
artifacts.
The plan prints the `G` it needs, so the number is never guessed.

**What a split does not buy is wall clock.**
Run back to back or at the same time, the parts draw on the same account
concurrency, so the total time is what it always was —
plus one more preflight per part.
What it buys is a run that fits: shards inside their deadline,
a report per part rather than one that lands hours late and half `deferred`,
and a retry granularity that is a part rather than the whole set.
That is also why the refusal is the only place `part` is recommended:
a batch that fits should stay one run.

For scale, the largest set anyone here runs — `tibble`'s,
planned at the default 20 lanes:

* 2398 strong revdeps, 14 035 check minutes on CRAN's numbers:
  60 shards in three waves, ~13 h;
  40 shards in two waves, ~7 h, once the 0.47 measured scale applies.
* 3032 with `which: most` (Suggests included), 18 515 check minutes:
  80 shards in four waves, ~17 h;
  40 shards in two waves, ~9 h, calibrated.

Both are well inside the refusal, which is about the matrix limit —
but neither is short, and shard *count* is not what makes them long.
Three things bound such a run before the shard count does:

* **the lanes.** Wall clock is roughly total work ÷ concurrency,
  and concurrency is the account's ceiling
  (20 concurrent jobs on a free plan, more on paid ones).
  Nothing in this plan changes that number:
  splitting into more shards, or into `part` runs, only adds setups.
* **the preflight**, which installs the whole 3675-package dependency
  universe in one job before any shard starts, and is not parallel at all.
* **the heaviest single package**, which is never split across shards.
  `duckdb` alone is a 171-minute leg of the `most` plan on CRAN's numbers;
  no shard count gets under it, and the refusal names such a package
  rather than recommending a split that cannot help.

The capacity-bound plans above also sit close to their deadline by design
(the `most` one is planned at ~91% of it):
filling the capacity is what keeps the wave count down,
and a shard that overruns anyway defers the rest for `retry-run`
rather than losing it.
`shard-capacity-minutes` is the dial to lower if that trade reads wrong.

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

### Calibration: the plan learns from the last runs

Three constants drive everything above,
and all three used to be guesses:
how fast a check runs here, what a shard costs before it checks anything,
and what one more dependency costs to install.
Guesses compound in the wrong direction —
an overestimate of the check load asks for more shards than the capacity can
run,
and every one of those shards costs a setup it never earns back.

So every run now measures itself.
Each shard records what its phases cost
(`timing.json`: unpack, install, checks, and its own wall time),
the collector adds what the shards' *jobs* took —
read off the API, because the minutes before the driver starts
are invisible from inside it and are precisely the price of one more shard —
and publishes the lot as `revdep2-timings`,
a small artifact next to the report the way `revdep2-lib-index`
sits next to the library.

The next plan takes the youngest few of those
(`REVDEP2_MEASURED_MAX_RUNS`, default 3, within
`REVDEP2_MEASURED_MAX_AGE_DAYS`, default 60, same platform),
and reduces them to medians:

| Constant | Measured as | Fallback |
| --- | --- | --- |
| check scale | check seconds here ÷ `T_total` | 1 |
| setup per shard | job minutes − driver minutes | 6 min |
| install per dependency | install minutes ÷ packages installed | 2.5 s |

Per-package measurements win over the scaled CRAN number wherever a run has
one;
the scale only prices the packages nobody has checked here yet.
Pooling several runs rather than trusting the newest
keeps a small retry run — which measures a handful of packages —
from redefining the constants on its own.
`REVDEP2_CHECK_SCALE`, `REVDEP2_SETUP_MINUTES` and `REVDEP2_INSTALL_SECONDS`
override the measurement where a human knows better,
and a fresh repository with no measured run at all
simply plans on CRAN's numbers and the fallbacks,
which is what the workflow did before.

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

Installing the dependency universe is the other half of the bill,
and it is paid twice over.
The preflight installs all of it,
then every shard installs its own union again —
so on a runner with no binaries to install from,
one package is compiled once in the preflight
and once more in each of the twenty shards,
every run, for a result identical each time.

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

That artifact is reused twice, and the first one needs no history at all:
**every shard unpacks its own run's preflight library** —
`preflight` is a `needs` of `test`, so it is simply downloaded —
and only then falls back to earlier runs
for whatever the preflight could not supply.
This is the half that pays on the very first run:
the compile happens once in the preflight
instead of once more in each shard.

It is a `needs`, but not a prerequisite.
`test` runs on `!cancelled()` past a failed preflight
and `collect` does not consult its result at all,
because the preflight buys two things —
a free rebuild for the shards, and dependency failures diagnosed early —
and neither is worth the run.
A shard installs its own union regardless,
and that union is a fraction of what the preflight takes on:
in the run that made this necessary,
a median of 478 packages against the preflight's 4397.
Losing the preflight makes a run slower and blinder, not void.

For the rest, the plan walks the workflow's completed runs, youngest first,
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
and the preflight and every shard unpack from exactly that list —
the shards after their own run's library, for the gaps it leaves.
Every unpack takes only the packages that job needs,
and never overwrites what is already in the library
or loaded in the session
(pak and everything the job installed for itself stays untouched).

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
| `revdep2-preflight` | `depfail.json`, `resources.log` | 30 days |
| `revdep2-lib` | `library.tar` (the preflight's installed library), `lib.json` | 14 days |
| `revdep2-lib-index` | `lib.json`: R series, platform, package versions | 30 days |
| `revdep2-results-<shard>-<attempt>` | `manifest.ndjson`, `pkgs/<p>/{old,new}.rds`, kept check output | 30 days |
| `revdep2-report` | `README.md`, `problems.md`, `failures.md`, `cran.md`, `manifest.json`, all `pkgs/` | 90 days |
| `revdep2-baseline` | `baseline.json`, `old-rds/<p>.rds` | 90 days |
| `revdep2-timings` | `timings.json`: check seconds per package, cost per shard | 90 days |

The reports are revdepcheck's own,
generated through its `results` injection point
(`cloud_report_summary()` and friends),
so `README.md` reads exactly like a local `revdep_check()`'s.

The job summary embeds that report,
with two changes that a summary needs and a file does not.
Its links are rewritten:
a summary is served from the run's own URL,
where revdepcheck's `problems.md#pkg` resolves to `/actions/runs/problems.md`
and 404s,
so package names point at CRAN instead
and the report files are named where they actually live —
the `revdep2-report` artifact of the run.
And its "Failed to check" section is replaced
by a **Could not be checked** table
listing, per package, the version, the shard,
the check counts of whichever phase ran, and *why* —
the timeout and its duration, the dependencies that would not install,
whether installation failed under the dev version only or under both.
revdepcheck cannot say any of that
because the shim it is fed for an uncomparable package carries no detail;
the manifest has it all.

The summary closes with **What this run cost** —
check speed against CRAN's numbers, shard job durations,
setup and install cost —
because those are the numbers the next plan is sized in,
and they are worth reading next to the results they came from.

To fetch a run's results:

```sh
.github/workflows/revdep2/fetch.sh            # newest completed run
.github/workflows/revdep2/fetch.sh <run-id>   # a specific one
```

It brings `timings.json` down with the report,
so a plan can be replayed against exactly what that run measured:

```sh
REVDEP2_MEASURED_DIR=revdep OUT=plan.json \
  Rscript .github/workflows/revdep2/plan.R
```

To re-check only what a run could not declare ok —
after fixing the code, after a flaky failure, after a deadline deferral:

```sh
gh workflow run revdep2.yaml -f retry-run=<run-id>
```

The retry's collector carries the donor run's untouched results over,
so its report is complete again, not a fragment.

## The report is the repository's record

`revdep/` in the checkout is where the results live between runs.
`revdepcheck::cloud_check()` wrote `README.md`, `problems.md`,
`failures.md` and `cran.md` there long before this workflow existed,
`revdep/run-broken.R` read them back to re-check what was broken,
and the analysis next to them — `problems-analysis.md`, `examples/`,
the notification scripts — is what a human adds on top.
So the collector writes the same four files, in the same format
(they come out of revdepcheck itself), plus `manifest.json`,
and commits them back to the ref that was checked.

Only those five paths are staged.
The analysis and the examples beside them are human-authored,
and `pkgs/` — the raw check output, gigabytes of it —
belongs in the `revdep2-report` artifact and nowhere near a commit.

A ref that cannot receive a commit simply does not get one:
a tag, a SHA, a fork's branch.
That is a fact about the dispatch rather than a failure,
so the step says so with a `::notice::` and stops;
the report is in the artifact either way.
The same applies to a protected branch, a read-only token, or a push
that races with someone else's — the step is `continue-on-error`,
because a report that cannot be committed is still a report.
Set the repository variable `REVDEP2_COMMIT_REPORT` to `false`
to turn the commit off entirely.

### Re-checking what was broken

`packages: broken` takes the packages to check from that committed report:
`manifest.json` when this workflow wrote it (every result that is not `ok`),
and otherwise revdepcheck's own markdown —
the `# <package> (<version>)` headings of `problems.md` and `failures.md`,
plus the "Failed to check" table in `README.md`.
That is `revdep/run-broken.R`'s loop, as a dispatch input.

It is the cheap run: 39 packages rather than 771 for the report as it stands,
one wave, and every one of them a package that was wrong last time.
`retry-run: <id>` is the sibling for a run that did not finish —
the report is about *results*, a retry is about *coverage*.

## Failure modes

| Situation | Outcome |
| --- | --- |
| A revdep breaks under the dev version | `newly_broken` in manifest and report; the run stays green |
| The checked ref is a tag or a SHA | the report is not committed; a `::notice::` says so and the artifact still has it |
| The report cannot be pushed (protection, fork, race) | the step is `continue-on-error`; the run keeps its result |
| A revdep fails under both versions | `ok` (no *new* problems), visible in the report's tables |
| A check times out | rcmdcheck kills it at `max(floor, factor × its CRAN time)`; compared as `t-`, reported `failed` |
| A revdep's strong dependencies cannot install | `depfail`, check not attempted, named in the shard summary |
| A dependency fails the preflight | reported in the preflight summary and `depfail.json`; shards still try their own subset |
| A pak install chunk fails | the chunk is reported and the rest still run; what is still missing is retried one package at a time |
| The preflight job itself dies | the shards run anyway and install their own unions, the collector still reports; only the free rebuild and the early diagnosis are lost |
| A shard hits its deadline | remaining packages `deferred`; finished old-halves still uploaded and baseline-fed |
| A shard job dies hard | the collector reconciles against the plan: its packages are reported `missing`, naming the shard, and `retry-run` re-checks exactly them |
| Every shard dies | the report is still written, with every package `missing`; the artifact download is tolerated, not required |
| The batch is too big for 250 shards | the plan refuses before anything starts, and names the `part` split that fits |
| A shard is re-run | new artifact per attempt; the collector lets the later attempt win per package |
| The baseline artifact is gone | planner reuses nothing, everything checked fresh |
| No run has published timings yet | the plan uses CRAN's times unscaled and the fallback constants, and errs towards more shards |
| The collector cannot read the job durations | setup stays at its default; check and install costs are still measured |
| No earlier run has a usable library | shards still unpack this run's preflight library; only the preflight itself installs from scratch |
| The preflight could not pack a library | the download step is skipped, shards fall back to the plan's donors and pak |
| A donor's library artifact expires between plan and shard | that shard installs those packages itself; the run is unaffected |
| A restored binary will not load | the preflight rebuilds it from source and re-tests; only a second failure is a `depfail` |
| CRAN bumps a dependency mid-run | shards install what resolves at their start; the recorded fingerprint is the plan's — next run re-fingerprints |
| The package is not on CRAN | plan emits zero shards, run ends green |
| `collect` finds new problems | reported in the summary and the report artifact; the run stays green |

### When a job is killed rather than failed

A job that *fails* leaves a diagnosis:
the step reports its error,
the `if: always()` steps run,
and the artifacts are uploaded.
A job that is *killed* leaves almost nothing.
`The runner has received a shutdown signal` and `exit code 143`
is the whole of it —
no post-step runs,
nothing is uploaded,
and the only record that survives
is whatever had already been streamed to the log.

The preflight is where that happens,
because it is the one job that takes on the entire dependency universe at once,
so three things are arranged to be *live* rather than after the fact:

- `watch-resources.sh` samples memory, swap, disk, load
  and the three largest processes every 30 seconds
  while the install runs,
  so a kill has a curve leading up to it
  instead of a blank.
- The R script runs under `stdbuf -oL`.
  R block-buffers stdout when it is not a terminal
  and flushes it on exit,
  which a killed process never reaches —
  that is why pak's progress used to vanish
  while the `message()` calls around it, on unbuffered stderr, came through.
- Afterwards, when there is an afterwards,
  the kernel's own OOM log is read,
  which separates "this job asked for too much memory"
  from "the host went away".

The install itself is also cut down to a size pak handles predictably.
One `pak::pkg_install()` call for a few thousand refs
resolves all of them before it installs any of them,
and that resolution is the part that stops degrading gracefully:
the run above spent ten minutes in it
without a single install starting.
So both the preflight and the shards install in chunks of
`REVDEP2_INSTALL_CHUNK` packages (100),
ordered so that every strong dependency inside the set
is installed before the package that needs it —
each chunk then resolves against a library where its dependencies already are.
The ordering is on strong dependencies only:
Suggests are in the set because a revdep's *check* needs them,
not its installation,
and they are what would make the graph cyclic.
Packages a cycle or a gap in the index leaves unordered go last, together.

That also changes what a failure costs.
Whatever earlier chunks installed is on disk
and is skipped on the next attempt,
so a chunk that dies costs a chunk rather than the job —
and the log names which one,
where a single opaque call could only go quiet.

The same principle applies to everything these scripts swallow.
Fetching an artifact is an optimization,
so its failure never stops a run —
which is exactly why it has to say *which* failure it was.
An artifact that has really expired,
a `gh` that could not download it,
a truncated zip,
an `unzip` that refused it,
and a tar that ran out of disk
each name themselves now;
before, all of them printed
"no longer has a library artifact",
including the cases where the artifact was demonstrably still there.

Run ids are strings everywhere in these scripts,
never integers, and `"0"` is the "no such run" sentinel
that `plan.json` and the plan job's outputs use.
GitHub's run ids passed `.Machine$integer.max` in 2026,
so `as.integer("31048405399")` is a silent `NA`
that only surfaces as `missing value where TRUE/FALSE needed`
at the next `if`.
`run_id_chr()` and `has_run()` in `util.R` are how they are handled.

## Knobs

| Knob | Input | Variable | Default |
| --- | --- | --- | --- |
| Ref to check (branch, tag, SHA) | `ref` | — | the dispatched ref |
| Packages to check, or `broken` for the committed report's | `packages` | `REVDEP2_PACKAGES` | all revdeps |
| Where that report lives | — | `REVDEP2_REPORT_DIR` | `revdep` |
| Commit the report back to the checked branch | — | `REVDEP2_COMMIT_REPORT` | on |
| Revdep set | `which` | — | `strong` |
| Revdep depth (`1`, `2`, …, `all`) | `depth` | — | 1 |
| Retry a run | `retry-run` | — | — |
| One G-th of the revdeps, for a set too big for one run | `part` (`i/G`) | `REVDEP2_PART` | — |
| Plan only | `dry-run` | — | false |
| Check-time target per shard, up to one wave | `shard-budget-minutes` | `REVDEP2_SHARD_BUDGET_MINUTES` | 45 |
| Concurrent shards, and so the wave size — set it to the concurrency the account really has, never more | `max-parallel` | `REVDEP2_MAX_PARALLEL` | 20 |
| Check minutes one shard may hold, which forces further waves | — | `REVDEP2_SHARD_CAPACITY_MINUTES` | 80% of the deadline |
| Ignore reusable baselines | `refresh-baseline` | — | false |
| Oldest reusable baseline | `baseline-max-age-days` | `REVDEP2_BASELINE_MAX_AGE_DAYS` | 30 days |
| Runs donating prebuilt packages | — | `REVDEP2_PREBUILT_MAX_RUNS` | 5 (`0` disables) |
| Oldest reusable prebuilt library | — | `REVDEP2_PREBUILT_MAX_AGE_DAYS` | 14 days |
| Runs the history walk looks at | — | `REVDEP2_HISTORY_RUNS` | 40 |
| Packages per `pak::pkg_install()` call | — | `REVDEP2_INSTALL_CHUNK` | 100 |
| Wall clock past which the plan warns (never refuses) | — | `REVDEP2_LONG_RUN_HOURS` | 12 h |
| Runs whose timings calibrate the cost model | — | `REVDEP2_MEASURED_MAX_RUNS` | 3 (`0` disables) |
| Oldest measurement worth trusting | — | `REVDEP2_MEASURED_MAX_AGE_DAYS` | 60 days |
| Check seconds here per CRAN second | — | `REVDEP2_CHECK_SCALE` | measured, else 1 |
| Fixed cost of one shard | — | `REVDEP2_SETUP_MINUTES` | measured, else 6 min |
| Cost of one more dependency install | — | `REVDEP2_INSTALL_SECONDS` | measured, else 2.5 s |
| Per-check timeout factor | — | `REVDEP2_TIMEOUT_FACTOR` | 1.5 × CRAN time |
| Per-check timeout floor | — | `REVDEP2_TIMEOUT_MIN_MINUTES` | 20 |
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

1. Three of the cost model's constants are now fitted from the last runs
   (check scale, per-shard setup, per-dependency install);
   the per-package overhead (0.5 min) and the budget itself
   are still estimates.
   The fit is a median, not a regression:
   install cost in particular is charged per package
   where it plainly is not linear in the package count,
   and a shard holding twice as many packages installs a union
   that is much less than twice as large.
   The measured numbers are in each run's `revdep2-timings`,
   so a better model can be fitted whenever the linear one is seen to hurt.
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
