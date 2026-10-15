# Stage 2: repair the oldest `<S>-dev` failure

*Reference for stage 2 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

Every commit in `<S>-green..<S>-dev` was decided by an `each-rcc` leg,
and **the leg's own run is where its result is read**.
That range is the loop's whole world:
nothing at or before `<S>-green` is ever re-examined.

## Read the results from the runs that produced them

List the `each-rcc` runs on `<S>-dev` and on `retry-<S>-dev`,
newest first, back to when `<S>-green` last moved,
and take each run's `each-logs-<shard>-<attempt>` artifacts —
one per leg, holding, for the commits that leg decided,
exactly what the `rcc2` store holds for them, in the same bytes.
Unzipped:

```
index.ndjson         one line per commit that leg decided
parts/<sha>.ndjson   the record, published as runs2.d/<xx>/<sha>.ndjson
<sha>.log            the log, published as logs2.d/<xx>/<sha>.log
```

`each-shard.sh` writes those files and then *copies* the last two onto the
branch, so the two sources cannot disagree about a verdict —
they differ in reach and in latency, never in content.
Where a commit appears in more than one run —
a retry, a re-run of a leg that died —
the **higher run id wins**, the same rule the store applies to its copy
([`store/`](/handbook/operations/ci/per-commit/store/README.md)).

