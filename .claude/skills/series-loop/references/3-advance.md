# Stage 3: advance the frontier, and read what r-universe made of the last one

*Reference for stage 3 of [`series-loop`](../SKILL.md), read when the stage has work.*

[`scripts/series-advance.sh`](/scripts/series-advance.sh) fast-forwards `main-green`
to the newest `main-dev` commit such that every commit in `main-green..<that commit>` has a `success` record.
It reads the records from the `rcc2` store, not from the runs,
so a verdict a leg decided and never published holds green where it stands; the report says which commit is waiting.
The range bounds the walk:
everything at or before `main-green` is trusted, verified by this loop or accepted as the seed's base on day one,
and is never re-examined.
`-green` is fast-forward only: if it cannot fast-forward, something rewrote verified history, and the script stops and says so.

A red in flight does not hold the verified prefix below it.
Every commit under the red one was decided by a run of its own, and a repair replays only the tail above it,
so green and `-build-base` are set first, and the run then stops before stage 5 extends `-dev` onto a tip a repair is about to re-mint.

## Mirror green into the canonical repository

r-universe publishes `igraph.dev` from `igraph/rigraph` and reads ownership from the URL of the branch it builds,
so `main-green` is the one series branch that travels out of the fork: no buffer and no `-dev`.
`--canonical <name>` names the remote, defaulting to `upstream`; `SERIES_CANONICAL=''` turns the mirror off, and leaving it unset does not.
The push runs on every run, whether or not green moved, because the two copies can disagree for reasons this firing had no part in,
and an already-equal push is the cheapest way to keep asking.
It is a plain push, so git refuses anything that is not a fast-forward.
**Scream on a refusal, never force it.**
Two repositories disagreeing about verified history is a finding, and nothing in rigraph legitimately moves green off its lineage.
A missing canonical remote is fatal only on a run that promoted something, because then a verified commit is stranded in the fork.

## Set `main-build-base`

`main-build-base` is set to the `main-build` commit with the same vendored upstream SHA as the new green,
force-pushing where the match is not a fast-forward.
It is the one ref of the four that is not fast-forward only:
a marker, not a promise, which nothing consumes and every stage 3 recomputes from scratch,
so where it sits today tells the next firing nothing it does not re-derive,
and the cost of being wrong is one display column until the next stage 3.
The other three carry their guarantees unchanged.

**It lands on vendor commits only, so it lags.**
The match is by vendored SHA, and a `-build` commit that vendors nothing carries none:
a buffer tooling sync, a `patch/` entry picked from the strand.
So a buffer ending in such commits leaves `-build-base` below them even when green already has their content.
Until the first vendor commit is verified, green vendors what `main` vendors,
and the newest `main-build` commit naming that SHA is `main`'s own vendor commit, below the seed:
the marker sits there until a vendor commit of the series is green.
It is display-only and self-correcting, and nudging it by hand is a legitimate move, not a repair.
A ref found off the buffer's line is set and moved on from; diagnosing what wrote it is worth doing only if it recurs.
Do not teach the match to guess: a patch-id scan finds only the commits whose content reached `-dev` unsplit.

## What r-universe made of it

`main-green` is a ref with a consumer, and that consumer builds it on platforms this loop never sees.
The `rcc` gate is Linux on one R version;
r-universe builds Windows and macOS on x86_64 and arm64, and wasm, against R-devel, release and oldrel, and runs `R CMD check` on each.
So a series can be green at every commit and still publish a package that does not compile,
and no `each-rcc` run would ever say so.
[`scripts/r-universe-check.sh`](/scripts/r-universe-check.sh) is the read that closes that gap.
It prints, per package, the version and the commit built, naming the local ref when this clone knows it,
then one line per target that is not OK, with the log URL.
Four access facts it exists to encapsulate, each paid for once in duckdb-r:

- the packages of a repository may be published in more than one universe,
  so it reads `igraph.r-universe.dev` and `krlmlr.r-universe.dev` by default, filtered to packages built from a `rigraph` repository;
- the `/builds` dashboard answers 403 to some fetchers, while `https://<universe>.r-universe.dev` answers a plain curl;
- the build logs live in the GitHub repository `r-universe/<universe>`, which this project cannot be granted,
  but `/api/actions/logs/<job-id>` serves them complete and anonymously (`--log`);
- `/api/packages` alone cannot answer the question, because its `_binaries` array is one row per artifact:
  a target whose build failed outright leaves no row, and the row from the last version that did build stays, wearing that older version.

Results always describe the **previous** green:
a universe build starts when the ref moves and takes about an hour, so a firing reads the consequence of an earlier firing's push.
That is why this is a read and never a gate.
`igraph` in the same universe is built from `igraph/rigraph`'s `main`, not from the series:
a red there is `main`'s, and reaches `main` as a pull request.

**Never undo a push to green.**
A red here is a red on a commit the gate called green, and the reflex, rewinding `-green` to before it, is wrong twice over:
`-green` moves forward only, and the ref serves a package,
so rewinding publishes an older one and throws away every verified commit above it
to escape a failure on a platform the gate never covered.
Green stays. The finding travels forward.

