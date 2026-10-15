# Stage 2: repair the oldest `main-dev` failure

*Reference for stage 2 of [`series-loop`](../SKILL.md), read when the stage has work.*

Every commit in `main-green..main-dev` is decided by an `each-rcc` leg,
and **the leg's own run is where its result is read**.
That range is the loop's whole world: nothing at or before `main-green` is ever re-examined.

## Read the results from the runs that produced them

List the `each-rcc` runs on `main-dev` and on `retry-main-dev`, newest first, back to when `main-green` last moved,
and take each run's `each-logs-<shard>-<attempt>` artifacts, one per leg, holding for the commits that leg decided
exactly what the `rcc2` store holds for them, in the same bytes.
Unzipped, an artifact holds:

```
index.ndjson         one line per commit that leg decided
parts/<sha>.ndjson   the record, published as runs2.d/<xx>/<sha>.ndjson
<sha>.log            the log, published as logs2.d/<xx>/<sha>.log
```

[`scripts/each-shard.sh`](/scripts/each-shard.sh) writes those files and then copies the last two onto the branch,
so the two sources cannot disagree about a verdict; they differ in reach and in latency, never in content.
Where a commit appears in more than one run, a retry or a re-run of a leg that died,
the **higher run id wins**, the same rule the store applies to its copy.

