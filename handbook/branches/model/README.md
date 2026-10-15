# The model

The series and its refs: what a series is, where its branches live, what each ref means and how far it may move.

**Two repositories.**
`igraph/rigraph` is canonical: its `main` is what CRAN releases, and the source of truth for the R code, the tests, the CI and the tooling.
`krlmlr/rigraph` is a fork of it, a fork object in the same fork network, used for the series and their per-commit CI,
so that those builds do not consume the igraph organization's Actions quota.
The fork carries the series refs, the `rcc2` verdict store, and mirrors of the canonical branches the series are seeded from ([`mirrors/`](/handbook/branches/mirrors/README.md)).
What the fork carried before it was recreated as a fork stands in `krlmlr/rigraph-old`, an archive nothing reads or writes.

**A series** is one upstream line together with the package branches that carry it.
There is one: `main`, which tracks the replay of igraph 0.10.17 to 1.0.1 and then igraph/igraph's `main`
([`operations/vendoring/model/`](/handbook/operations/vendoring/model/README.md)),
and publishes the flavor `igraph.dev` ([`flavors/`](/handbook/branches/flavors/README.md)).
A series is discovered, not configured: the loop serves every `<S>-build` with a sibling `<S>-dev`.

**The four refs** of a series `<S>`, all in the fork:

* `<S>-build`, the buffer: one commit per upstream commit that changes the vendored tree, with the glue compiling and no CI.
  Appended to; force-pushed only to repair.
* `<S>-dev`: what CI judges commit by commit.
  The buffer consumed in chunks of at most 100, with what CI demanded folded in, and `main`'s own changes ported in.
  Force-pushed when a repair folds a fix into an earlier commit.
* `<S>-green`: the trusted frontier, the newest commit such that every commit up to it has a successful run.
  Fast-forward only; r-universe builds it.
* `<S>-build-base`: the `-build` commit equivalent to `-green`, by vendored upstream SHA; set every firing, read by nothing.

The seed is `main` with the flavor applied by [`scripts/flavor.sh`](/scripts/flavor.sh)
and a commit stamping a fifth version component of `.0` ([`series-open`](/.claude/skills/series-open/SKILL.md)).
`-build`, `-dev` and `-build-base` start at the seed's tip, and `-green` at its base, `main`,
so that CI judges the flavor commits like any other before green moves over them.
The buffer is deliberately untested, so that vendoring can run ahead while CI catches up;
what keeps CI off it is that the workflows it carries match no branch named `*-build`, which the port stage keeps true by syncing its tooling too.

**Around the four:**

* `retry-<S>-dev`, the rerun ledger: pushed at one commit of `<S>-dev` to have it judged again on its own SHA.
* `<S>-rc-dev`, the rc strand: the series without its flavor, commit for commit, so that the package `main` would ship as `igraph` has verdicts of its own
  ([`series-rc`](/.claude/skills/series-rc/SKILL.md)).
  It is cut when a landing is planned, not before, since CI then judges every commit twice.
* `<L>-land-dev` and `<L>-land-green`, while a landing is in flight: the frozen `main` plus the series' vendor commits, unflavored,
  which `main` fast-forwards onto once CI has passed every one ([`series-land`](/.claude/skills/series-land/SKILL.md)).
* `snapshot-<sha>-rcc-smoke-null`: snapshots the per-commit gate accepted ([`operations/ci/per-commit/`](/handbook/operations/ci/per-commit/README.md)).

**`main` is the source of truth for everything but the vendored strand.**
R code, tests, CI and tooling are born on `main` in `igraph/rigraph` and reach the series by the loop's port stage, never the reverse.
The vendored tree, the patch stack and what vendoring regenerates are the series' own.
