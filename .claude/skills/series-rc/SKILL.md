---
name: series-rc
description: Cut and keep aligned the release-candidate strand of a series, `<S>-rc-dev`, which carries the package without its flavor, commit for commit of `<S>-dev`. Use when asked to cut an rc series from a `-dev` or `-fwd-dev`, when a firing has moved `<S>-dev` of a series that has an rc strand, or when checking that an rc strand is aligned.
---

# The release-candidate strand

*Handbook: [`operations/vendoring/series-loop/`](/handbook/operations/vendoring/series-loop/README.md) —
what this routine is, and when it runs.*

A series publishes a flavored package, `duckdb.2.0.dev` for `v2.0-cyanoptera`,
so that it installs beside the released `duckdb`
([`branches/flavors/`](/handbook/branches/flavors/README.md)).
A release is built as plain `duckdb`, and a flavored green says nothing about the name that ships.
`<S>-rc-dev` is the same series without the flavor, one commit for each commit of `<S>-dev`.
`<S>` may be a base series or a forward one, so `v2.0-cyanoptera-fwd` has `v2.0-cyanoptera-fwd-rc-dev`.

**It is one ref.**
No `-rc-build`: CI never builds a buffer, and the rc strand is derived from `<S>-dev`, not vendored.
No `-rc-green` or `-rc-build-base`: nothing publishes it, so there is no frontier to hold.
With no `-rc-build` beside it, the loop's discovery of `<X>-build` and `<X>-dev` pairs never mistakes it for a series.
CI builds `<S>-rc-dev` as it builds any `-dev`,
from the rc seed up rather than from a green ([`scripts/each-plan.sh`](/scripts/each-plan.sh)),
and each rc commit gets a verdict of its own.
That is a second CI run for every commit of the series, and it is the point:
the verdict on the unflavored tree is the one a release rests on.

## Cut

```sh
scripts/series-rc.sh <S>          # report: what it would write, exit 1 when not aligned
scripts/series-rc.sh <S> --push   # write it, leased on what the remote held
```

Each rc commit is a function of one source commit:
its tree with the seed's flavor diff reversed,
its message with an `Unflavored-from:` trailer naming it,
and its author and committer, dates included.
The rc seed is the source's `chore: Add fifth version component` with the two `flavor.sh` commits under it dropped,
so it stands directly on the `main` commit the series was seeded from.
Two files are spelled back rather than reversed:
`DESCRIPTION`, whose `Package:` line is the flavor's only change there, beside a `Version:` every commit moves,
and `scripts/flavor.patch`, which the loop's tooling sync overwrites with `main`'s template.

The source needs a seed `flavor.sh` wrote: every `-fwd` series has one, and so does a series once it has been forwarded.
A series cut by [`series-open`](/.claude/skills/series-open/SKILL.md) and reflavored afterwards has no single flavor diff,
so the script refuses it; cut its rc from its forward.
A commit that edits a flavored region stops the run with the commit named,
except the two generated bindings, `src/cpp11.cpp` and `R/cpp11.R`,
which are taken from the source with the flavor's names spelled back, as `cpp11::cpp_register()` would write them.

## Keep it aligned

> An rc strand is aligned when `scripts/series-rc.sh <S>` reports it aligned.
> A firing that moves `<S>-dev` of a series with an rc strand
> realigns it with `--push` as its last write for that series.

Because every rc commit is a function of its source commit,
alignment is a fact the script recomputes rather than a history anyone keeps:
a rerun over an unchanged source mints the same SHAs and pushes nothing.
A repair that rewrites the source's tail rewrites the rc tail with it,
and CI judges the re-minted rc commits as it judges the source's.

Nothing is committed on an rc strand directly.
A fix belongs on the source strand, and reaches the rc strand by realigning;
an edit made on the rc strand is overwritten at the next realignment.
An rc commit red where its source commit is green is a finding about the flavor,
the one thing that differs,
and it is fixed on `main` in the flavor tooling or in the code the flavor touches.

The strand is derived, never vendored, repaired, ported or advanced on its own.

**An rc commit has no retry ledger.**
`retry-<S>-rc-dev` plans nothing, because the planner anchors a retry on a green and an rc strand has none
([`operations/ci/per-commit/selection/`](/handbook/operations/ci/per-commit/selection/README.md)).
An rc commit red for the infrastructure's reasons is judged again by dispatching `each-rcc` on `<S>-rc-dev`
with `force=true` and `max-commits` set to how many commits from the tip to replan, one for the tip alone;
a red of the tree's is a fix on the source strand, which realigning re-mints.

## At cutover

[`scripts/series-cutover.sh`](/scripts/series-cutover.sh) swaps the four `<S>-fwd-*` refs
and deletes `<S>-fwd-rc-dev` with them, since the strand is derived and its source is `<S>-dev` now;
it cuts nothing.
In the same session, cut `<S>-rc-dev` from the swapped-in `<S>`,
so no rc strand outlives its source.
A `<S>-fwd-rc-dev` the deletion could not remove is cutover litter, and
[`scripts/series-prune.sh`](/scripts/series-prune.sh) lists it.
