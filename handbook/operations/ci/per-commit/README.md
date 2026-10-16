# `per-commit/`

Every commit on a series branch gets a verdict of its own,
so `main-dev` stays bisectable end to end and `main-green` advances only over commits that passed
([`branches/model/`](/handbook/branches/model/README.md)).
[`each.yaml`](/.github/workflows/each.yaml) is what runs, and only in the fork `krlmlr/rigraph`, where the series refs live.

**Nothing here coordinates; everything recomputes.**
No part of this system asks another what it is doing, and none of it holds a lock or a running marker.
Each run derives its work from durable state, the branch and the verdicts already stored,
and writes only what it decided.
A lost runner costs its own work, and a rerun costs only what was lost.

The design, the scripts and most of their comments are duckdb-r's, ported with the series loop
([`.series-source`](/.series-source) records from where).

## The contract

What every consumer, the series loop first, relies on:

* **Commits considered.**
  On `main-dev`, `main-green..HEAD`, and nothing at or below `main-green`.
  On the rc strand `main-rc-dev`, everything above its newest `chore: Add fifth version component`.
  Elsewhere, first-parent history since the `since` input.
  A commit the store has decided already is skipped.
  If `main-green` is not an ancestor of `main-dev`, the run plans nothing and fails,
  so a ref move left half-done stays visible.
* **The marker.**
  A commit status with context `rcc`: `pending` before the commit is built, `success` or `failure` after.
* **Judging a commit again.**
  A rewritten commit has a new SHA and so no verdict.
  To judge one again under the SHA it has, push `retry-main-dev` at it
  ([`series-loop`](/.claude/skills/series-loop/SKILL.md), "Rerun one commit");
  to replan a whole range, dispatch the workflow with `force`.
* **Results.**
  One record and, for a failure, one log per commit, published twice from the same bytes:
  in the run that decided it (the leg's `each-logs-*` artifact, and inline in its job log),
  and on the store branch `rcc2`, as `runs2.d/<xx>/<sha>.ndjson` and `logs2.d/<xx>/<sha>.log`.
  A consumer reads whichever it can reach.
* **A run's conclusion is not a verdict.**
  A leg exits 0 whatever its commits did, so that a red commit reads as a result rather than as a broken job.

## The gates

[`scripts/rcc-one.sh`](/scripts/rcc-one.sh) installs the package and then applies them to one commit, in the order of its `ALL_GATES`,
and the order is part of the contract.
They are the gates of the `rcc-smoke` job of [`R-CMD-check.yaml`](/.github/workflows/R-CMD-check.yaml) on its dispatch path,
expressed as a script so that one job can run them for many commits,
plus one that `rcc-smoke` does not make:

* **`regen`** runs Stimulus through `Makefile-cigraph`, `cpp11::cpp_register()` and `tools/generate-migrations.R` again,
  and fails when the tree changed, restoring it so that the later gates judge the commit as committed.
  It is what holds the generated R/C interface to its generator on every commit:
  `R/aaa-*.R`, `src/rinterface.c` and the cpp11 files are never edited by hand
  ([`architecture/stimulus/`](/handbook/architecture/stimulus/README.md)).
  On `main` the migration half runs in `custom/after-install` instead, which judges the tip rather than each commit.

Every gate runs even after an earlier one failed, so a red commit's log shows all its problems at once.
The copy of the script that runs is the commit's own, not the branch tip's:
a change to a gate binds the commits at or after it and no others.
A tree the gates leave dirty fails with `Changes detected in workflow_dispatch build`,
and accepted snapshots are pushed as `snapshot-<sha>-rcc-smoke-null`;
both strings are read by other scripts and stay as they are.

## Planning and the legs

One run is two jobs.
`plan` enumerates the candidates ([`scripts/each-plan.sh`](/scripts/each-plan.sh)),
asks the store which are decided ([`scripts/rcc-decided.sh`](/scripts/rcc-decided.sh), one tree-only fetch),
weighs each commit ([`scripts/each-cost.py`](/scripts/each-cost.py))
and packs contiguous runs of commits into shards under a build-time budget ([`scripts/each-partition.py`](/scripts/each-partition.py)).
`build` is one job per shard ([`scripts/each-shard.sh`](/scripts/each-shard.sh)):
it installs R and the dependencies once, then resets the workspace and runs the gates for each commit, oldest first,
and stops at its own deadline, deferring the rest to the next run.

**Every commit weighs the same.**
duckdb-r weighs a commit by how many objects of its unity build the change invalidates;
rigraph has no unity build, and the vendored C library dominates every build alike,
so the estimator [`scripts/series-config.sh`](/scripts/series-config.sh) names, `each-cost.py`, gives each commit one constant weight,
and `each-plan.sh` records how that weight and the minutes it is converted with were measured.

## The store

The `rcc2` branch holds one record and one failure log per decided commit, and nothing else.
[`scripts/rcc-publish.sh`](/scripts/rcc-publish.sh) is its routine writer, retrying on the race for the ref;
[`scripts/rcc-lib.sh`](/scripts/rcc-lib.sh) holds its paths and helpers;
[`scripts/rcc-store-test.sh`](/scripts/rcc-store-test.sh) checks it offline against a local remote.

**The store stays, although the `rcc` status carries the same verdict.**
A session behind the cloud proxy reaches neither a run's artifacts nor its whole job log,
so the store is its one path to a failure log, and it answers which commits are decided for any range in one fetch, with git alone.
Moving the verdict to a status of its own and the log to a check run, and retiring the branch, was weighed with duckdb-r and declined.
The branch is the simpler of the two as it stands, and the gain would be modest.

**Retention** is `RCC_RETENTION_DAYS` (180, set in `rcc-lib.sh`), records and logs alike.
[`scripts/rcc-consolidate.sh`](/scripts/rcc-consolidate.sh) drops what is older and squashes the history to two commits.
It only reports unless `APPLY=1` is set, and its `OUT_DIR` is a checkout of `rcc2`.
It is the one writer that rewrites the branch, so it is run by hand and never on a schedule, and its force-push carries a lease.
Filling a record no leg published, and dropping verdicts the job rather than the tree decided, are not ported.
The series loop names what would trigger them ([`series-loop`](/.claude/skills/series-loop/SKILL.md), "Not ported yet").

## Operating it

Every knob is an input of the workflow's dispatch, and the ones worth setting for the whole fork are repository variables;
[`each.yaml`](/.github/workflows/each.yaml) lists both with their defaults.
A red commit is read from its record's failed stages before its log,
and classified and repaired by stage 2 of the series loop ([`series-loop`](/.claude/skills/series-loop/SKILL.md));
what a failed vendoring stage means is [`operations/vendoring/troubleshooting/`](/handbook/operations/vendoring/troubleshooting/README.md)'s.
