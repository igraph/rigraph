---
name: series-open
description: Open a new vendoring series for a release branch upstream has just cut — cut the parent series' strands at the fork point, reflavor them, and forward both lines onto current `main`. Use when upstream cuts a release branch and it needs a series of its own, or when asked to open, seed or bootstrap a series.
---

# Opening a new series

*Handbook: [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md) —
what this routine is, and when it runs.*

When upstream cuts a release branch, it gets a series of its own.
**The cut comes long before the release** — upstream branched `v2.0-cyanoptera`
on 2026-09-02 and `main` read `2.1.0-dev` the same week, with 2.0 still
unreleased weeks later — so the line exists, and needs serving, while no
released version names it.
That gap is why an opening is dated from the branch rather than from the
release, and why a series opened here usually takes a preview prefix
([`operations/releases/versioning/`](/handbook/operations/releases/versioning/README.md)).
What the `main` series *tracks* does not change: it keeps following upstream
`main`, which now simply contains the next line's work. Its refs do change —
see below.
This skill is the release branch's birth certificate.

**Nothing here is derived twice.** The new series is minted out of commits its
parent has already vendored and CI has already called green: below the fork point
the two lines are one history, so the opening takes that work rather than
rebuilding it. `series-cut.sh` reports how deep that goes, and leaves the commits
`<U>` has of its own to the loop.

**It leaves two lines standing on the fork point, so both are forwarded.**
The cut puts `<S>` on the fork point's R side, months behind `main`, and
everything below that point has just stopped being `<P>`'s, so `<P>` is re-rooted
there too. Neither forward is tidying afterwards — step 5 opens both, and the
re-root's saving is what makes them affordable.

**Prerequisite: `main` has no `-fwd` in flight.** A series has exactly one set of
`<S>-fwd-*` refs, and an opening needs `main`'s: opening while one is pending
means overwriting it or abandoning the cutover it was built for. Cut the pending
one over first, or wait for it —
`git ls-remote --heads <remote> 'main-fwd-*'` answers this in one line.
`<S>`'s own `-fwd` refs are free by construction, since the series did not exist
until now.

`<S>` is the new series (e.g. `v2.0-<codename>`),
`<F>` its dev flavor (e.g. `2.0.dev`),
`<U>` the upstream release branch.

## Steps

1. **Cut the parent's strands at the fork point.**

   ```bash
   scripts/series-cut.sh <S> --upstream <duckdb-clone> --check --next
   scripts/series-cut.sh <S> --upstream <duckdb-clone> --next
   ```

   Everything here is derivable, which is why it is a script: the fork point is a
   function of two upstream branches, each strand's cut a function of that fork
   point and the strand, the four refs a function of the two cuts. `--check`
   writes nothing and reports; `--next` prints the rest of this list with the
   series' own names filled in. `--parent` defaults to `main`, `--flavor` to the
   version in the series name.

   It writes `<S>-build` and `<S>-build-base` at `<P>-build`'s cut, `<S>-dev` and
   `<S>-green` at `<P>-dev`'s. Local refs only; nothing is pushed until step 4.
   No `-fwd` refs yet — a forward counterpart protects a green consumers are
   already reading, and nobody is reading this one. Step 5 creates them.

   **Why the fork point is not the merge base**, and why below it the parent has
   already vendored, glued and judged everything the new line inherits, are
   [`vendoring/model/`](/handbook/operations/vendoring/model/README.md)'s. The
   script implements that rule; opening v2.0 measured the two a week apart.

   **Do not replay onto a fresh seed instead.** `main` vendors a *released*
   engine, which sits on no branch's first-parent chain, so no range start
   satisfies the range rule and the first pick lays one line's delta over
   another's tree.