Fetch through whatever Actions access the firing has:
the GitHub tools (list the workflow's runs, list a run's artifacts,
ask for an artifact's download URL, then `curl` and `unzip` it),
or `gh run download` where a `gh` exists.
Unzip to disk and grep there.
A leg's artifact is tens of megabytes of build output,
and nothing below needs any of it in context:
what a firing reads is one state per commit,
and the tail of the one log it is about to classify.

Artifacts keep for **14 days**, far longer than a commit normally waits
between being pushed and being repaired.
Past that the leg's **job log** carries the same content
inline — `::group::<sha>` opens the commit's section,
its log is printed inside, and `<sha>: <state> (<n>s, exit <rc>)` closes it —
and GitHub keeps job logs far longer than the artifact.
Which shard holds which commit is the run's `each-plan` artifact (7 days),
or the group markers themselves.

Two deliberate behaviours mislead a reader who skips them.
A leg **exits 0 even when commits failed** —
a red commit is a result, not a broken leg —
so a run's `conclusion` says nothing about any commit in it,
and asking that run only for its *failed* jobs answers with the jobs that
broke, which are the ones a red commit is not in.
Take the shard jobs, all of them.
And a leg that resumed skips what a previous attempt decided
(`already decided, skipping`), so its artifact covers only what it rebuilt;
the older attempt's artifact is still there, named per attempt, and still counts.

## When a run cannot be read, consult the store

That is what it is for:
`scripts/series-check.sh`, or `git show origin/rcc2:runs2.d/<xx>/<sha>.ndjson`
with `logs2.d/<xx>/<sha>.log` beside it.
Three cases reach for it —
the firing has no Actions access to the repository the runs live in,
the deciding run has aged out,
or the run is there and its results are not
(a leg that died before it uploaded anything).
Nothing else in this stage changes; the bytes are the same either way.

**The store is an emergency route *for a firing*, and it is not kept warm.**
One writer is still automatic, and it covers almost all of it:
a leg publishes its own verdict seconds after deciding a commit.
That publish is not a copy kept for this stage's benefit:
CI plans and resumes from the store and from nothing else
(`scripts/rcc-decided.sh`),
so the branch is load-bearing even in a cycle where no firing opens it,
and a steady trickle of pushes to `rcc2` is the system working
rather than a retired branch still ticking.
Everything else has been retired in the loop's direction of travel —
the per-run fan-in, which reconciled onto the branch
whatever a leg could not publish,
and the periodic sweep, `rcc-logs.yaml` ticking every 30 minutes.
Both were copying what a firing now reads at the source.
So the gap left for the sweep is the leg that never published:
a run cancelled whole, or a push that failed.

That gap is an operator's to close, not a firing's.
`rcc-logs.yaml` went with the rest of the `rcc2` workflows (duckdb/duckdb-r#2815),
so the sweep is now [`scripts/rcc-logs.sh`](/scripts/rcc-logs.sh) run by hand,
from a checkout holding the `-dev` refs and staged onto the branch with
[`scripts/rcc-publish.sh`](/scripts/rcc-publish.sh),
the way consolidation already runs.
No firing can ask for it, whatever its Actions access,
so a firing that needs the copy complete is reading one nobody is refreshing —
which is worth saying plainly in the report rather than working around.

**Report it and move on.** Nothing in the firing is worth blocking on it:
finish the stages that do not depend on the missing record,
say in the report which record is missing and what it was for,
and let a later firing read the result once an operator has swept.
A record still absent after a sweep that completed
is a real absence and not a stale copy —
which is the one question the old schedule could never answer.

`series-check.sh` reads the store and only the store.
Its ref geometry — in flight, buffered, the retry ledger, a ready cutover —
does not depend on where verdicts come from, so run it every firing;
but where its verdict and a run disagree, the run is right,
because the store is the copy.
A store that stopped being written would make the script confidently wrong,
which is a stage 7 PR — teach it the run route — never a repair on the series.

## A commit with no verdict

It has not been judged: wait, do not guess.
The run list says which kind of waiting it is:

* a run on the branch is queued or in progress — it is coming;
  throughput is roughly 35–40 commits per hour,
  so a long tail behind a large push is normal;
* a completed run planned it but its leg deferred it at the leg deadline,
  or could not check it out — the ordinary rule replans it on the next push;
* no run covers it at all — nothing was ever triggered;
  push, or dispatch `each-rcc` on the branch.

The store answers this one badly, which is worth the run list even on a firing
whose verdicts came from the store:
an absent record can equally mean a queued run, a lost one,
or a sweep that was never run —
and with no sweep on a schedule the last of those is the common case,
not the rare one. The run list separates them; the store's tip cannot.

Only when none of those explains it,
and the run that should have decided it finished hours ago saying nothing
about it, presume that run lost.
**12 hours** is the outer bound on being patient, not a licence to skip the
question. Only then self-heal:
push `retry-<S>-dev` at the first commit with missing state
([`retry.md`](retry.md)).
A missing status needs nothing forced —
the commit is planned by the ordinary rule —
and `<S>-dev` is not touched at all,
so no descendant is re-minted and no verified run is discarded.
Never amend a commit that has a record;
that discards a verified result —
and a rerun no longer needs the amend.

Before diagnosing anything twice,
check the open PRs read during setup:
a failure an earlier firing already wrote up
is one to work around, not to re-derive.

Classify each `failure` by what the commit's log **contains** —
`<sha>.log` in the leg's artifact, that commit's `::group::` section in the
leg's job log, or `logs2.d/<xx>/<sha>.log` on the store, whichever the firing
is reading; they are the same bytes:

| evidence | meaning | action |
|---|---|---|
| `Updating snapshots: '…'` | engine output drifted, or a flavor-dependent snapshot | fold the corrected files from `snapshot-<sha>-rcc-smoke-null` |
| `Error ('test-….R:N:M')` | real test failure | fix test/R code at origin |
| the cause is in `src/duckdb/` itself and the next upstream commit fixes it | upstream was transiently broken | fold the pair into one; if the next one is red too, forward-port (below) |
| `Changes detected in workflow_dispatch build` | style / roxygen drift | fix formatting at origin |
| `Error: R CMD check found WARNINGs` / `ERRORs`, with the `❯ checking …` headers above it naming which checks | `R CMD check --as-cran` is unhappy about the tree, or about the environment CI built it in | read the named checks; fix at origin, or on `main` when the cause is the job's own setup |
| a gate reached out and was refused — `cannot open URL`, `SSL connect error`, a refused or reset connection — while the tests themselves passed | infra, not the tree | rerun the commit: `retry-<S>-dev` (below) |
| the leg's record names a failed stage (`"failed_stages":["install"]`) and no rule above matched | the stage failed on its merits — most often an `install` that a glue call site this series' engine no longer offers stopped | fix the glue at origin; never a rerun |
| none of the above, no test phase, and no failed stage in the record | cancelled or infra | rerun the commit: `retry-<S>-dev` (below) |

Never classify by absence of a marker:
`"Job is waiting for a hosted runner"` appears in every log
and means nothing.

Repair the **oldest** failure first — later reds usually inherit it.
Fold the fix into the offending commit
(extend its message with what was adapted: tests, R code, patches),
replay the tail, force-push `<S>-dev`.
Write the fix as a commit on the offending commit and let
[`scripts/series-fold.sh`](/scripts/series-fold.sh) do the folding and the replay:
it keeps the commit's author and message, adds the fix's note above the trailers,
and stops on a conflict where a later commit leaned on what the fix changed.
If other failures have a demonstrably different cause,
they may be fixed in the same pass;
otherwise let CI re-judge the tail.

**A test the engine cannot pass yet is gated, never deleted or rewritten.**
At a rewind the engine is older than the one `main`'s tests were written against,
so a red there can be a test asking for behaviour that has not arrived yet.
Put `skip_if_engine_before("<version>", "<why>")` on a line of its own at the top of each such `test_that()` body.
The version is the engine (`R/version.R`) of the upstream commit that brings the behaviour back.
Fold it into the offending commit like any repair.
Do not delete the file or the block, rewrite what it expects, or skip it with no version to end the skip:
each travels with its vendor commit into every forward and landing, and a later restore does not
([`series-loop/`](/handbook/operations/vendoring/series-loop/README.md)).
Where the series already holds the commit at that version, take the gate out there in the same pass,
as a glue rewind is paired with its restore ([`series-forward`](/.claude/skills/series-forward/SKILL.md)).
A gate whose removal never comes is inert, and a landing asks for it then.
`series-check.sh` prints a `TESTS` line for a series whose vendor commit stopped a test `main` runs.
That is this stage's work as much as a red is: restore each in the commit that took it, gating it where that engine cannot pass it.

**A transiently broken upstream commit is folded into the next one,
when the next one fixes it.**
Squash the adjacent pair, and only that pair.
Keep the newer commit's `vendor: … duckdb/duckdb@<sha>` subject —
the subject is machine-readable state and must name the tree it carries —
and record the folded SHA and subject in the body,
marked as not passing on its own.
Keep any `R-side fix` sections from both.
The gap this leaves in the fifth component is fine:
the counter orders, it does not count.
Mirror the fold in `<S>-build` (force-push; it carries no CI).

**Forward-port only when the next commit is red too** —
the build stays red for at least one commit that has to remain,
and there is no adjacent green tree to squash into.
Then re-root the fixing diff into `patch/00NN-*.patch`,
fold that into the breaking vendor commit
with an `R-side fix` section,
and let it retire itself:
every vendor run deletes a patch that no longer applies,
so the commit reaching upstream's fix drops it as part of itself.

Both treatments, and how to choose, are spelt out in
[`handbook/operations/vendoring/troubleshooting/`](/handbook/operations/vendoring/troubleshooting/).

Before force-pushing a repair,
**build and check it locally** at the repaired commit
with `scripts/rcc-one.sh` —
the per-commit gate extracted from CI's `rcc-smoke`,
so the local verdict is CI's verdict, not an approximation of it.
Run the full gate when time allows,
or the stages the repair touches when it does not;
`git clean -fdx -- src/` first either way.
A CI round trip costs ~35 minutes plus queue;
a local pass costs ~10.
One local pass that catches a bad repair saves a full cycle,
and a repair that was not run locally is a guess.
The exception is a reviewed snapshot fold
whose diff matches the upstream change exactly —
that class has been verified end to end
and may go straight to CI.

**On a forward series, mine the base series before deriving anything.**
The base `<S>-dev` (for `<S>-fwd`) once verified the same upstream commits:
find the equivalent commit by its vendored `duckdb/duckdb@<sha>` subject,
and the amendments folded there —
tests, R code, patches;
the delta between that `-dev` commit and its `-build` equivalent —
are proven fixes.
Carrying them over beats rederiving them,
and their commit-message trailers say what they were for.

**A forward replayed from the base `-dev` already carries them**
([`series-forward`](/.claude/skills/series-forward/SKILL.md)),
up to the commit the base had reached when the forward was built,
so a red there is new: `main`'s delta meeting the series,
or a fix of the base's that was wrong and travelled.
Above that commit the buffer came from `-build`, and stage 5 carries the test-side half by itself
(duckdb/duckdb-r#2594),
so what reaches this stage is what it could not:
a carry that conflicted and was resolved by hand,
and the compile-side half it deliberately leaves alone.
A commit that already carries a `Carried from` trailer
has the base series' fix in it,
so a red on that commit is something else —
check the trailer before mining anything.
`scripts/series-learned.sh <S>` prints what the base `-dev` learned beyond its buffer, commit by commit,
and is the read that answers whether a fix is there to mine at all.

**Read the whole set before carrying any one of it across.**
`scripts/series-glue.sh <S>` prints every glue adaptation the series holds,
oldest first, with the upstream SHA each answered
and the `R-side fix` prose each left behind,
and closes with the files ranked by how often they were adapted.
One lookup answers a narrower question than the situation asks:
upstream moves the same call site repeatedly,
each move is a separate commit here,
and only the last version of that glue survives the range.
Match on the failure in front of you alone
and the fix carried over is an intermediate one —
already superseded, further down the very range it was read from.
The ranked file list is the cheapest read of where that is about to happen.
Mining is what *forwarding* costs, and only forwarding:
a forward series rebased onto a newer mainline
(`series-rebase/SKILL.md`) leaves nothing to mine,
because its repairs are still commits on `-fwd-dev`.
CI still judges the result like any other repair.

For snapshot drift,
CI has already computed the corrected files
and pushed them to `snapshot-<sha>-rcc-smoke-null` —
a commit on top of the failing one
carrying the new `tests/testthat/_snaps/*.md`.
Fetch, **review the diff carefully**, and fold.
The diff must read as the engine change the vendor commit describes;
accepting it is accepting new behaviour as correct,
so it deserves the same scrutiny as a code review.
A **deleted** snapshot file is a bad sign —
a snapshot only disappears when its test stopped running,
which is its own failure.
If the diff is surprising in any way, do not fold blind:
build locally and run the checks —
`scripts/snapshot-accept.sh <commit> <name>…`
does build → test → accept → re-test
and leaves the corrected files in the working tree.
CI's files were once verified byte-identical
to a local build-and-accept,
so the shortcut is sound for diffs
that look exactly like the upstream change —
the review is what earns it.
The branches are per-run;
read the one for the sha being repaired.
