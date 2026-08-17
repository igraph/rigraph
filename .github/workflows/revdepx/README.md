# revdepx: the shared core of revdep3 and revdep4

This directory is the engine-agnostic core
of two sibling reverse-dependency-check workflows:

- **revdep3** (`revdep3.yaml`, the *pair* engine):
  a package's CRAN half and dev half run **concurrently**,
  each in its own Docker container.
- **revdep4** (`revdep4.yaml`, the *queue* engine):
  the two halves run **sequentially**,
  and a bash work queue checks several packages at once,
  one container per package.

Both exist because of the same diagnosis:
revdep2 ran the two halves as two simultaneous `R CMD check` processes
on one host,
and simultaneously checking the same package against two libraries
is not a supported mode of operation for the packages being checked.
The PSOCK port collision that needed the `R_PARALLEL_PORT` split
was one member of an open-ended class —
shared TMPDIR, shared caches, shared locks,
any singleton a check believes it owns.
revdep3 dissolves the class by isolation;
revdep4 dissolves it by never being simultaneous.
Everything that was *not* about that flaw —
the planner, the cost model, the baseline lineage,
the manifest and report machinery,
the hard-won robustness patterns —
lives here, shared.

The history of most design decisions in these scripts
is documented in `../revdep2/README.md`;
comments citing concrete run ids refer to revdep2 runs.
This file documents what changed and why,
and the contract that keeps the two workflows interchangeable.

## Why the two workflows can pull each other's results

Every reuse channel is keyed so that
"a run of the other workflow" is indistinguishable
from "an earlier run of this one":

- **Artifacts** share one family:
  `revdepx-plan`, `revdepx-pkg`, `revdepx-baseline`,
  `revdepx-timings`, `revdepx-report`,
  `revdepx-results-<shard>-<attempt>`,
  `revdepx-universe-report`.
  `plan.R` walks the completed runs of *both* workflow files
  (`REVDEPX_WORKFLOWS`), youngest first across the union.
- **Baselines** (old-version check results) are valid for either engine
  because both check inside the *same* container platform:
  a baseline row records the revdep's version,
  our CRAN version, the container R series,
  the base-image tag, the dependency fingerprint,
  and the date of the actual old check.
  `plan.R` reuses a row only when all of them still match.
  The base-image condition is also the firewall
  against revdep2-era baselines,
  which were measured on the runner's own toolchain
  and carry no tag.
- **Timings** record one canonical per-package number:
  `seconds` = the mean of the per-half durations that exist.
  For the pair engine that *is* the pair's wall clock
  (both halves record the same number, the slower one);
  for the queue engine it is the mean of two real halves.
  Either plan converts it to its own bill:
  the pair plan uses it as-is,
  the queue plan doubles it
  (and halves it back where a baseline covers the old half).
  Shard-level rows (setup, install minutes) are engine-shaped,
  so `calibration()` takes them only from same-engine runs;
  the per-package pool is shared.
- **Reports and `retry-run`**: `manifest.json` and the report files
  have one schema and one result vocabulary,
  so `retry-run: <id>` accepts a run of either workflow
  and carries its good results into the new report.
- **The universe image** on GHCR is one lineage (`revdepx-universe`),
  updated by whichever workflow ran last
  and consumed by whichever runs next.
- **Serialization**: both workflows share one concurrency group
  per checked ref (`revdepx-<ref>`),
  because they also share the committed `revdep/` report
  and the baseline lineage;
  interleaving them would race both.

## The image lifecycle

- **Base image** (`revdepx-base:r-<version>-<hash12>`):
  rocker/r-ver at the resolved R version (input `r-version`,
  default `oldrel` — a deliberately still target)
  plus the check toolchain (qpdf, ghostscript, pandoc, TeX, pak).
  The tag hashes `base-image.sh` itself,
  so the image is immutable until the recipe or the R version changes,
  and `plan.R` can *name* the tag without docker —
  which is how baseline rows are keyed to the platform.
