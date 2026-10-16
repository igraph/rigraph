# The model

Why this package carries a complete copy of the igraph C library,
and why that copy advances one upstream commit at a time.

`src/vendor/cigraph/` is that copy, regenerated from an upstream clone by the scripts, never edited in place.
Why:

* **Self-contained builds.** The package compiles on a machine with no igraph installed, which is also what CRAN expects of a package.
* **The R/C interface matches the C library exactly.** `src/rinterface.c` and `R/aaa-*.R` are generated from the vendored `interfaces/` definitions,
  so they describe the functions the library compiled with them actually has.
* **A clone is the whole thing.** No submodule to initialise, update or forget.
* **Reproducible builds**, since nothing is resolved at build time.

**The invariants** every series keeps on its `-dev` branch:

1. **Linear**: first-parent history, no merges.
2. **One upstream commit per vendor commit**, forming a contiguous first-parent walk of the tracked line.
   Upstream commits that change nothing the vendored tree keeps produce no commit at all;
   the walk skips them without breaking contiguity, and the next vendor commit lists them in its body.
3. **Green per commit**: every commit builds and passes on its own;
   a needed fix is folded into the commit, never appended, because a follow-up leaves a red commit in history forever.
4. **Auditable R-side delta**: vendor commits touch only the paths vendoring regenerates, and anything else is a folded fix,
   reviewable as a path-filtered diff ([`pipeline/`](/handbook/operations/vendoring/pipeline/README.md)).

**The line has two stretches, joined at one seam.**
igraph 0.10.17 and 1.0.1 are not one first-parent walk apart upstream: 0.10.17 was released from a branch merged into `main` later.
So the walk to 1.0.1 follows a replay instead, rebuilt commit by commit in the branch `v1.0-replay` of `krlmlr/igraph`,
starting at 0.10.17 and ending in a tree equal to 1.0.1's in `src/`, `include/`, `vendor/` and `tests/`.
Its commits exist only there, so their vendor subjects name `krlmlr/igraph`.
At the replay's tip the next vendor commit is igraph/igraph's tag 1.0.1 itself,
and from there the walk follows igraph/igraph's `main`, one first-parent commit at a time.
That one vendor commit is the seam, and the only place the walk is not first-parent-contiguous:
its parent's tree is the replay's tip, which it equals in what is compiled.
[`scripts/series-config.sh`](/scripts/series-config.sh) pins the replay's tip and the seam,
and [`scripts/vendor-one.sh`](/scripts/vendor-one.sh) reads which stretch a branch is on from the ancestry of its newest vendored commit.

**A new line starts with a vendor commit at the fork point.**
When a line is opened from another, its walk begins where both share first-parent history,
and the fork point is the newest commit on the first-parent chain of both, which is not `git merge-base`.
The seam is the one place this repository departs from that rule, deliberately, because the replay never shares upstream's history.