2. **Reflavor both strands, immediately.**

   ```bash
   scripts/reflavor.sh <F>        # on <S>-build, then on <S>-dev
   ```

   **The cut is not complete without this.** It takes `<P>`'s tree entire, so
   `DESCRIPTION` names `<P>`'s package and the binding exports `<P>`'s symbols —
   a series that reached r-universe in that state would publish under a name that
   is already taken. One commit per strand, above its cut, so `-green` stays where
   the evidence is and the gate carries it over the rename like any other commit.

   `-build` as well as `-dev`: the buffer is what `-dev` replays from, so a buffer
   left on the old name mints commits that carry it forward.

   `reflavor.sh` renames rather than re-patching. `flavor.sh` builds a flavor onto
   an unflavored tree and refuses one that already has it, and reversing the old
   flavor first does not work on a series — `scripts/flavor.patch` is the
   unflavored template `main` owns, and the context it would reverse against has
   moved; against the v2.0 cut it failed four hunks of nine. A rename needs no
   context. It needs `krlmlr/cpp11`, for the reason `flavor.sh` gives, and refuses
   the run when the symbols come out wrong.

3. **Stamp the new preview prefix on all four strands, in the same breath.**

   ```bash
   scripts/preview-prefix.sh --check     # <S>-build, <S>-dev, <P>-build, <P>-dev
   scripts/preview-prefix.sh
   ```

   **Both series need it, for opposite reasons.** `<P>` stops previewing the
   line its version names: upstream `main` starts declaring the *next* line the
   same week, so the version it carries is a line it no longer serves. `<S>`
   never previewed the line its version names at all — the cut handed it `<P>`'s
   tree, prefix included, and it serves a line no released version names yet.
   Neither is fixed by the other: this step named only `<P>` when v2.0 was cut,
   and `v2.0-cyanoptera`'s strands were still publishing `1.5.5.90xx` — the line
   they had never previewed — until it was stamped by hand afterwards.

   Until a strand is stamped it carries a foreign prefix, and its pair drifts
   apart with it — the state where the `DESCRIPTION` merge driver stops
   resolving them
   ([`releases/versioning/`](/handbook/operations/releases/versioning/README.md)).

   The prefix is read off the engine the strand vendors, so it takes no input
   and cannot name the wrong line: `2.1.0-dev` on `<P>` means previewing 2.1,
   which is `2.0.99.9000`; `2.0.0-dev` on `<S>` means previewing 2.0, which is
   `1.99.99.9000`. The vendor counter carries over — the chain does not restart
   — and the script refuses a version that would not rise.

   **`-green` is not stamped, and does not need to be.** It is fast-forward
   only, so the stamp reaches it the way every other commit does: the loop
   advances over it once CI has judged it. A stamp committed onto `-green`
   directly would fork it off `-dev`'s history, which is the one thing the
   frontier may never do. Run `--check` against `<S>-build` and `<S>-dev`;
   a `-green` still on the old prefix is the queue, not a miss.

   **The flavor does not change, and that is not an oversight.** `<P>`'s package
   name says which branch it tracks, not which version: `duckdb.dev` is upstream
   `main`'s rolling preview whatever line that is today, which is why every cut
   so far has given the *new* line a versioned flavor and left `duckdb.dev`
   alone. Renaming it each cycle would break `install.packages("duckdb.dev")`
   and need a fresh r-universe registration every time
   ([`branches/flavors/`](/handbook/branches/flavors/README.md)).

4. **Push all four refs, together — and `<P>`'s two stamped strands with them.**
   `git push --atomic`, as `--next` spells it.
   Step 3 moved `<P>-build` and `<P>-dev` as well, and a pair that lands split
   is a pair whose prefixes differ, which is where the merge driver gives up. The loop discovers series from
   refs and serves them in one firing, so a ref landing alone invites a firing
   into half a series — and a series pushed before step 2 is one that grows under
   the wrong name. Up to this push the opening is local branches and a deletion
   undoes it.

   **This hands the walk over.** Nobody vendors `<U>` by hand afterwards: the
   loop's stage 1 runs `vendor-one.sh --commits 100` against the buffer of every
   series it discovers, which is now this one
   ([`series-loop/SKILL.md`](/.claude/skills/series-loop/SKILL.md)). Opening v2.0 pushed four refs and the
   next firing had walked the buffer 25 commits and `-dev` 72, unasked.
   `series-cut.sh` reports how many are left to walk; that number is the loop's
   backlog, not a task.