Fetch through whatever Actions access the firing has:
the GitHub tools (list the workflow's runs, list a run's artifacts, ask for an artifact's download URL, then `curl` and `unzip` it),
or `gh run download` where it works.
Unzip to disk and grep there.
A leg's artifact is mostly build output, and nothing below needs it in context:
what a firing reads is one state per commit, and the tail of the one log it is about to classify.

Artifacts keep for **14 days**, far longer than a commit normally waits between being pushed and being repaired.
Past that the leg's **job log** carries the same content inline:
`::group::<sha>` opens the commit's section, its log is printed inside, and `<sha>: <state> (<n>s, exit <rc>)` closes it.
GitHub keeps job logs far longer than artifacts.
Which shard holds which commit is the run's `each-plan` artifact (7 days), or the group markers themselves.

Two deliberate behaviours mislead a reader who skips them.
A leg **exits 0 even when commits failed**, because a red commit is a result, not a broken leg,
so a run's conclusion says nothing about any commit in it,
and asking a run for its *failed* jobs answers with the jobs that broke, which are the ones a red commit is not in.
Take the shard jobs, all of them.
And a leg that resumed skips what an earlier attempt decided (`already decided, skipping`),
so its artifact covers only what it rebuilt; the older attempt's artifact is still there, named per attempt, and still counts.

## When a run cannot be read, consult the store

That is what it is for: [`scripts/series-check.sh`](/scripts/series-check.sh),
or `git show origin/rcc2:runs2.d/<xx>/<sha>.ndjson` with `logs2.d/<xx>/<sha>.log` beside it.
Three cases reach for it:
the firing has no Actions access to `krlmlr/rigraph`,
the deciding run has aged out,
or the run is there and its results are not, a leg that died before it uploaded anything.
Nothing else in this stage changes; the bytes are the same either way.

**The store is an emergency route for a firing, and nobody keeps it warm.**
Its one writer is the leg, which publishes its own verdict seconds after deciding a commit.
That publish is not a copy kept for this stage's benefit:
CI plans and resumes from the store and from nothing else ([`scripts/rcc-decided.sh`](/scripts/rcc-decided.sh)),
and stage 3 promotes green on the store's records,
so the branch is load-bearing even in a firing that never opens it,
and a steady trickle of pushes to `rcc2` is the system working.
The gap is the leg that never published, a run cancelled whole or a push that failed,
and the sweep that filled such gaps from the commit statuses (duckdb-r's `rcc-logs.sh`) is not ported.

**Report it and move on.**
Nothing in the firing is worth blocking on it:
finish the stages that do not depend on the missing record,
say in the report which record is missing and what it was for,
and let a later firing read the result once the gap is closed by hand or by porting the sweep.

`series-check.sh` reads the store and only the store.
Its ref geometry, in flight, buffered, the retry ledger, does not depend on where verdicts come from, so run it every firing;
but where its verdict and a run disagree, the run is right, because the store is the copy.
A store that stopped being written would make the script confidently wrong,
which is a stage 7 pull request, teaching it the run route, never a repair on the series.

## A commit with no verdict

It has not been judged: wait, do not guess.
The run list says which kind of waiting it is:

- a run on the branch is queued or in progress: it is coming, and a long tail behind a large push is normal;
- a completed run planned it, but its leg deferred it at the leg deadline or could not check it out:
  the ordinary rule replans it on the next push;
- no run covers it at all: nothing was ever triggered; push, or dispatch `each-rcc` on the branch.

The store answers this one badly, which is worth the run list even on a firing whose verdicts came from the store:
an absent record can equally mean a queued run, a lost one, or a leg that never published.
The run list separates them; the store's tip cannot.

Only when none of those explains it, and the run that should have decided it finished hours ago saying nothing about it,
presume that run lost.
**12 hours** is the outer bound on being patient, not a licence to skip the question.
Only then self-heal: push `retry-main-dev` at the first commit with missing state ([`retry.md`](retry.md)).
A missing status needs nothing forced, since the commit is planned by the ordinary rule,
and `main-dev` is not touched, so no descendant is re-minted and no verified run is discarded.
Never amend a commit that has a record to get it rerun; that discards a verified result.

## Classify by what the log contains

Before diagnosing anything, check the open pull requests read during setup:
a failure an earlier firing already wrote up is one to work around, not to re-derive.

Classify by positive evidence in `<sha>.log` from the leg's artifact,
that commit's `::group::` section in the job log,
or `logs2.d/<xx>/<sha>.log` on the store; they are the same bytes.
The table in the playbook is ordered the way [`scripts/series-check.sh`](/scripts/series-check.sh) applies it to the store's copy:

- **The budget first.**
  A commit the shard's `timeout` killed (exit 124 in the record) stops mid-run with its stage output still buffered,
  which reads exactly like a cancelled leg;
  [`scripts/rcc-one.sh`](/scripts/rcc-one.sh) also bounds each stage, printing "exceeded its … budget -- presumed stuck".
  Either is a REPAIR: the commit did not finish, and a rerun buys the same kill.
- **Snapshots, tests, style, check**, in that order, because each names what to fix more precisely than the next.
- **The network**, only after those, so a real test failure that happens to mention a URL is not mistaken for a flake.
- **A failed stage in the record** is definite: the stage ran and failed on its merits, so it is a REPAIR however little the log shows.
  `install` above all, where the compile or the link stopped before any test, leaving a log that reads like a cancelled leg.
  `regen` is the gate that regenerates the R/C interface (Stimulus) and the cpp11 registration from their sources,
  and fails on any difference: a hand edit to a generated file, or a `tools/stimulus/` change committed without its output.
- **Only then the fallback**: no test phase and no failed stage is a cancelled leg or the infrastructure's, and is rerun.

Never classify by the absence of a marker: `"Job is waiting for a hosted runner"` appears in every log and means nothing.

## Fold the fix, and replay

Repair the **oldest** failure first; later reds usually inherit it.
Fold the fix into the offending commit, extending its message with what was adapted, and replay the tail.
[`scripts/series-fold.sh`](/scripts/series-fold.sh) does the folding and the replay:
it keeps the commit's author and message, adds the fix's note above the trailers,
and stops on a conflict where a later commit leaned on what the fix changed;
resolve, `git add`, and `scripts/series-fold.sh --continue`.
It leaves the result detached in the current worktree, which must be clean, and moves no ref; the push is yours.
If other failures have a demonstrably different cause, they may be fixed in the same pass;
otherwise let CI judge the tail again.

A fix the buffer needs to compile, a `patch/` entry, glue, a `tools/stimulus/` change,
is mirrored onto `main-build` in the commit for the same upstream SHA,
because the next tree regenerated there wants it too ([`3-advance.md`](3-advance.md)).

**The fix order** in the playbook is the earlier manual playbook's, unchanged in substance
([`rcc-smoke-fix.md`](/.claude/skills/rcc-smoke-fix.md)): the lowest level that resolves a failure is the one that travels best.
A `patch/` entry is retired by the vendor run itself once upstream carries its change;
a Stimulus definition regenerates the interface for every later engine;
R code is read by a reviewer of `main` at a landing;
a snapshot accepted blind is a behaviour change nobody decided;
and a test weakened is a check `main` loses.
`patch/` takes the next free number and never renumbers, and is written as the diff you would send to `igraph/igraph`.

## A test the engine cannot pass yet is gated, never deleted or rewritten

On the replay the engine is older than the one `main`'s tests may have been written against,
so a red there can be a test asking for behaviour that has not arrived yet.
Put `skip_if_engine_before("<version>", "<why>")` ([`tests/testthat/helper-skip.R`](/tests/testthat/helper-skip.R))
on a line of its own at the top of each such `test_that()` body, only where an older engine cannot pass the test.
The version is the `IGRAPH_VERSION` (in `src/vendor/igraph_version.h`) of the upstream commit that brings the behaviour back,
`X.Y.Z` or `X.Y.Z-N-g<sha>`, read the same way by the helper and by [`scripts/series-tests.sh`](/scripts/series-tests.sh).
Fold it into the offending commit like any repair.

Do not delete the file or the block, rewrite what it expects, or skip it with no version to end the skip:
each travels with its vendor commit into every landing, and a later restore made as a commit of its own does not,
because a landing replays vendor commits only.
That is how a test left one of duckdb-r's forwards at a rewind while its base restored it,
and reached the landing review (duckdb/duckdb-r#2899).
Where the series already holds the commit at that version, take the gate out there in the same pass.
A gate whose removal never comes is inert, and a landing asks for it then.

`series-check.sh` prints a `TESTS` line for a series whose vendor commit stopped a test `main` runs, or left an expired gate.
That is this stage's work as much as a red is: restore each in the commit that took it, gating it where that engine cannot pass it.

## A transiently broken upstream commit

**Folded into the next one, when the next one fixes it.**
Squash the adjacent pair, and only that pair.
Keep the newer commit's `vendor: … <owner>/igraph@<sha>` subject,
since the subject is machine-readable state and must name the tree it carries.
Record the folded SHA and subject in the body, marked as not passing on its own.
Keep any `R-side fix` sections from both.
The gap this leaves in the fifth component is fine: the counter orders, it does not count.
Mirror the fold in `main-build` (force-push; it carries no CI).

**A `patch/` entry only when the next commit is red too**:
the build stays red for at least one commit that has to remain, and there is no adjacent green tree to squash into.
Then re-root the fixing diff into a `patch/` entry, fold it into the breaking vendor commit with an `R-side fix` section,
and let it retire itself: every vendor run deletes a patch whose change is already in the regenerated tree,
so the commit reaching upstream's fix drops it as part of itself.

## Build and check locally before force-pushing

[`scripts/rcc-one.sh`](/scripts/rcc-one.sh) is the per-commit gate CI runs, as a script,
so the local verdict is CI's verdict, not an approximation of it.
Install the package, then run the full gate when time allows, or `EACH_GATES` set to the stages the repair touches;
`git clean -fdx -- src/` first either way.
One local pass that catches a bad repair saves a full CI cycle, and a repair that was not run locally is a guess.
The exception is a reviewed snapshot fold whose diff matches the upstream change exactly, which may go straight to CI.

## Snapshot drift

CI has already computed the corrected files and pushed them to `snapshot-<sha>-rcc-smoke-null`,
a commit on top of the failing one carrying the new `tests/testthat/_snaps/*.md`.
Fetch, **review the diff carefully**, and fold.
The diff must read as the engine change the vendor commit describes;
accepting it is accepting new behaviour as correct, so it deserves the same scrutiny as a code review.
A **deleted** snapshot file is a bad sign: a snapshot only disappears when its test stopped running, which is its own failure.
If the diff is surprising in any way, do not fold blind:
build locally, run the tests, `testthat::snapshot_accept()`, and run them again.
The branches are per run; read the one for the SHA being repaired.

## A red on a flavor commit

The first commits CI judges on a fresh series are the seed's own,
because `main-green` starts below them ([`series.md`](series.md)).
A red there is the rename's: a file that still names `igraph` where the flavor needs `igraph.dev`, or the reverse.
Fix it on `main`, so the next seed is right,
in [`scripts/flavor.sh`](/scripts/flavor.sh), its template or [`scripts/flavor-package-name.R`](/scripts/flavor-package-name.R),
and fold the same change into the flavor commit on `main-dev`.
Keep the two flavor subjects as `flavor.sh` wrote them: [`scripts/series-rc.sh`](/scripts/series-rc.sh) finds the flavor diff by them.

## Read what the series already learned

Every adaptation sits in an `R-side fix` section of the commit it was folded into, and

```sh
git log --grep='R-side fix' upstream/main..origin/main-dev
```

lists them.
igraph moves the same call site repeatedly, and only the last version of that glue survives the range,
so a fix matched on the failure in front of you alone may be an intermediate one, already superseded further down.
