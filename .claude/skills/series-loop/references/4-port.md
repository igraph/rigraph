# Stage 4: port from `main`

*Reference for stage 4 of [`series-loop`](../SKILL.md), read when the stage has work.*

The goal is identity, not curation:
after this stage `.github/`, `scripts/` and `.claude/` on `main-dev` are byte-identical to `main`'s.
CI reads workflows and scripts from the branch it checks, so this is what puts a tooling fix into effect;
never park a tooling change to wait for anything.

**Every ref of the series owes that identity, `main-build` included.**
A workflow fires from the branch it sits on, so a ref nobody ports runs the tooling of the day it was seeded,
and a push filter written back then decides what fires today.
The buffer takes no *ports*, since its line is upstream commits and the glue they need,
but its **tooling is synced**, and [`scripts/series-port.sh`](/scripts/series-port.sh) does it in the same run:
one commit appended to `main-build` when its tooling differs from `main`'s, `chore(series): Sync buffer tooling with main`.
In duckdb-r a buffer's stale `R-CMD-check.yaml` once matched the buffer's own name,
and stamped an `rcc` status on a commit no `each-rcc` leg had decided.

The sync commit vendors nothing, so the consumption anchor and the vendored-SHA scans look past it by subject,
and stage 5 skips it rather than replaying it onto `-dev`, whose tooling this stage has already made `main`'s.
Replaying it held only until `main` moved again:
the sync's diff runs from the buffer's older tooling, so the pick conflicted, or put back on `-dev` what `main` had removed.

## What the script picks

The script lists **every** commit `main` has that the series lacks, oldest first,
classified TOOLING / MIXED / OTHER / VENDOR / VERSION by what it touches,
and applies all but VENDOR and VERSION by default.

- A MIXED or OTHER commit is a forward-port: `-dev` has always been vendor commits plus cherry-picks of `main` commits,
  and the port merely batches them, judged by CI like every `-dev` commit.
- **Picks are whole commits, never split.**
  A whole pick matches its `main` commit by patch-id, so the next run skips it silently,
  while half of a MIXED commit would replay, at best to empty and at worst to a conflict,
  and could sever a coupled change, a script from the test that exercises it.
- **VENDOR commits are listed and never picked**: `main`'s engine is not the series' engine,
  and the series' own vendoring owns that strand.
  **The subject decides one, never the path**:
  a patch-stack rebuild or a CRAN fix lands under `src/vendor/` with no upstream SHA, and is ported like any other commit.
- **VERSION commits are listed and never picked**: `main`'s fourth component is not the series' counter.
  The content decides, not the subject:
  a commit that moves `Version:` and carries nothing but release paperwork is held back under any subject.
  A bump riding on real content is a forward-port that happens to bump, and is ported whole.
  A commit that writes `NEWS.md` for `main`'s next release and touches nothing else is held back on the same reasoning.
- A merge that brought only ancestry into `main`, its tree its first parent's, is not offered at all.

Port volume threatens nothing:
the readers of the strand, `vendored_sha()` and the base scan in `vendor-one.sh`, look *past* such commits by subject.

## The sync commit, and what to read in it

After the picks the script closes whatever tooling delta remains with one sync commit taking `main`'s tooling tree verbatim,
`chore(series): Sync tooling with main`,
so the identity goal holds even where history diverged, adaptations folded during repair or picks dropped as empty.
In steady state the residue is empty and no sync commit is created.
When one appears, read its diff: it is the residue the commit walk could not explain,
and anything it reverts that the series genuinely needs is a finding for `main`, to be made conditional there.
A series never keeps its own fork of the tooling.
One class the script names for you: a file the sync deletes that something outside the tooling paths still calls.
`main` moved it in a commit the series did not take, and the caller moved with it, out of the sync's reach,
so port that commit by name and the reference is whole again.

## What stays judgement

- **A conflict stops the sequence in place**, with the worktree kept.
  Resolve it toward `main`'s intent, keeping the flavor where the two meet:
  `Package: igraph.dev` in `DESCRIPTION`, `useDynLib(igraph.dev, …)` in `NAMESPACE`, `@useDynLib igraph.dev` in `R/igraph-package.R`.
  `cherry-pick --continue` through the rest, push, and rerun the script to finish.
  Reruns are exact: clean picks dedupe by patch-id, resolved ones by their `cherry picked from` trailer.
  A resolution that comes out empty is committed empty, never skipped, so the trailer retires the pick; the script prints how.
- **Generated files are regenerated, never merged** ([`traps.md`](traps.md)).
- **An OTHER commit that cannot work against the series' engine**:
  apply an explicit subset without it, fix it on `main` (a guard, a runtime check), and port the fixed commit instead.
  Explicit SHAs are never second-guessed.

The script's frozen-series rule, which skips the walk for a series seeded from a release line or parked on its own baseline,
does not apply to `main`, which is seeded from `main` and declares `releases_from: main` in [`scripts/series.yaml`](/scripts/series.yaml).

Ported and sync commits are ordinary `-dev` commits:
green per commit like everything else, vendoring nothing, so the consumption anchor of stage 5 does not see them.
`series-port.sh --apply` ends by carrying `patch/` entries onto the strand ([`3-advance.md`](3-advance.md)).
