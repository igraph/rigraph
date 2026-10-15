---
name: series-rc
description: Cut and keep aligned the release-candidate strand of rigraph's series, `main-rc-dev`, which carries the package as plain `igraph`, without the `igraph.dev` flavor, commit for commit of `main-dev`. Cut it only when a landing on `main` is planned, because it doubles the commits CI judges. Use when asked to cut an rc strand, when a firing has moved `main-dev` while `main-rc-dev` exists, or when checking that the rc strand is aligned.
---

# The release-candidate strand

The series publishes a flavored package, `igraph.dev` for `main`,
so that it installs beside the released `igraph` ([`series-loop`](/.claude/skills/series-loop/SKILL.md)).
`main` releases plain `igraph`, and a flavored green says nothing about the name that ships.
`main-rc-dev` is the same series without the flavor, one commit for each commit of `main-dev`,
and it is what a landing replays onto `main` ([`series-land`](/.claude/skills/series-land/SKILL.md)).

**It is one ref.**
No `-rc-build`: CI never builds a buffer, and the rc strand is derived from `main-dev`, not vendored.
No `-rc-green` or `-rc-build-base`: nothing publishes it, so there is no frontier to hold.
With no `-rc-build` beside it, the loop's discovery of `<X>-build` and `<X>-dev` pairs never mistakes it for a series.
CI builds `main-rc-dev` as it builds any `-dev`,
from the rc seed up rather than from a green ([`scripts/each-plan.sh`](/scripts/each-plan.sh)),
and each rc commit gets a verdict of its own.
That is a second CI run for every commit of the series, and it is the point:
the verdict on the unflavored tree is the one a landing rests on.

**So it is cut only when a landing is planned.**
Until then the series has no rc strand, the loop has nothing to realign,
and the CI budget goes to the series alone.
Cut it early enough before a landing that CI has judged the whole strand by the time the landing is built.

## Cut

```sh
scripts/series-rc.sh main          # report: what it would write, exit 1 when not aligned
scripts/series-rc.sh main --push   # write it, leased on what the remote held
```

Each rc commit is a function of one source commit:
its tree with the seed's flavor diff reversed,
its message with an `Unflavored-from:` trailer naming it,
and its author and committer, dates included.
The rc seed is the source's `chore: Add fifth version component` with the two `flavor.sh` commits under it dropped,
so it stands directly on the `main` commit the series was seeded from.
Two files are spelled back rather than reversed:
`DESCRIPTION`, whose `Package:` line is the flavor's only change there, beside a `Version:` every commit moves,
and the flavor template `flavor.sh` rewrites, which the loop's tooling sync overwrites with `main`'s.

The script refuses a source whose seed does not stand on the two commits `flavor.sh` writes
([`series-open`](/.claude/skills/series-open/SKILL.md)), `chore: Update version to dev` on `chore: Update flavor patch to dev`.
A commit that edits a flavored region stops the run with the commit named,
except the two generated bindings, `src/cpp11.cpp` and `R/cpp11.R`,
which are taken from the source with the flavor's names spelled back, as `cpp11::cpp_register()` would write them.

## Keep it aligned

> The rc strand is aligned when `scripts/series-rc.sh main` reports it aligned.
> A firing that moves `main-dev` while `main-rc-dev` exists realigns it with `--push` as its last write for the series.

Because every rc commit is a function of its source commit,
alignment is a fact the script recomputes rather than a history anyone keeps:
a rerun over an unchanged source mints the same SHAs and pushes nothing.
A repair that rewrites the source's tail rewrites the rc tail with it,
and CI judges the re-minted rc commits as it judges the source's.

Nothing is committed on the rc strand directly.
A fix belongs on `main-dev`, and reaches the rc strand by realigning;
an edit made on the rc strand is overwritten at the next realignment.
An rc commit red where its source commit is green is a finding about the flavor, the one thing that differs,
and it is fixed on `main`, in the code the flavor touches or in the flavor tooling,
[`scripts/flavor.sh`](/scripts/flavor.sh) and [`scripts/flavor-package-name.R`](/scripts/flavor-package-name.R).

The strand is derived, never vendored, repaired, ported or advanced on its own.

**An rc commit has no retry ledger.**
`retry-main-rc-dev` plans nothing, because the planner anchors a retry on a green and the rc strand has none.
An rc commit red for the infrastructure's reasons is judged again by dispatching `each-rcc` on `main-rc-dev`
with `force=true` and `max-commits` set to how many commits from the tip to replan, one for the tip alone;
a red of the tree's is a fix on `main-dev`, which realigning re-mints.

## After a landing

[`scripts/series-land.sh`](/scripts/series-land.sh) builds the landing from `main-rc-dev`,
and once `main` has taken it the strand has done its job for that landing.
Keep it aligned while another landing is planned, or delete it, and cut it again when the next one is.
duckdb-r also swaps and re-cuts the strand at a forward's cutover; forwarding is not ported.