5. **Open both forwards.** Two invocations of
   [`series-forward/SKILL.md`](/.claude/skills/series-forward/SKILL.md), neither waiting on the other:

   * **`<S>` onto current `main`.** The cut left it on the fork point's R side,
     months behind: every R-side fix `main` took after the fork is missing from
     the glue until this lands. An ordinary forward, regenerated seed and all.
     Read a red in the opening's first commits as that outstanding work rather
     than as a broken opening.
   * **`<P>` onto current `main`, grafted at the fork point.** Everything below it
     belongs to `<S>` now, so `<P>` stops carrying it: one commit with the
     fork-point commit's tree verbatim, parented on current `main`, then
     everything `<P>` has taken since replayed onto that. The tree is one the loop
     has already judged, so the base is sound by construction rather than by a
     replay that has to be checked. Opening v2.0 turned 6606 commits into 14 and
     6731 into 50, both heads byte-identical to the live branches outside
     `DESCRIPTION` — the version prefix of the line `<P>` previews next is the
     graft's only edit
     ([`releases/versioning/`](/handbook/operations/releases/versioning/README.md)).

   Both run beside their live refs as `-fwd-*` and swap in at cutover, so no green
   anyone reads is rewritten.
   The graft keeps the fork point's R side, so `<P>`'s next forward is the one that
   aligns it with `main`, and it takes the fork point from `<S>`'s forward rather
   than rederiving it: `series-forward-build.sh --graft-from <S>-fwd-build`
   ([`series-forward/SKILL.md`](/.claude/skills/series-forward/SKILL.md)).

6. **Declare `<F>`, and generate what says so.**

   ```bash
   # add the flavor to scripts/series.yaml, then
   scripts/series-table.R
   R -q -e 'rmarkdown::render("README.Rmd")'
   ```

   One entry, and both tables are written from it — the `Flavors` table in
   [`README.Rmd`](/README.Rmd) and the one in
   [`branches/flavors/`](/handbook/branches/flavors/README.md) — along with the
   mirror rules step 7 checks. The entry is the only place a new series is named
   by hand; everything else is discovered from refs or derived from it.
   See below for what the fields mean and what a badge row gets wrong.

   **The entry may already be there.** A loop firing that saw the line cut
   opens the declaration PR by itself, so this step is often merging or
   reviewing that one rather than writing the entry
   ([`series-loop/SKILL.md`](/.claude/skills/series-loop/SKILL.md), "What a firing reports").
   The loop never cuts the refs — only steps 1–5 above do.