- **Universe image** (`revdepx-universe:latest` and `:run-<id>`):
  the base plus the whole dependency universe
  and every system requirement,
  built by `image.R` *inside* a container and committed.
  A fresh-enough `:latest` standing on the same base tag
  is used as the starting layer,
  so a quiet CRAN week costs a delta install, not a rebuild;
  past `REVDEPX_IMAGE_MAX_AGE_DAYS` (default 14)
  the build starts from the base again,
  so accreted layers and stale system packages age out.
  igraph itself is evicted from the image's library:
  the two halves mount their own single-package libraries
  (CRAN release and dev binary) in front of it.
- **Fallbacks**, in order:
  a universe job that cannot *push* ships the image
  as a `revdepx-universe-image` artifact and shards `docker load` it;
  a universe job that failed entirely leaves the shards
  to build a shard-local image from the base
  (`shard-prep.sh`), using the shard's own install union —
  revdep2's per-shard install, demoted to disaster recovery.

## What checking looks like

One half = one container (`check-half.sh`):
the tarball, the half's library and the work directory bind-mounted,
`R_LIBS=<half lib>:<universe lib>`,
`timeout` inside the container,
the same `_R_CHECK_*` environment both engines forward,
a per-container `/tmp` on the big disk,
a memory cap so a hungry check kills its container
and not the runner,
and the container's exit status preserved
(124 = timeout, with an OOM marker when the kernel killed it).
The `.Rcheck` directory, the stamped `driver.log`
and the `status` file land in the same relative layout
revdep2 produced,
so parsing, comparison, salvage and reporting
carry over unchanged (`compare.R`).

The pair engine runs two such containers side by side
(`../revdep3/check-pair.sh`);
the queue engine runs them back to back per package,
several packages at once (`../revdep4/queue.sh`).
Both halves are always fresh checks, in both engines.

## Dropped from revdep2, deliberately

- The `R_PARALLEL_PORT` split and every per-mechanism
  interference patch — the isolation is categorical now.
- The preflight job, the `revdep2-lib`/`revdep2-lib-index` artifacts,
  the donor-run walk and the tar pack/unpack machinery —
  the universe image is the library artifact,
  and a registry pull is the restore.
- Per-shard host installs of the dependency union
  (kept only as the fallback above).
- Host TinyTeX, pandoc, qpdf and apt setup on every shard —
  in the image, once.
- The preflight-union arithmetic
  (which packages ≥ 2 shards need):
  with one shared image every package is installed exactly once
  whatever the shard layout.

## Knobs

Workflow inputs are documented in the two yamls.
Repository variables (`vars.*`) shared by both:
`REVDEPX_SHARD_BUDGET_MINUTES`, `REVDEPX_MAX_PARALLEL`,
`REVDEPX_SHARD_CAPACITY_MINUTES`, `REVDEPX_BASELINE_MAX_AGE_DAYS`,
`REVDEPX_IMAGE_MAX_AGE_DAYS`, `REVDEPX_TIMEOUT_FACTOR`,
`REVDEPX_TIMEOUT_MIN_MINUTES`, `REVDEPX_DEADLINE_MINUTES`,
`REVDEPX_COMMIT_REPORT`;
queue engine only: `REVDEPX_WORKERS`, `REVDEPX_MEMORY_PER_CHECK`.
Script-level environment variables are documented
in the header of each script.

## Operational notes

- First run on a repository: the GHCR packages
  (`revdepx-base`, `revdepx-universe`) are created on first push
  and must be allowed for `GITHUB_TOKEN` writes
  (they are, by default, for images pushed from the owning repo).
  If the organization forbids it,
  every run still works through the artifact fallback,
  at the price of re-building the universe each run.
- Image housekeeping: `:run-<id>` tags accumulate one per run;
  an org-level GHCR retention policy (or an occasional manual sweep)
  keeps the package list tidy.
  Nothing consumes a `:run-` tag after its run's shards finished.
- revdep2-era baselines and timings are never consumed:
  baselines fail the base-image condition,
  and timings live on `revdep2.yaml` runs the history walk
  does not visit.
  The first revdepx run therefore checks everything fresh
  and calibrates from CRAN times alone — by design,
  since its checks run on a different platform (pinned oldrel
  containers) than revdep2's ever did.