**State the finding in the commit message on `-dev`.**
An r-universe failure has no per-commit record anywhere and no commit of its own;
it lives in a job log that ages out, in a universe that rebuilds over it.
So write it where the series keeps its memory:
the message of the `-dev` commit that carries the fix, in an `R-side fix` section like any other adaptation,
naming the target, the verdict and what the log said.
When there is no fix to carry, write it anyway, on the next `-dev` commit the firing mints:
a finding with no repair still stops the next firing diagnosing it from scratch.
Hand the text to the run that mints that commit rather than amending after the fact,
which costs an amend, a force-push, and an `each-rcc` run spent on a commit about to be re-minted.
`series-advance.sh --dev-note` appends it to the newest commit of the chunk before the push;
when every buffer is empty, stage 4's ports are the only `-dev` commits the firing mints,
and `series-port.sh --apply --dev-note` takes the note with the same meaning.
Each refuses a note when it mints nothing, and each adds an `R-side fix` header when the note does not open with one.

## What a fix may be

**A `patch/` entry is a prototype of an upstream change**,
filed as a pull request against `igraph/igraph` and retired when upstream takes it.
So write it as the diff you would send there, and keep the vendored code free of commentary about us:
the reasoning goes in the commit message, which the patch header carries upstream with it.

**A fix must cost Linux nothing.**
The only gate that will judge it is Linux on one R version,
so a change that helps Windows or macOS is unverifiable where it runs,
and a change that *hurts* Linux is the one outcome that gate does catch, late, after a replay of everything above it.
Prefer changes that are inert where the gate can see them:
a `patch/` entry whose whole diff sits inside `#ifdef _WIN32`,
a test skip keyed on a runtime value the engine itself reports,
a cast or an initialization that states an intent the code already has.
Anything broader waits for evidence, and a local reproduction is evidence:
reproduce the diagnostic, fix it, confirm it is gone,
then compile the same translation unit under `-Wall` and confirm the output is unchanged.

**Say which flags a reproduction needed.**
The gate compiles with `R CMD config CFLAGS`, which shows no `-Wall` diagnostic,
so recording the flag is what stops the result reading as the gate's view.

**A fix belongs where its code lives, which is not always `main`.**
A fix that is not series-specific belongs on `main`, where stage 4 spreads it,
but a `patch/` entry is only portable when the tree it patches is.
`main` vendors an older engine than the buffer, so a patch written against the newer one applies in neither direction on `main`'s tree,
and lands there as `vendor-one.sh`'s `PATCH BROKEN` exit on `main`'s next vendoring.
Check that the code exists on `main` before routing a fix through it;
where it does not, the fix belongs on `main-dev` and `main-build`, and reaches `main` with a landing.

**A `patch/` entry has to reach the strand too.**
`vendor-one.sh --strand` applies the **strand's** `patch/*.patch` to every tree it regenerates, and the buffer picks from the strand,
so a patch that only ever landed on `-dev` is absent the next time the series vendors,
and the commit that reaches `-dev` from it arrives broken again.
Commit an entry the firing writes onto `main-vendor` as well, in the same firing; stage 1 picks it onto `main-build`.

## The carry of `patch/` entries

An entry born as a pull request against `main` reaches `-dev` by stage 4's port, which brings whole commits, `patch/` files included,
and reaches neither the strand nor the buffer that way, because neither takes ports.
The drift is quiet while upstream leaves the patched file alone and bites the first time upstream touches it,
when the fix is reverted on `-dev` by a commit that looks like an ordinary vendor.
`scripts/series-port.sh --apply` closes that as part of porting,
through [`scripts/series-patch-sync.sh`](/scripts/series-patch-sync.sh), which is a read-only report on its own.
It carries onto `main-vendor`, or onto `main-build` on a series with no strand yet, and stage 1's next pick takes it to the buffer.

**The carry decides by test-applying, never by the file list.**
The strand runs ahead of `main`, so an entry `main` needs may not fit the engine it has vendored.
Three answers, three situations:
*carry* applies cleanly and is taken with its effect on the tree;
*satisfied* reverse-applies, so only the entry is taken, to keep the two stacks named alike;
*stale* is neither, and it reaches the strand if and when the code it answers does.
Two shapes are reported and never carried, because both are judgement:
a **supersession**, a candidate touching the files of an entry the strand has and `-dev` lacks,
where applying both breaks the next vendor run;
and an entry both stacks carry in different versions, **edited**, which test-applying cannot judge.

`scripts/series-check.sh` prints a `PATCH DRIFT` line per series naming what the two stacks still differ by:
an entry only `-dev` has, one only `-build` has (a renamed entry is one of each), and one both have in different versions.
It is the backstop, not the mechanism, and shows a carry until stage 1 has picked it:
what it reports after a port is what the carry deliberately declined, a repair for this stage like any patch it writes.