7. **Update the fork's mirror configuration — derived, not remembered.**
   A series' *ahead* badge measures against a branch the fork mirrors, which stays
   current only while [`.github/pull.yml`](/.github/pull.yml) carries a rule for
   it. Which rules the file owes is a function of the table step 6 just moved, so
   [`scripts/pull-config.sh`](/scripts/pull-config.sh) evaluates that function and
   prints what is missing (`--check` exits non-zero). A line still releasing from
   `main` is measured against `main`, which is ruled already, so most openings add
   no rule.

   Two halves the script cannot do. **Push the branch into the fork first** — a
   rule whose base the fork lacks is skipped silently and forever. **Then carry
   the merged file to the fork's default branch**, where Pull reads it; `pull.yml`
   names the URL that triggers a sync, so it takes effect today rather than within
   six hours ([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).

   Nothing else lives outside the refs: the loop discovers every series from them,
   and reports the rule the mirror configuration is missing on the firing that sees a series change,
   as a change to `main` like any other, since the script is read-only
   ([`series-loop/SKILL.md`](/.claude/skills/series-loop/SKILL.md)).

8. **Register the new flavor with r-universe.**
   `<F>` is a package nothing in this repository creates: a universe is configured
   by `<user>/<user>.r-universe.dev`, whose `packages.json` gives each package a
   `url` and the `branch` to build — `<S>-green` for a series. Adding `<F>` is an
   entry there, so a pull request against that repository is the request, and where
   it is not yours to open, its owner is who to reach; a base series belongs in
   `duckdb.r-universe.dev`, a forward counterpart in `krlmlr.r-universe.dev`
   ([`branches/flavors/`](/handbook/branches/flavors/README.md)).
   Where the universe does not answer,
   [`r-universe-org/help`](https://github.com/r-universe-org/help) is its issue
   tracker. Open the request early — the wait is someone else's queue — but it
   cannot build until step 2's rename is pushed and the gate has carried `-green`
   over it. [`scripts/r-universe-check.sh`](/scripts/r-universe-check.sh) says it
   took. Until then the series is covered by the per-commit gate alone, which is
   Linux on one R version, and stage 3 of the loop has nothing to read back
   ([`series-loop/SKILL.md`](/.claude/skills/series-loop/SKILL.md)).

## Declaring the flavor

[`scripts/series.yaml`](/scripts/series.yaml) is the declaration.
[`README.Rmd`](/README.Rmd) builds its table from a chunk, so rendering is what
writes the root and `.github/` copies; the handbook's is a plain `.md`, so
[`scripts/series-table.R`](/scripts/series-table.R) splices it between
`<!-- flavors:begin -->` markers. Order in the file is order in the
table — CRAN, then LTS, then the `.dev` flavors newest series first. A `.dev`
entry is eight fields:

```yaml
  - flavor: duckdb.2.0.dev
    kind: dev
    upstream: v2.0-cyanoptera
    series: v2.0-cyanoptera
    releases_from: main
    publishes_from: v2.0-cyanoptera-green
    repo: duckdb/duckdb-r
    badges: [r-universe]
```

`series` is the prefix of the four refs; `publishes_from` is what r-universe
builds. `releases_from` is the one to get right, and it does two jobs: it is the
base the *ahead* badge measures from, and it is the branch the series seeds and
forward-ports from, which is why the fork mirrors it and why
`pull-config.sh` reads it rather than the badge
([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).

Two things the generator settles that a hand-copied row used to get wrong.

**Which branch *ahead* measures from.** It is `releases_from`, which for a line
still releasing from `main` *is* `main` — not `<U>`, and not the parked baseline
a retired line moves to later.

**Which repository each badge is counted in**, because that differs within one
row. shields.io compares two refs of a single repository, and the row's three
comparisons do not all live in the same one:

* ***ahead*** is counted in `duckdb/duckdb-r`. Both its refs are there — the
  release branch natively, and `<S>-green` because the loop mirrors it
  ([`branches/mirrors/`](/handbook/branches/mirrors/README.md)).
* ***in flight*** and ***buffered*** are counted in `krlmlr/duckdb-r`, the only
  repository carrying `<S>-dev` and `<S>-build`.

A badge whose base the named repository lacks renders as an error rather than a
count, and one reading a stale mirror is worse because it renders: it counts
commits that have already shipped. Step 7 settles both.

**The table must stay clear of `scripts/flavor.patch`.**
`README.Rmd` is a flavored file and the patch rewrites the installation hunks near
the top, so `git apply --check --include=README.Rmd scripts/flavor.patch` has to
still pass after regenerating. Name the `.Rmd`: `--include` matching no path exits
0, so checking the rendered `README.md` — which the patch does not touch — passes
whatever the edit did.

`README.md` and `.github/README.md` are rendered from `README.Rmd`, so run the
render after the generator. The change lands on `main` and is forward-ported like
any other R-side change; when the series later releases, it gains a stable entry
of its own.

## Later, when the line parks

A line that stops being the current one parks on its own `vX-codename` baseline,
and its `.dev` badge follows it there — the *ahead* base is the branch the series
releases from, which is no longer `main`.
That move is what earns the outgoing line a mirror and a rule, on the day it
parks rather than on the day it was opened, and `pull-config.sh` reports it as
soon as the badge base moves: step 7 arriving by itself rather than being
remembered.
The same `releases_from` freezes the line's R side: `scripts/series-port.sh`
takes only the tooling sync for a line declared parked, which matters when the
line parks because another one lands on `main`
([`series-land`](/.claude/skills/series-land/SKILL.md)).

What is left of the walk-backwards problem when `<S>` releases is
[`series-forward/SKILL.md`](/.claude/skills/series-forward/SKILL.md)'s:
a forward reads where its replay starts from the trees.
