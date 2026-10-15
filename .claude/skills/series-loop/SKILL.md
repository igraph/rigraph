---
name: series-loop
description: Drive rigraph's vendoring series loop for its one series, `main`, published as `igraph.dev`. Vendor the next igraph C commits onto `main-vendor` and pick them onto `main-build`, repair the oldest red on `main-dev` by folding the R-side fix into its vendor commit, promote what is green to `main-green` and mirror it into igraph/rigraph, port `main`, and extend `main-dev`. Use when asked to run, advance, continue or repair the series loop or the `main` series, when a scheduled routine fires for it, or when `main-green` has fallen behind its buffer.
---

# The series loop: vendor, promote, repair

The routine that walks the vendored igraph C library forward one upstream commit at a time,
lets CI judge every commit, and publishes the verified prefix.
It is a scheduled agent routine, not a workflow:
nothing under `.github/` starts it, and its schedule lives with the routine, outside this tree.
Nothing is scheduled yet.
A firing runs in a fresh cloud session with `krlmlr/rigraph`, `igraph/rigraph` and `igraph/igraph` attached;
`krlmlr/igraph` is public and is read anonymously.
It replaces the manual playbook [`rcc-smoke-fix.md`](/.claude/skills/rcc-smoke-fix.md),
which repaired by forking `broken-<sha>-dev` branches; this loop repairs in place.
The loop and its scripts are ported from duckdb-r ([`.series-source`](/.series-source) records from where).

**This file is the playbook**: the order of the stages, the commands, the verdicts and the stop rules.
Every stage has a reference beside it under [`references/`](references/),
which holds the reasoning each rule rests on, the traps paid for once, and the history that explains the shape.
Read a stage's reference the first time the stage has work in a firing, and whenever the stage does not go as this file says;
a rule here that reads as arbitrary is explained there, never overridden here.

## Two repositories, one series

* **`igraph/rigraph`** is canonical.
  Its `main` is the source of truth for R code, tests, CI, `scripts/` and these skills, and r-universe builds from it.
* **`krlmlr/rigraph`** is a GitHub fork of it.
  It mirrors `main` through the Pull app ([`.github/pull.yml`](/.github/pull.yml)), holds the series refs,
  and runs the per-commit CI ([`.github/workflows/each.yaml`](/.github/workflows/each.yaml), `scripts/each-*.sh`, `scripts/rcc-*.sh`),
  which writes every verdict to the `rcc2` store branch.

There is one series, `main`, tracking upstream `main`.
It is flavored as the package `igraph.dev` ([`scripts/flavor.sh`](/scripts/flavor.sh) `dev`),
the bleeding edge, installable beside `igraph`, declared in [`scripts/series.yaml`](/scripts/series.yaml)
and published by r-universe from `main-green`, which `scripts/series-advance.sh` mirrors into `igraph/rigraph`.
`<S>` in a script's usage is a series prefix, today always `main`.

| ref | who writes it | what it is |
|---|---|---|
| `main-vendor` | the routine; force-pushed only by it, to fold a fix into a strand commit nothing has picked yet | Every upstream first-parent commit vendored once, by `vendor-one.sh --strand`: the vendor paths alone (`series_vendor_paths` in [`scripts/series-config.sh`](/scripts/series-config.sh)), no counter, no glue gate. Not mirrored, and no CI runs here. The strand the buffer is derived from. |
| `main-build` | the routine, unconditionally | `main-vendor`'s commits picked one to one by `series-vendor.sh`, with what the buffer regenerates, the counter stamped, and the glue compiling at every commit. **No CI runs here** (`each.yaml` never matches `*-build`). The buffer. |
| `main-dev` | the routine, force-push | `main-build` commits, consumed up to 100 at a time, with R-side fixes folded in as CI demands. What CI builds, commit by commit. |
| `main-green` | the routine, fast-forward only | The newest commit such that every commit in `main-green..it` has a `success` verdict. What r-universe builds `igraph.dev` from. |
| `main-build-base` | the routine, force-push | The `main-build` commit vendoring the same upstream SHA as `main-green`. A marker with no consumer, recomputed every stage 3. |

