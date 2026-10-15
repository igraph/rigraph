# Stage 3: advance the frontier, and read what r-universe made of the last one

*Reference for stage 3 of [`series-loop`](../SKILL.md), read when the stage has work;
the handbook leaf is [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md).*

Fast-forward `<S>-green` to the newest `<S>-dev` commit
such that every commit in `<S>-green..<that commit>` has a `success` run.
The range bounds the walk:
everything at or before `<S>-green` is trusted
(verified by this loop, or the base the seed sits on, on day one)
and is never re-examined.
`-green` is fast-forward only —
if it cannot fast-forward, something rewrote verified history;
stop and say so.

**Then mirror it into the canonical repository, every series' green, the forward's too.**
r-universe publishes the base flavors from `duckdb/duckdb-r` and reads ownership
from the URL of the branch it builds, so `<S>-green` is the one branch that
travels out of the fork — no buffer and no `-dev`.
`<S>-fwd-green` travels as well, though the fork's own universe is what builds it:
the cutover archives the replaced copy of `<S>-green` against it there, and deletes it afterwards
([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).
`--canonical <name>` names the remote, defaulting to `upstream`, and the push is
a plain one, so git refuses anything that is not a forward.
**Scream on a refusal, never force it.** Two repositories disagreeing about
verified history is a finding; the only thing that legitimately moves green off
its lineage is a cutover, and that does the mirror itself (stage 6).

Set `<S>-build-base` to the `<S>-build` commit
with the same vendored upstream SHA
(day one: the seed tip, before any vendor commit is consumed),
force-pushing where the match is not a fast-forward.

**`-build-base` lands on vendor commits only, so it lags.**
The match is by vendored SHA,
and a `-build` commit that vendors nothing carries none —
the `patch/` entries stage 3 commits onto the buffer, in particular.
So a buffer ending in such commits leaves `-build-base` below them
even when green already has their content,
and the *buffered* badge (`-build-base..-build`) overstates by that much:
9 rather than 6 on `main`, 2026-08-04.
It is display-only and self-correcting —
the next verified vendor commit moves the ref past the whole run —
so nudging it onto the newest `-build` commit green demonstrably contains
is a legitimate manual move, not a repair.

**`-build-base` is the one ref of the four that is not fast-forward only.**
It is a marker, not a promise:
nothing consumes it, the match is recomputed from scratch every stage 3,
and where the ref sits today tells the next firing nothing
it does not re-derive.
So the stage **sets** it rather than advancing it,
force-pushing when the match is not a fast-forward,
and the cost of being wrong is one display column
until the next stage 3 recomputes it.
The other three carry their guarantees unchanged:
`-green` fast-forwards only,
`-build` and `-dev` are rewritten only by this loop,
by the rules of the playbook.

A ref found off the buffer's line is therefore not a puzzle to solve.
It happened once, on `v1.4-andium`, 2026-08-06:
an auto-update commit landed on `-build` and on `-build-base`
31 seconds apart and left the two siblings,
which the stage then refused as a rewind of verified history.
Set the ref and move on;
diagnosing what wrote it is worth doing only if it recurs.

Do not teach the match to guess:
a patch-id scan finds only the commits
whose content reached `-dev` unsplit,
which on `main` that day was one of three.

## What r-universe made of it

`<S>-green` is a ref with a consumer,
and that consumer builds it on platforms this loop never sees.
The `rcc` gate is Linux on one R version;
r-universe builds Windows on x86_64 and arm64,
macOS on x86_64 and arm64, and wasm,
against R-devel, release and oldrel,
and runs `R CMD check` on each.
So a series can be green at every commit
and still publish a package that does not compile —
and no `each-rcc` run, on any platform it covers, would ever say so.
This is the read that closes that gap:

```sh
scripts/r-universe-check.sh            # every package, per target, reds only
scripts/r-universe-check.sh --log <id> # the log behind one of them
```

It prints, per package, the version and the commit built —
naming the local ref when this clone knows it,
which is how a red is attributed to a series —
then one line per target that is not OK, with the log URL.
Four access facts it exists to encapsulate, each paid for once:
the greens are published in **more than one universe** —
`duckdb.r-universe.dev` builds the base series' greens
and `krlmlr.r-universe.dev` the forward ones —
so a read of one of them answers for half the series
and reports all-OK over a failing `-fwd-green`;
the `/builds` dashboard answers 403 to some fetchers
while `https://<universe>.r-universe.dev` answers a plain curl;
the build logs live in the GitHub repository `r-universe/<universe>`,
which this project cannot be granted,
but `/api/actions/logs/<job-id>` serves them complete and anonymously;
and `/api/packages` alone **cannot** answer the question,
because its `_binaries` array is one row per artifact —
a target whose build failed outright leaves no row,
and the row from the last version that did build stays,
wearing that older version.
Read as current state it reports success
for a target that has been failing for a fortnight.
The script reads the version-scoped check table for verdicts
and `_binaries` only to say how stale the published binary has become.

Results always describe the **previous** green:
a universe build takes about an hour and starts when the ref moves,
so a firing reads the consequence of an earlier firing's push.
That is why this is a read and never a gate —
nothing here holds stage 3's fast-forward.
The mainline `duckdb` package is built from `duckdb/duckdb-r`, not a series:
a red there is upstream's, and reaches this repository as a PR to `main`.

**A platform DuckDB publishes no extensions for is not a finding.**
The extension install test downloads,
so wherever the repository has no build for this platform
it fails with an HTTP 404 —
about DuckDB's release coverage, not about the commit green points at,
and not something this repository can move.
Which platforms are covered is DuckDB's list and it changes,
so check the current one before spending a diagnosis:
`handbook/usage/extensions/README.md` links it,
and holds whatever the standing gap is.
As of 2026-08 that is `windows-devel-arm64` and `windows-release-arm64`
on every package (duckdb/duckdb-r#2425) —
read past those two and judge the rest of the table.
Only what the list explains:
every other red is a finding until shown otherwise.

**Never undo a push to green.**
A red here is a red on a commit the gate called green,
and the reflex — rewind `-green` to before it — is wrong twice over:
`-green` moves forward only (the playbook's invariants),
and the ref serves a package,
so rewinding publishes an older one
and throws away every verified commit above it
to escape a failure on a platform the gate never covered.
Green stays. The finding travels forward.

**State the finding in the commit message on `-dev`.**
An r-universe failure has no per-commit record anywhere —
not in an `each-rcc` run, not in the store — and no commit of its own;
it lives in a job log that ages out,
in a universe that rebuilds over it.
So write it where the series keeps its memory:
the message of the `-dev` commit that carries the fix,
in an `R-side fix` section like any other adaptation,
naming the target, the verdict and what the log said.
`scripts/series-glue.sh` and the mining step of stage 2 read those messages,
so a forward picks the finding up
instead of rediscovering it from a build that has long since scrolled off.
When there is no fix to carry — an hour budget r-universe overran,
an extension repository with nothing published for a platform —
write it anyway, on the next `-dev` commit the stage produces:
a finding with no repair is still the thing
that stops the next firing diagnosing it from scratch.
That commit is minted and pushed by stage 5,
so hand the text to the run that mints it
rather than amending after the fact:

```sh
scripts/series-advance.sh <S> --dev-note <file>
```

The note is appended to the newest commit of the chunk before the push.
Writing it afterwards costs an amend, a force-push,
and one `each-rcc` run spent on a commit about to be re-minted.

**An empty buffer mints no vendor commit, and the port stage takes the note
instead.**
A firing that finds every buffer level with upstream consumes nothing,
so stage 5 has no chunk and refuses the note outright —
while stage 4 still mints the ports and the tooling sync,
which are then the only `-dev` commits the firing produces.
`scripts/series-port.sh` takes `--dev-note <file>`
with the same meaning and the same one-commit target:

```sh
scripts/series-port.sh <S> --apply --dev-note <file>
```

Which of the two carries it is whichever one mints;
the finding goes on the newest `-dev` commit of the firing either way,
and neither stage is worth an amend after its own push.

**What a fix may be is the handbook's rule, not this skill's.**
A compiler-warning fix is bound by
[`architecture/glue/conventions/`](/handbook/architecture/glue/conventions/README.md),
which owns the tree's position on suppression;
read it before writing one.
The shapes listed below are shapes, never permission.

**A `patch/` entry is a prototype of an upstream change**,
filed as a pull request and retired when upstream takes it
([`operations/vendoring/pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).
So write it as the diff you would send to `duckdb/duckdb`,
and keep the vendored code free of commentary about us:
the reasoning goes in the commit message,
which the patch header carries upstream with it.

**A fix must cost Linux nothing.**
The only gate that will judge it is Linux on one R version,
so a change that helps Windows or macOS is unverifiable where it runs,
and a change that *hurts* Linux is the one outcome that gate does catch —
late, after a replay of everything above it.
Prefer changes that are inert where the gate can see them:
a `patch/` entry whose whole diff sits inside `#if defined(_WIN32)`,
a test skip keyed on a runtime value the engine itself reports,
a cast or an initialization that states an intent the code already has.
Anything broader waits for evidence,
and a local reproduction is evidence:
the compiler a warning names is usually installed here.
Reproduce it, fix it, confirm the diagnostic is gone,
then compile the same translation unit under `g++ -Wall`
and confirm the output is unchanged —
which is what costs-Linux-nothing means as a check
rather than as a claim.
A fix carrying both halves does not wait for r-universe;
the next universe build confirms it in passing.

**Say which flags a reproduction needed.**
The gate compiles with `R CMD config CXXFLAGS`, which is `-g -O2`,
so a `-Wall` diagnostic is invisible to it
and to any local build that does not add the flag by hand.
Adding it is how another platform's warning is reproduced;
recording it is what stops the result reading as the gate's view.

**A fix belongs where its code lives, which is not always `main`.**
A fix that is not series-specific belongs on `main`,
where stage 4 spreads it to every series by itself —
but a `patch/` entry is only portable when the tree it patches is.
`main` carries the engine `main` has vendored,
and a series buffer runs ahead of it,
so a patch written against the newer engine
applies in neither direction on `main`'s tree —
`vendor-one.sh`'s `PATCH BROKEN` exit.
Landing it there breaks the next vendor run
instead of helping any series.
Check that the code exists on `main` before routing a fix through it;
where it does not, the fix is series-specific by engine version,
belongs on `<S>-dev` and `<S>-build`,
and reaches `main` when `main`'s engine reaches the code.

**A `patch/` entry has to reach the buffer too.**
Stage 4 ports `main` onto `<S>-dev` and stops there;
`<S>-build` carries no ports by design (stage 1).
But `vendor-one.sh` applies the **buffer's** `patch/*.patch`
to each tree it regenerates,
so a patch that only ever landed on `-dev`
is absent the next time the buffer vendors,
and the commit that reaches `-dev` from it
arrives broken again on exactly the platform the patch was for.
Commit it onto `<S>-build` as well, in the same firing.

**The entry a firing did not write is carried by stage 4, not by hand.**
Stage 4's port brings whole `main` commits onto `-dev`,
`patch/` files included,
so an entry born as a pull request against `main`
reaches every `-dev` without any firing deciding to put it there —
and used to reach no buffer at all.
`scripts/series-port.sh --apply` now closes that as part of porting,
through `scripts/series-patch-sync.sh <S>`,
which is a read-only report on its own.
The drift it exists to prevent is quiet
while upstream leaves the patched file alone,
because the buffer is then internally consistent
and its commits carry no delta for that file;
it bites the first time upstream touches it,
and the fix is reverted on `-dev`
by a commit that looks like an ordinary vendor.

**The carry decides by test-applying, never by the file list.**
A buffer runs ahead of `main`,
so an entry `main` needs may not fit the engine the buffer has vendored,
and committing it there regardless breaks the next vendor run
(`vendor-one.sh`'s `PATCH BROKEN` exit) rather than helping anything.
Three answers, three situations:
*carry* applies cleanly and is taken with its effect on the tree;
*satisfied* reverse-applies, so only the entry is taken,
to keep the two stacks named alike;
*stale* is neither — upstream moved the code out from under it,
and it reaches the buffer if and when the code it answers does.
Two shapes are reported and never carried, because both are judgement.
A candidate whose files an entry the buffer has and `-dev` lacks
also touches is a **supersession**,
and applying both is how the next vendor run breaks.
An entry both stacks carry in different versions is **edited**:
`main` changed it in place and the port brought the new version to `-dev`,
while the buffer's tree still carries the old version's effect.
Test-applying the new one against that tree answers for neither version,
and it would read as *stale*;
trading one for the other is a reverse and an apply,
and whether the new version fits the buffer's engine is a stage 3 question.
`0009-Remove-stderr-for-zstd` is the standing example.

`scripts/series-check.sh` still prints a PATCH DRIFT line per series,
naming what the two stacks differ by: an entry only `-dev` has,
one only `-build` has — a renamed entry is one of each —
and one both have in different versions.
It is the backstop, not the mechanism:
what it reports after a port is what the carry deliberately declined,
which is a stage 3 repair like any patch this stage writes.
