---
name: series-loop
description: Drive the vendoring series loop: for every series and its forward counterpart, vendor the next upstream commits, promote what is green, and repair what is not. Use when asked to run, advance, continue or repair the series loop or a series, when a scheduled routine fires for it, or when a series' green ref has fallen behind its buffer.
---

# The series loop: vendor, promote, repair

*Handbook: [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md) —
what this routine is, and when it runs.*

One routine drives **all** series:
each firing enumerates every series and every existing forward (`-fwd`)
counterpart and serves each in turn.
`<S>` is a series prefix — `main`, `v1.5-variegata`, `v1.4-andium`,
`main-fwd`, and every future series.

**This file is the playbook**: the order of the stages, the commands, the verdicts and the stop rules.
Every stage has a reference beside it under [`references/`](references/),
which holds the reasoning each rule rests on, the traps paid for once, and the history that explains the shape.
Read a stage's reference the first time the stage has work in a firing,
and whenever the stage does not go as this file says;
a rule here that reads as arbitrary is explained there, never overridden here.

## The four branches of a series

| ref | who writes it | what it is |
|---|---|---|
| `<S>-build` | the routine, unconditionally | Every upstream first-parent commit vendored one-to-one, glue compiling at every commit. **No CI runs here** (`each.yaml` never matches `*-build`). The buffer. |
| `<S>-dev` | the routine, force-push | `<S>-build` commits, consumed up to 100 at a time, with test/R/patch adaptations folded in as CI demands. What CI builds, commit by commit. |
| `<S>-green` | the routine, fast-forward only | The newest commit such that every commit in `<S>-green..it` has a `success` run. What r-universe should build from. |
| `<S>-build-base` | the routine, force-push | The `<S>-build` commit equivalent to `<S>-green` (same vendored upstream SHA). Marks how much of the buffer has been consumed and verified. A marker with no consumer, recomputed every stage 3. |

Equivalence between `-build` and `-dev` commits is by the `duckdb/duckdb@<sha>` reference in the commit subject:
**the subject is what decides, never the path**,
and `vendored_sha()` looks past non-vendor commits 20 deep and says so on stderr when that is not enough.