Equivalence between `-build` and `-dev` commits is by the `<owner>/igraph@<sha>` reference in the commit subject:
**the subject is what decides, never the path**,
and `vendored_sha()` looks past non-vendor commits 20 deep and says so on stderr when that is not enough.
The owner is `krlmlr/igraph` on the replay of igraph 0.10.17 to 1.0.1 and `igraph/igraph` from its seam on,
and [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) crosses the seam by itself.

**A series is discovered, not configured**: every `<X>-build` with a sibling `<X>-dev` is a series the firing serves.
Not a series, and given no stage of its own:
`main-vendor` (the vendor strand the buffer is derived from, which stage 1 serves),
`retry-main-dev` (the retry ledger), `main-rc-dev` (the unflavored mirror, cut only when a landing is planned)
and `main-land-*` (a landing).

**All four refs and the strand exist from day one, and green starts below the flavor commits.**
`main-vendor`, `main-build`, `main-dev` and `main-build-base` start at the seed tip,
`igraph/rigraph`'s `main` plus `flavor.sh`'s two commits plus `chore: Add fifth version component`,
while `main-green` starts at the seed's base, `main` itself,
so that CI judges the flavor commits first and green crosses them once they pass:
`igraph.dev` is a rename that has never been built
(duckdb-r#2868's rule, [`series-open`](/.claude/skills/series-open/SKILL.md)).
There is never a "no green yet" state, and every walk below is bounded by `main-green`.

Reference: [`references/series.md`](references/series.md).

### Not ported yet

What duckdb-r needs for more than one line is not ported, and nothing here calls it until its trigger fires:

* **Forwarding** a series onto a newer `main`, with its convergence read, cutover, prune and mining scripts:
  triggered by the first landing, after which `main` carries the series' vendor commits under other SHAs,
  or by `main` moving so far under the seed that stage 4's ports stop applying.
* **Release-branch series**, their cut, reflavor and preview prefix:
  igraph cuts no release branch the package serves; one that ever needs its own flavor is the trigger.
* **The alpha strand**, which served duckdb's extension downloads: igraph has nothing like them.
* **The store sweep and drop** (`rcc-logs.sh`, `rcc-drop.sh`):
  triggered by a firing that needs a record no leg ever published, or by a run of verdicts the job decided rather than the tree.
* **Generated mirror rules and badge tables**: the fork mirrors one branch, by one rule written by hand; a second is the trigger.

## One firing

Set up first, then work through the stages in order;
each stage is skippable when it has nothing to do, the setup is not.
The scripts carry the mechanical parts, and judgement (repairs, review, vendoring) stays here.
The ones a firing runs or reads on every pass:

* [`scripts/series-check.sh`](/scripts/series-check.sh), read-only:
  classifies from the `rcc2` store, which is stage 2's fallback source, not its first one,
  and prints one verdict per series, ADVANCE / WAIT / RETRY `<sha>` / REPAIR `<sha>` / IDLE,
  with a `PATCH DRIFT`, a `TESTS`, a `LATE TAG` and a `VENDOR` line where they apply,
  the third for a release the buffer vendored before upstream tagged it, the last for a strand missing, ahead of the buffer or behind it;
* [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) `--strand` and [`scripts/series-vendor.sh`](/scripts/series-vendor.sh), stage 1;
* [`scripts/series-fold.sh`](/scripts/series-fold.sh) and [`scripts/rcc-one.sh`](/scripts/rcc-one.sh), stage 2;
* [`scripts/series-advance.sh`](/scripts/series-advance.sh), stages 3 and 5:
  fast-forwards `-green` and mirrors it, sets `-build-base` to the vendored-SHA match, extends `-dev` by ≤ 100;
  advances `-green` over the verified prefix and then stops on a red above it, and refuses a `-green` that would not fast-forward;
* [`scripts/r-universe-check.sh`](/scripts/r-universe-check.sh), read-only, stage 3;
* [`scripts/series-port.sh`](/scripts/series-port.sh), stage 4: cherry-picks from `main`, a tooling sync on both refs,
  and the `patch/` carry onto the strand ([`scripts/series-patch-sync.sh`](/scripts/series-patch-sync.sh));
* [`scripts/series-rc.sh`](/scripts/series-rc.sh), last, once `main-rc-dev` exists.

### 0. Setup

The fork and the canonical repository, every branch, whole history, with tags,
and tooling run from the canonical `main`:

```sh
git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
if [ "$(git rev-parse --is-shallow-repository)" = true ]; then
  git fetch --unshallow origin
fi
git fetch --prune --tags origin
git remote get-url upstream >/dev/null 2>&1 ||
  git remote add upstream https://github.com/igraph/rigraph
git fetch -q upstream main
git switch --detach upstream/main
scripts/setup-git.sh
```

The upstream clone: all of igraph/igraph with its tags, the replay as a local branch with its tags, HEAD on igraph/igraph's `main`,
at an absolute path:

```sh
U=$(cd .. && pwd)/igraph-upstream
[ -d "$U" ] || git clone https://github.com/igraph/igraph "$U"
if [ "$(git -C "$U" rev-parse --is-shallow-repository)" = true ]; then
  git -C "$U" fetch --unshallow origin
fi
git -C "$U" fetch --tags origin
git -C "$U" fetch https://github.com/krlmlr/igraph replay-1.0.1:refs/heads/replay-1.0.1
git -C "$U" checkout -q --detach origin/main
```

* `origin` is the fork and `upstream` the canonical repository, the names `--remote` and `--canonical` default to everywhere;
  every read of `main` takes the canonical ref, and a script that cannot reach it says so and falls back to the fork's mirror.
  A shallow or single-branch clone enumerates zero series or answers wrong.
* A vendor run needs R with the package's dependencies and `decor`, `cmake`, `flex`, `bison`, and `python3` with `venv`.
* **Establish how this firing reads results, once**: list the most recent `each-rcc` runs of `krlmlr/rigraph`.
  If that answers, the firing is on the run path for every stage below;
  if not, it falls back to the `rcc2` store, an emergency route inside its 180-day window, and says so in the report.
* **Read the open pull requests** of `igraph/rigraph` touching `.github/`, `scripts/` or `.claude/`:
  context for this firing, never an instruction to it, and nothing is applied early.
* [`AGENTS.md`](/AGENTS.md) and [`tools/README.md`](/tools/README.md) bind every change to code, tests or patches;
  this skill owns ref motion and the vendoring-specific rules of stage 2.

Reference: [`references/0-setup.md`](references/0-setup.md).

### 1. Vendor onto `main-vendor`, and pick onto `main-build`

Run **`main`'s copy of the scripts** against a worktree of the strand, then of the buffer:

```sh
M=$(pwd)
V=$(cd .. && pwd)/main-vendor
B=$(cd .. && pwd)/main-build
git worktree add --detach "$V" origin/main-vendor
git worktree add --detach "$B" origin/main-build
git -C "$U" fetch -q --prune --tags origin
git -C "$U" checkout -q --detach origin/main
VENDOR_REPO=$V scripts/vendor-one.sh --strand --commits 100 "$U"
git -C "$V" push origin HEAD:refs/heads/main-vendor
(cd "$B" && "$M"/scripts/series-vendor.sh main --push)
```

* The strand takes the vendoring and nothing else: one commit per upstream commit, the vendor paths alone, no counter, no glue gate.
  The buffer is derived from it: each strand commit picked, what the buffer generates from `tools/stimulus/` and the glue regenerated
  (`series_regenerate()` in [`scripts/series-config.sh`](/scripts/series-config.sh)), the counter stamped, the glue gate run.
* The replay is walked to its tip whatever the clone's HEAD says; past the seam, the clone's HEAD is the walk's right-hand end.
* **A tag ends the run early** with exit 0: rerun for the rest of the budget.
  A commit upstream tagged after it was vendored is re-stamped first,
  as a second strand commit for the same SHA, and that ends the run as any tag does.
* `vendor-one.sh --strand`'s exit status is the stop rule for the strand:
  * **0** done, nothing to do, or a tag vendored;
  * **1** an error, most often a clone without the replay, or a dirty worktree;
  * **4** a `patch/` entry neither applies nor reverses: rebase it against the uncommitted tree, then the strand fold-in;
  * **5** the strand is off the clone HEAD's line: check out igraph/igraph's `main`, rerun;
  * **6** a shallow or untagged clone (fix it as above);
  * **7** `GENERATOR FAILED`, CMake, flex or bison: install what is missing, or for a grammar add a `patch/` entry, then the strand fold-in.
* The strand fold-in puts the fix into the strand commit that needs it, before anything picks it,
  and writes the message with `-F`, never an editor:

  ```sh
  git -C "$V" checkout -- . && git -C "$V" clean -fd src     # then put the fix back
  git -C "$V" commit -m 'tmp: fix generation' -- <the fix>
  VENDOR_REPO=$V scripts/vendor-one.sh --strand --commits 1 "$U"
  { git -C "$V" log -1 --format=%B; printf '\nR-side fix:\n\n%s\n' '<what was adapted, and why>'; } > "$V.msg"
  git -C "$V" reset --soft HEAD~2 && git -C "$V" commit -q -F "$V.msg"
  ```

* `series-vendor.sh`'s exit status is the stop rule for the buffer, the pick at HEAD of `$B` unless it says otherwise:
  * **0** every strand commit picked, or nothing to pick;
  * **1** refused, or a pick that conflicts: patch drift between the strand and the buffer;
  * **3** glue broken: fix the hand-written glue in `src/`, or `tools/stimulus/` and regenerate,
    never `src/vendor/` or a generated file by hand;
    amend into HEAD with an `R-side fix` section, rerun to finish the picks;
  * **7** `GENERATOR FAILED`, Stimulus or `cpp11::cpp_register()`: the pick is undone, and the fix is the buffer's,
    committed and then folded into the pick that the rerun takes again above it (the reference's buffer fold-in);
  * **8** `./configure` failed and the glue check could not run (do not amend).
  The strand commit stays as it is: what the buffer fixes is the buffer's.
* A `patch/` entry is the strand's: a fix to one amends the strand commit that needs it, before it is picked,
  and an entry the buffer needs later is a commit of its own on `main-vendor`, picked like any other.
* A vendored tree broken by upstream itself is vendored on and folded into the next commit that repairs it (stage 2's fold rule).
* A series with no strand yet derives one from its buffer, once: `scripts/series-vendor.sh main --init --push`,
  which `series-check.sh` asks for as `VENDOR`.
* Push `main-vendor` and `main-build` unconditionally; red never blocks the buffer.

Reference: [`references/1-vendor.md`](references/1-vendor.md).

### 2. Repair the oldest `main-dev` failure

Every commit in `main-green..main-dev` is decided by an `each-rcc` leg, and that range is the loop's whole world.

* **Read the results from the runs that produced them**:
  the `each-rcc` runs on `main-dev` and `retry-main-dev`, their `each-logs-<shard>-<attempt>` artifacts (14 days),
  or the leg's job log after that; the higher run id wins.
  A leg exits 0 with red commits in it, so read every shard job, not the failed ones.
  Where a run cannot be read, the `rcc2` store holds the same bytes;
  `series-check.sh` reads only the store, and where it and a run disagree, the run is right.
* **A commit with no verdict has not been judged: wait, do not guess.**
  The run list says which kind of waiting it is.
  After **12 hours** with the run that should have decided it finished and silent, push `retry-main-dev` at it (below).
  Never amend a commit that has a record.
* **Classify each `failure` by what the commit's log contains:**

  | evidence | meaning | action |
  |---|---|---|
  | `Updating snapshots: '…'` | output drifted with the engine, or a flavor-dependent snapshot | review and fold the corrected files from `snapshot-<sha>-rcc-smoke-null` |
  | `Error ('test-….R:N:M')` | a real test failure | fix at the offending commit, by the rules below |
  | the cause is in `src/vendor/` and the next upstream commit fixes it | upstream was transiently broken | fold the pair into one; if the next is red too, a `patch/` entry |
  | `Changes detected in workflow_dispatch build` | style or roxygen drift | `air format .`, `devtools::document()`, fold at the offending commit |
  | the record's failed stage is `regen` | the generated R/C interface or cpp11 registration does not reproduce | regenerate, fixing `tools/stimulus/` where needed, and fold |
  | `Error: R CMD check found WARNINGs` / `ERRORs`, with `❯ checking …` headers naming the checks | `R CMD check --as-cran` is unhappy with the tree, or with the environment CI built it in | read the named checks; fix at the offending commit, or on `main` when the cause is the job's own setup |
  | killed at the shard budget, or a stage "exceeded its … budget" | the gate did not finish | repair; a rerun buys the same kill |
  | a gate reached out and was refused (`cannot open URL`, `SSL connect error`, a refused or reset connection) while the tests passed | infrastructure, not the tree | rerun the commit: `retry-main-dev` |
  | the record names another failed stage (`"failed_stages":["install"]`) and no rule above matched | the stage failed on its merits, most often an `install` the glue or a link stopped | fix at the offending commit; never a rerun |
  | none of the above, no test phase, and no failed stage in the record | cancelled or infrastructure | rerun the commit: `retry-main-dev` |

  Never classify by the absence of a marker.
* **Repair the oldest failure first, and fold the fix into the vendor commit that needs it**, never appended,
  with an `R-side fix` section added to its message.
  Write the fix as a commit on the offending commit and let `series-fold.sh` fold it and replay the tail:

  ```sh
  W=$(cd .. && pwd)/repair
  git worktree add --detach "$W" <offending commit>
  # write the fix in $W, then
  git -C "$W" commit -q -m '<what was adapted>' -- <the fix>
  (cd "$W" && scripts/series-fold.sh origin/main-dev --fold <offending commit>=HEAD:'R-side fix: <what was adapted, and why>')
  # build and check the repaired commit locally before this push (below)
  git -C "$W" push --force-with-lease=refs/heads/main-dev:$(git rev-parse origin/main-dev) origin HEAD:refs/heads/main-dev
  ```

  Build and check locally first with `scripts/rcc-one.sh` after `git clean -fdx -- src/`;
  only a reviewed snapshot fold whose diff matches the upstream change goes straight to CI.
  A fix the buffer needs to compile is mirrored onto `main-build` too, in the commit for the same upstream SHA,
  and a `patch/` entry onto `main-vendor` as a commit of its own, which stage 1 picks.
* **Adapt the R side by the maintainer's rules:**
  * Wrap new C behaviour without changing the R interface.
  * Put new arguments behind `...`, checked with `check_dots_empty()`.
  * Guard fallbacks for old behaviour with `lifecycle::signal_stage("superseded")`.
  * In any function you touch, replace `.Call()` outside `aaa-*.R` with `_impl()` calls, adapting the Stimulus definitions where needed.
  * The `aaa-*.R` files are always autogenerated, never changed manually.
    For genuine igraph problems, prefer `patch/` and Stimulus over handwritten workarounds.
  * Change tests only as a last resort, with a comment saying why.
* **Fix at the first level that resolves the failure, in this order:**
  1. `patch/`, for C-level breakage;
  2. the Stimulus definitions, `tools/stimulus/*.yaml`, then regenerate;
  3. R code;
  4. snapshots, only after confirming the new output is correct;
  5. tests, as a last resort, with a comment `# upstream igraph@<short-sha>: <reason>`.
* **A series never stops a test `main` runs.**
  Where an older engine cannot pass a test, gate it with `skip_if_engine_before("<version>", "<why>")`
  ([`tests/testthat/helper-skip.R`](/tests/testthat/helper-skip.R)) at the top of the `test_that()` body, folded like any repair,
  and take the gate out in the same pass where the series already holds that version.
  Never delete, rewrite or skip a test without a version to end the skip.
  A `TESTS` line from `series-check.sh` is this stage's work too.
* **A transiently broken upstream commit is folded into the next one** when that one fixes it, the newer subject kept;
  a `patch/` entry only when the next commit is red too.
* **Snapshot drift**: fetch `snapshot-<sha>-rcc-smoke-null`, review the diff as a code review, fold;
  a deleted snapshot file is a test that stopped running.
* **A red on a flavor commit is the rename's**: fix the flavor tooling on `main`, and fold the same change into the flavor commit.

Reference: [`references/2-repair.md`](references/2-repair.md).

### 3. Advance the frontier, and read what r-universe made of the last one

```sh
scripts/series-advance.sh main            # stages 3 and 5 together
scripts/r-universe-check.sh               # every package, per target, reds only
scripts/r-universe-check.sh --log <id>    # the log behind one of them
```

* Fast-forward `main-green` over the commits whose `rcc2` record is `success`, and no further than the first that is not;
  **if it cannot fast-forward, something rewrote verified history: stop and say so.**
* Mirror `main-green` into `igraph/rigraph` with a plain push, on every run;
  **scream on a refusal, never force it**.
* Set `main-build-base` to the `main-build` commit with the same vendored SHA, force-pushing where that is not a fast-forward;
  it is a marker, recomputed every stage 3, and a ref found off the buffer's line is set and moved on from.
* Read what r-universe made of the **previous** green, on the platforms the gate never covers.
  **Never undo a push to green.**
  State every finding in the message of the `-dev` commit that carries the fix, or of the next one minted:

  ```sh
  scripts/series-advance.sh main --dev-note <file>        # when stage 5 mints
  scripts/series-port.sh main --apply --dev-note <file>   # when only stage 4 does
  ```

* A `patch/` entry is a prototype of an upstream change, sent to `igraph/igraph`;
  a fix must cost Linux nothing and say which flags reproduced it;
  it belongs where its code lives, which is not always `main`; and it has to reach the strand too, which the buffer picks it from.
  `series-port.sh --apply` carries entries onto the strand by test-applying, and stage 1's pick takes them to the buffer;
  an entry the firing writes itself is committed onto `main-vendor` too; `series-check.sh`'s `PATCH DRIFT` line is the backstop.

Reference: [`references/3-advance.md`](references/3-advance.md).

### 4. Port from `main`

The goal is identity, not curation:
after this stage `.github/`, `scripts/` and `.claude/` on `main-dev` are byte-identical to `main`'s,
and `main-build`'s tooling is synced in the same run.

```sh
scripts/series-port.sh main                  # list candidates and the identity check
scripts/series-port.sh main --apply          # cherry-pick all, sync, carry patches, push
scripts/series-port.sh main --apply <sha>…   # a chosen subset instead
```

* Commits are classified TOOLING / MIXED / OTHER / VENDOR / VERSION; all but VENDOR and VERSION are picked by default, whole, never split.
* A conflict stops the sequence in the kept worktree: resolve toward `main`'s intent, keeping the flavor where the two meet,
  `cherry-pick --continue`, push, rerun.
  Generated files are regenerated, never merged ([`references/traps.md`](references/traps.md)).
  An OTHER commit that cannot work against this engine is fixed on `main` and ported fixed.
* Read the diff of any sync commit that appears: what it reverts that the series needs is a finding for `main`.

Reference: [`references/4-port.md`](references/4-port.md).

### 5. Extend `main-dev`

`series-advance.sh main` (above) appends the next ≤ 100 commits from `main-build`, restamps the fifth component, and pushes.

* **Extend on pending, never on red**: a reported `failure` in `main-green..main-dev` stops the stage until stage 2 has folded its fix.
* A conflicting replay **stops the stage with the worktree kept**:

  ```sh
  cd <the worktree it names>                     # resolve, then git add
  scripts/series-advance.sh main --continue     # or --abort to discard
  ```

  A resolution that comes out empty is a resolution; `--continue` drops the pick.
* Then, once `main-rc-dev` exists, realign it on every firing that wrote `main-dev`;
  its reds are repaired on `main-dev`, never on the strand:

  ```sh
  scripts/series-rc.sh main --push
  ```

Reference: [`references/5-extend.md`](references/5-extend.md).

### 6. Read the forwarding: not ported

rigraph has no forward series, so there is nothing to read and no cutover to suggest;
`series-check.sh` prints a `CUTOVER` line only beside an `-fwd` series, and none exists.

### 7. Open a pull request for whatever the tooling got wrong

A firing that had to work around a bug in the tooling owes `igraph/rigraph`'s `main` a pull request before it ends.

* If an open pull request already covers the cause, add this firing's evidence to it; never merge one yourself.
* Work around by hand first, finish the firing, then write the pull request;
  a workaround that cannot be done by hand is a finding, and the firing stops.
* One pull request per cause, small, against `main`, with the run, the commit and the log line as evidence.
* Not a tooling pull request: anything the *same firing done again* would not hit,
  such as a red vendored tree, a settled flake, a drifted snapshot.

Reference: [`references/7-tooling-prs.md`](references/7-tooling-prs.md).

## What a firing reports

* Per series, `series-check.sh`'s verdict and what each stage did,
  including where the buffer stands upstream: on the replay, at the seam, or past it.
* Which source served the verdicts, and any record missing from the store and what it was for.
* Anything left stopped: a vendor run's exit status with its banner, a kept worktree, an unresolved conflict.
* What r-universe made of the previous green, and the `-dev` commit that records it.
* The tooling pull requests opened or given evidence.
* Once `main-green` vendors the seam, tag 1.0.1:
  the first landing has become possible ([`series-land`](/.claude/skills/series-land/SKILL.md)).
* A `LATE TAG` line that stage 1 did not clear.
* A reading that failed, reported as one.

Reference: [`references/report.md`](references/report.md).

## Rerun one commit: `retry-main-dev`

A run that failed for reasons the commit had no part in is judged again, beside the series, without rewriting anything:

```sh
git push --force-with-lease origin "<the failing commit>:refs/heads/retry-main-dev"
```

* The tip is replanned in spite of its verdict; the rest of `main-green..tip` keeps the ordinary rule.
* **The branch is the ledger**: `retry-main-dev` already on this commit, with the rerun reported,
  means it has had its one rerun and failed again, which is REPAIR, never RETRY;
  pointing elsewhere, force-update it and rerun.
* The verdict reaches the loop from the rerun's own run, which carries the higher run id.
* A verdict the job decided rather than the tree is dropped from `rcc2`, so the next run plans the commit again;
  the script for it is not ported, so a drop is a hand-made commit on `rcc2`, done only for that cause.
* A commit whose tree predates `each.yaml` retries by hand: dispatch `each-rcc` on `retry-main-dev` with `force=true` and `max-commits=1`.

Reference: [`references/retry.md`](references/retry.md).

## Commit-message contract

- `-vendor`: the vendor message as `vendor-one.sh --strand` writes it,
  plus an `R-side fix` section when `patch/` was adapted in that commit.
- `-build`: the strand commit's message as `series-vendor.sh` picks it,
  plus an `R-side fix` section when the glue or `tools/stimulus/` was adapted in that commit.
- `-dev`: the same message, extended with every R-side fix folded in during repair,
  each naming the upstream change and what was adapted, and with any r-universe finding stage 3 recorded.
- A folded transient pair keeps the newer subject and names the folded SHA and subject in the body.
- A test changed as a last resort carries `# upstream igraph@<short-sha>: <reason>` in the test itself.

## Traps, all paid for once already

Read [`references/traps.md`](references/traps.md) before a vendor run, a local build, a replay or a port that conflicts.
Its entries:
relative paths resolve against the buffer worktree;
a remote-tracking or tagless replay is invisible to the vendor run;
clean every build product between local builds;
the style gate must be clean;
never `git reset --hard` while HEAD is on a branch you keep;
restore whole directories, not touched files;
generated files conflict on ports and are regenerated rather than merged.

## Invariants

- `main-green` moves forward only.
  `main-build-base` does not: it is a marker with no consumer,
  recomputed from the vendored-SHA match every stage 3, and set, force-pushed where it has to be, rather than advanced.
- Opening a series and landing one are manual
  ([`series-open`](/.claude/skills/series-open/SKILL.md), [`series-land`](/.claude/skills/series-land/SKILL.md)).
  The loop reports when a landing becomes possible and never performs one.
  Every other ref move in this skill is the routine's to make.
- Green is advanced on completed, successful verdicts, never on the absence of a failure.
- Fixes are folded into the commit that needs them, never stacked on top:
  every commit of `main-dev` must remain independently green, so the chain stays bisectable.
- **Every vendor commit raises the fifth version component.**
  `DESCRIPTION:Version` must be strictly greater than its parent's on every commit that vendors, on `-build` and on `-dev` alike.
  The counter is what orders the series: r-universe installs by version, and cannot tell apart a run of commits sharing one.
  Gaps are fine; repeats are not.
  A replay does not deliver it while `-dev` and `-build` carry different `major.minor.patch` prefixes,
  because the merge driver then keeps our side verbatim,
  so after any replay **restamp before pushing `-dev`**: bump once per vendor commit, oldest first, from the parent's value.
  `series-advance.sh` does that and then asserts it; a replay done by hand is checked the same way.
- **Every ref move is git alone.**
  Even a rerun is one pushed ref, and `each.yaml` plans runs for any commit in `main-green..tip` that has no verdict.
  Nothing a firing *writes* needs an API.
- **What a firing reads comes from the runs, and falls back to git.**
  The `each-rcc` run that decided a commit is the source of its verdict and its log;
  the `rcc2` store is a copy reachable with git alone, for a firing that cannot read the runs.
  Neither may be *required*: a firing that has only one of them still finishes, and says which it had.
  The fallback is not kept warm, since the sweep is not ported,
  so a firing that needs the copy complete reports the gap rather than waiting on one.
  On the CI side the store is nobody's fallback: planning reads it and only it, which is why the leg's publish stays automatic.