**A series is discovered, not configured**:
every `<X>-build` with a sibling `<X>-dev` is a series the firing serves, base and forward alike.
Not a series, and given no stage:
a forward whose green is an ancestor of its base's green (cutover litter pending deletion),
`<S>-rc-dev`, `<S>-alpha` and `<S>-rc-alpha` (derived strands),
`<L>-land-*` (a landing),
and `<S>-fwd-vendor` (the forward's vendor strand).

**All four refs exist from day one, and green starts below the flavor commits.**
A forward's `-dev`, `-build` and `-build-base` start at the seed tip, topped by a separate `chore: Add fifth version component` commit,
and its green at the commit the seed sits on, so that CI judges the flavor commits first and green crosses them once they pass;
an opening cuts the build pair and the dev pair from the parent's strands, each at its own cut, below its reflavor
([`series-open/SKILL.md`](/.claude/skills/series-open/SKILL.md)).
There is never a "no green yet" state, and every walk below is bounded by `<S>-green`.

Reference: [`references/series.md`](references/series.md).

## One firing

Set up first, then work through the stages in order;
each stage is skippable when it has nothing to do, the setup is not.
The scripts carry the mechanical parts, and [`scripts/README.md`](/scripts/README.md) indexes every one;
the ones a firing runs or reads on every pass:
`scripts/series-check.sh`
(read-only — walks every series, classifies from the `rcc2` store,
which is stage 2's fallback source, not its first one;
prints one verdict each:
ADVANCE / WAIT / RETRY `<sha>` / REPAIR `<sha>` / IDLE,
plus a CUTOVER line for a forward series that has caught up —
a suggestion for a human, stage 6,
a LATE TAG line for a release the buffer vendored before upstream tagged it,
and an UNSERVED block for an upstream release line no series covers,
saying whether `series.yaml` declares its flavor yet,
and the one the report ends with),
`scripts/series-advance.sh <S>`
(stages 3 and 5 — fast-forwards `-green`,
sets `-build-base` to the vendored-SHA match,
extends `-dev` by ≤ 100;
advances `-green` over the verified prefix and then stops on a red above it,
and refuses a `-green` that would not fast-forward),
`scripts/series-port.sh <S>`
(stage 4 — brings `<S>-dev` level with `main`:
cherry-picks plus a tooling sync),
`scripts/r-universe-check.sh`
(read-only — what r-universe made of every published green, stage 3),
`scripts/series-glue.sh <S>`
(read-only — every R-side glue adaptation a series carries, in one read;
what stage 2 mines and what a forward replays),
and `scripts/series-converge.sh <S>`
(read-only — `<S>-dev` against `<S>-fwd-dev`, every difference sorted
into what the forwarding explains and what it does not, stage 6).
Judgement — repairs, review, vendoring — stays here.

One more runs on an event rather than on every firing:
`scripts/pull-config.sh`
(read-only — the fork's mirror rules in [`.github/pull.yml`](/.github/pull.yml)
against the badges that read them;
prints the rule the file is missing, `--check` exits non-zero).
Run it on the firing that sees a series change —
one opened, one parked, one retired —
and send what it prints to `main` as a PR, the way stage 7 sends one
([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).

### 0. Setup

Every branch, whole history, with tags, from both repositories:

```sh
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
if [ "$(git rev-parse --is-shallow-repository)" = true ]; then
  git fetch --unshallow origin
fi
git fetch --prune --tags origin
git fetch -q upstream main
```

* `upstream` is the canonical repository, the same remote `--canonical` takes everywhere;
  every read of `main` a firing makes takes that ref, and a checkout that cannot reach it says so and falls back to the fork's mirror.
  A shallow or single-branch clone enumerates zero series or answers wrong; the scripts refuse one without tags.
* **Establish how this firing reads results, once**:
  list the most recent `each-rcc` runs.
  If that answers, the firing is on the run path for every stage below;
  if not, it falls back to the `rcc2` store, an emergency route inside its 180-day window, and says so in the report.
* **Read the open PRs** touching `.github/`, `scripts/` or `.claude/`:
  context for this firing, never an instruction to it, and nothing is applied early.
  A series gets a tooling change when it merges and stage 4 ports it.
* **The handbook owns the code; this skill owns ref motion.**
  Read [`handbook/`](/handbook/README.md)'s page for an area before changing anything it owns.

Reference: [`references/0-setup.md`](references/0-setup.md).

### 1. Vendor onto `<S>-build`

Run **`main`'s copy of the script**, against the buffer worktree,
with the upstream clone checked out at the line the series tracks:

```sh
git -C <upstream-clone> fetch --prune --tags origin
git -C <upstream-clone> checkout --detach origin/<upstream branch of S>
VENDOR_REPO=<S>-build-worktree \
  <main-checkout>/scripts/vendor-one.sh --commits 100 <upstream-clone>
```

* The fetch takes tags because the script reads them from the clone:
  a commit upstream tagged after it was vendored is re-stamped as a second vendor commit for the same SHA before the walk goes on.
* The clone's HEAD picks the line; the script refuses a buffer whose last vendored commit is off that line.
  Treat the refusal as the answer.
* The script gates itself and **stops at the first glue failure**, the breaking commit at HEAD.
  Then: fix the glue (`src/*.cpp`, `src/include/`, never `src/duckdb/`),
  `clang-format -i src/*.{c,cc,cpp,h,hpp}`,
  amend into HEAD with an `R-side fix` section, rerun to finish the budget.
* A vendored tree broken by upstream itself is vendored on and folded into the next commit that repairs it (stage 2's fold rule).
* Push `<S>-build` unconditionally; red never blocks the buffer.

Reference: [`references/1-vendor.md`](references/1-vendor.md).

### 2. Repair the oldest `<S>-dev` failure

Every commit in `<S>-green..<S>-dev` was decided by an `each-rcc` leg, and that range is the loop's whole world.

* **Read the results from the runs that produced them**:
  the `each-rcc` runs on `<S>-dev` and `retry-<S>-dev`, their `each-logs-<shard>-<attempt>` artifacts (14 days),
  or the leg's job log after that; the higher run id wins.
  A leg exits 0 with red commits in it, so read every shard job, not the failed ones.
  Where a run cannot be read, the `rcc2` store holds the same bytes;
  `series-check.sh` reads only the store, and where it and a run disagree, the run is right.
* **A commit with no verdict has not been judged: wait, do not guess.**
  The run list says which kind of waiting it is.
  After **12 hours** with the run that should have decided it finished and silent, push `retry-<S>-dev` at it (below).
  Never amend a commit that has a record.
* **Classify each `failure` by what the commit's log contains:**

  | evidence | meaning | action |
  |---|---|---|
  | `Updating snapshots: '…'` | engine output drifted, or a flavor-dependent snapshot | fold the corrected files from `snapshot-<sha>-rcc-smoke-null` |
  | `Error ('test-….R:N:M')` | real test failure | fix test/R code at origin |
  | the cause is in `src/duckdb/` itself and the next upstream commit fixes it | upstream was transiently broken | fold the pair into one; if the next one is red too, forward-port |
  | `Changes detected in workflow_dispatch build` | style / roxygen drift | fix formatting at origin |
  | `Error: R CMD check found WARNINGs` / `ERRORs`, with the `❯ checking …` headers above it naming which checks | `R CMD check --as-cran` is unhappy about the tree, or about the environment CI built it in | read the named checks; fix at origin, or on `main` when the cause is the job's own setup |
  | a gate reached out and was refused — `cannot open URL`, `SSL connect error`, a refused or reset connection — while the tests themselves passed | infra, not the tree | rerun the commit: `retry-<S>-dev` |
  | the leg's record names a failed stage (`"failed_stages":["install"]`) and no rule above matched | the stage failed on its merits — most often an `install` that a glue call site this series' engine no longer offers stopped | fix the glue at origin; never a rerun |
  | none of the above, no test phase, and no failed stage in the record | cancelled or infra | rerun the commit: `retry-<S>-dev` |

  Never classify by absence of a marker.
* **Repair the oldest failure first.**
  Write the fix as a commit on the offending commit and let
  [`scripts/series-fold.sh`](/scripts/series-fold.sh) fold it and replay the tail, then force-push `<S>-dev`.
  Build and check locally first with `scripts/rcc-one.sh` after `git clean -fdx -- src/`;
  only a reviewed snapshot fold whose diff matches the upstream change goes straight to CI.
* **A test the engine cannot pass yet is gated, never deleted or rewritten**:
  `skip_if_engine_before("<version>", "<why>")` at the top of the `test_that()` body, folded like any repair,
  and taken out in the same pass where the series already holds that version.
  A `TESTS` line from `series-check.sh` is this stage's work too.
* **A transiently broken upstream commit is folded into the next one** when that one fixes it, the newer subject kept;
  forward-port into `patch/00NN-*.patch` only when the next commit is red too
  ([`vendoring/troubleshooting/`](/handbook/operations/vendoring/troubleshooting/README.md)).
* **On a forward series, mine the base before deriving anything**:
  a commit carrying a `Carried from` trailer already has the base's fix, so a red there is something else;
  `scripts/series-learned.sh <S>` and `scripts/series-glue.sh <S>` are the reads, whole set before any one carry.
* **Snapshot drift**: fetch `snapshot-<sha>-rcc-smoke-null`, review the diff as a code review, fold;
  a deleted snapshot file is a test that stopped running.

Reference: [`references/2-repair.md`](references/2-repair.md).

### 3. Advance the frontier, and read what r-universe made of the last one

```sh
scripts/series-advance.sh <S>            # stages 3 and 5 together
scripts/r-universe-check.sh              # every package, per target, reds only
scripts/r-universe-check.sh --log <id>   # the log behind one of them
```

* Fast-forward `<S>-green` to the newest `<S>-dev` commit with every commit behind it `success`;
  **if it cannot fast-forward, something rewrote verified history: stop and say so.**
* Mirror every series' green into the canonical repository, the forward's too, with a plain push;
  **scream on a refusal, never force it**.
* Set `<S>-build-base` to the `<S>-build` commit with the same vendored SHA, force-pushing where that is not a fast-forward;
  it is a marker, recomputed every stage 3, and a ref found off the buffer's line is set and moved on from.
* Read what r-universe made of the **previous** green on the platforms the gate never covers.
  **Never undo a push to green.**
  A platform DuckDB publishes no extensions for is not a finding ([`usage/extensions/`](/handbook/usage/extensions/README.md)).
  State every other finding in the message of the `-dev` commit that carries the fix, or of the next one minted:

  ```sh
  scripts/series-advance.sh <S> --dev-note <file>    # when stage 5 mints
  scripts/series-port.sh <S> --apply --dev-note <file>   # when only stage 4 does
  ```

* What a fix may be is the handbook's rule ([`architecture/glue/conventions/`](/handbook/architecture/glue/conventions/README.md)):
  a `patch/` entry is a prototype of an upstream change, a fix must cost Linux nothing and say which flags reproduced it,
  it belongs where its code lives (not always `main`), and it has to reach the buffer too.
  `series-port.sh --apply` carries entries onto the buffer by test-applying; `series-check.sh`'s `PATCH DRIFT` line is the backstop.

Reference: [`references/3-advance.md`](references/3-advance.md).

### 4. Port from `main`

The goal is identity, not curation:
after this stage, `.github/`, `scripts/` and `.claude/` on `<S>-dev` are byte-identical to `main`'s,
and `<S>-build`'s tooling is synced in the same run.

```sh
scripts/series-port.sh <S>                  # list candidates + identity check
scripts/series-port.sh <S> --apply          # cherry-pick all, sync, push
scripts/series-port.sh <S> --apply <sha>…   # a chosen subset instead
scripts/series-port.sh <S> --list           # walk a frozen series anyway
```

* Commits are classified TOOLING / MIXED / OTHER / VENDOR / VERSION;
  all but VENDOR and VERSION are picked by default, whole, never split.
* A frozen series (seeded from a release branch, or parked) takes the tooling sync alone by default;
  what its build needs is ported by SHA.
* A conflict stops the sequence in the kept worktree: resolve toward `main`'s intent, keeping the series' flavor where the two meet,
  `cherry-pick --continue`, push, rerun.
  An OTHER commit that cannot work against this engine is fixed on `main` and ported fixed.
* A live forward counterpart is ported the same way, every firing.
* Read the diff of any sync commit that appears: what it reverts that the series needs is a finding for `main`.

Reference: [`references/4-port.md`](references/4-port.md).

### 5. Extend `<S>-dev`

`series-advance.sh <S>` (above) appends the next ≤ 100 commits from `<S>-build`, restamps the fifth component, and pushes.

* **Extend on pending, never on red**: a reported `failure` in `<S>-green..<S>-dev` stops the stage until stage 2 has folded its fix.
* A live forward counterpart is not an exception: the base keeps consuming, so the two `-dev` branches stay comparable at the frontier.
* On a forward, each consumed buffer commit takes the base twin's fix by vendored SHA, with a `Carried from` trailer, and nothing twice;
  **a carry never stops a test the forward runs**, and names the kept path under `Not carried`.
* A conflicting carry, or a carry that leaves the glue uncompilable, **stops the stage with the worktree kept**:

  ```sh
  cd <the worktree it names>          # resolve, then git add
  scripts/series-advance.sh <S> --continue     # or --abort to discard
  ```

  A resolution that comes out empty is a resolution; `--continue` drops the pick.
* Then realign the derived strands, rc first and alpha after, on every firing that wrote `<S>-dev`:

  ```sh
  scripts/series-rc.sh <S> --push
  scripts/series-alpha.sh <S> --push
  ```

  Their reds are repaired on `<S>`, never on the strand.

Reference: [`references/5-extend.md`](references/5-extend.md).

### 6. Read the forwarding, and suggest a cutover — never perform one

```sh
scripts/series-converge.sh <S>
```

* Every series with a forward counterpart is read, caught up or not;
  a finding goes to the stage that should have moved it (a carry to 5, a port to 4, a one-sided fold to 2) and into the report.
* **A caught-up forward is reported, not swapped.**
  When `series-check.sh` prints a `CUTOVER` line, the firing carries this block into its summary whole,
  with `<S>` and the paths substituted, on every firing the condition holds:

  ```sh
  # Tooling from `main`, refs and tags from everywhere.
  git fetch --prune --tags --all
  git switch main && git merge --ff-only @{u}
  git -C ../../../duckdb fetch --prune --tags origin

  # Both halves of the question, before anything moves.
  scripts/series-check.sh <S> <S>-fwd --upstream ../../../duckdb
  scripts/series-converge.sh <S>

  # The gates, the convergence report, the review diff and the plan, with
  # nothing moved: read it, then decide.
  scripts/series-cutover.sh <S> --remote origin --upstream ../../../duckdb --prepare --out <dir>

  # The swap. It asks for the series name, archives each replaced lineage as
  # the head of a closed pull request, swaps the four refs, and moves the copy
  # of green that r-universe publishes from -- name that remote with
  # --canonical where it is not `upstream`, or the copy keeps serving the
  # pre-cutover lineage -- then deletes the forward's refs in both repositories.
  scripts/series-cutover.sh <S> --remote origin --upstream ../../../duckdb

  # A retired lineage moves the badge table, and the mirror rules with it.
  scripts/pull-config.sh --check
  ```

* The routine does not run the script and does not swap the refs by another route;
  the script refuses to swap without a terminal, and that refusal is the answer.

Reference: [`references/6-forwarding.md`](references/6-forwarding.md).

### 7. Open a PR for whatever the tooling got wrong

A firing that had to work around a bug in the tooling owes `main` a PR before it ends.

* If an open PR already covers the cause, add this firing's evidence to it; never merge one yourself.
* Work around by hand first, finish the firing, then write the PR; a workaround that cannot be done by hand is a finding, and the firing stops.
* One PR per cause, small, against `main`, with the run, the commit and the log line as evidence.
* Not a tooling PR: anything the *same firing done again* would not hit, such as a red vendored tree, a settled flake, a drifted snapshot.

Reference: [`references/7-tooling-prs.md`](references/7-tooling-prs.md).

## What a firing reports

* `series-check.sh`'s `UNSERVED` block, verbatim and last, from a run with `--upstream <upstream-clone>`,
  whenever the script prints one; it outranks a quiet pass and repeats until the refs exist.
* The same line at the top, with the backlog `scripts/series-cut.sh <S> --upstream <clone> --check` prints,
  and `main`'s wrong version (`scripts/preview-prefix.sh --check`), which is owed whatever is decided about the line.
* The flavor's declaration PR against `scripts/series.yaml`, opened once after searching open and closed PRs for it;
  cutting the refs stays `series-open/SKILL.md`'s and a human's.
* A reading that failed, reported as one.
* A `LATE TAG` line stage 1 did not clear: the buffer has vendored past the tag, and the release branch takes the re-stamp at CUT
  ([`scripts/VENDORING.md`](/scripts/VENDORING.md#a-tag-upstream-pushed-late)); name the series, the tag and the commit.
* A due cutover, above the `UNSERVED` block, as stage 6's block filled in.
* Which source served the verdicts, and any record missing from the store and what it was for.

Reference: [`references/report.md`](references/report.md).

## Rerun one commit: `retry-<S>-dev`

A run that failed for reasons the commit had no part in is judged again, beside the series, without rewriting anything:

```sh
git push --force-with-lease origin \
  "<the failing commit>:refs/heads/retry-<S>-dev"
```

* The tip is replanned in spite of its verdict; the rest of `<S>-green..tip` keeps the ordinary rule.
  A retry branch naming a series with no green plans nothing.
* **The branch is the ledger**: `retry-<S>-dev` already on this commit means it has had its one rerun and failed again,
  which is REPAIR, never RETRY; pointing elsewhere, force-update it and rerun.
* The verdict reaches the loop from the rerun's own run, which carries the higher run id.
* A verdict the job decided rather than the tree is dropped, `scripts/rcc-drop.sh <sha>...`, so the commit is planned again;
  never run `rcc-logs.sh` behind a drop.
* A series whose commits predate `each.yaml` retries by hand: dispatch `each-rcc` on `retry-<S>-dev` with `force=true` and `max-commits=1`.

Reference: [`references/retry.md`](references/retry.md).

## Commit-message contract

- `-build`: the vendor message as `vendor-one.sh` writes it,
  plus an `R-side fix` section when the glue was adapted in that commit,
  or a transient `patch/` entry was folded in to repair the tree.
- `-dev`: the same message,
  extended with any test / R code / patch adaptations
  folded in during repair.

## Traps, all paid for once already

Read [`references/traps.md`](references/traps.md) before a local build, a replay or a port that conflicts.
Its entries:
clean every build product between local builds;
clang-format must be clean;
never `git reset --hard` while HEAD is on a branch you keep;
restore whole directories, not touched files;
every buffer still keeps cpp11 where it kept it before #2649, so `src/Makevars` conflicts on every replayed pick;
a `.dd` file naming a header the flavor renamed stops the build before the first compile;
`src/cpp11.cpp` conflicts on every port that adds an entry point, and is regenerated rather than merged.

## Invariants

- `<S>-green` moves forward only.
  `<S>-build-base` does not: it is a marker with no consumer,
  recomputed from the vendored-SHA match every stage 3,
  and set — force-pushed where it has to be — rather than advanced.
- Cutover is manual.
  The loop reports that a forward series has caught up
  and prints the command; it never runs it,
  and never swaps the refs by another route.
  The script archives what it replaces before it swaps, and deletes the forward's refs afterwards;
  what a refused deletion leaves is cutover litter, which `scripts/series-prune.sh` lists for a human.
  Every other ref move in this skill is the routine's to make.
- Opening a series is manual too, and its trigger is upstream's branch cut.
  The loop reports a release line no series covers,
  at the end of every firing until the refs exist;
  it creates none of them.
- A base is advanced on completed, successful runs —
  never on absence of a failure.
- Fixes are folded into the commit that needs them,
  never stacked on top:
  every commit of `<S>-dev` must remain independently green
  so the chain stays bisectable.
- **Every vendor commit raises the fifth version component.**
  `DESCRIPTION:Version` must be strictly greater
  than its parent's on every commit that vendors,
  on `-build` and on `-dev` alike.
  The counter is what orders the series —
  r-universe installs by version,
  and a run of commits sharing one version
  is a run r-universe cannot tell apart.
  Gaps are fine; repeats are not.

  A replay does not deliver it while `-dev` and `-build`
  carry different `major.minor.patch` prefixes:
  the merge driver's gate then keeps our side verbatim
  and the counter freezes for the whole chain
  ([`operations/releases/versioning/`](/handbook/operations/releases/versioning/README.md)).
  `main` is in that state.
  So after any replay, **restamp before pushing `-dev`**:
  walk the new commits oldest first
  and bump once per vendor commit from the parent's value.
  [`scripts/series-advance.sh`](/scripts/series-advance.sh) does that
  and then asserts it;
  a replay done by hand is checked the same way,
  because one that silently froze the counter
  looks exactly like one that did not.
- **Every ref move is git alone.**
  Even a rerun is one pushed ref —
  `retry-<S>-dev`, which asks for one commit to be judged again
  without rewriting anything —
  and `each.yaml` plans runs
  for any commit in `<S>-green..tip` that has no verdict.
  Nothing a firing *writes* needs an API.
- **What a firing reads comes from the runs, and falls back to git.**
  The `each-rcc` run that decided a commit is the source of its verdict
  and its log; the `rcc2` store is a copy, reachable with git alone,
  for a firing that cannot read the runs.
  Neither source may be *required*: a firing that has only one of them
  still finishes, and says in its report which one it had.
  The fallback is an emergency route *for the firing*, and is not kept warm:
  the sweep is `rcc-logs.sh` run by hand, never a workflow and never scheduled,
  so a firing that needs the copy complete reports the gap
  instead of waiting on one — it never blocks on one.
  On the CI side the store is nobody's fallback:
  selection reads it and only it,
  which is why the leg's per-commit publish stays automatic.
