# Reverse dependencies

Checking the packages that depend on igraph against a change, before a release.

## What a run covers

* CRAN and Bioconductor packages alike, at every level up to `depth`.
  The `bioconductor` input of `revdep4` narrows that to `direct` (Bioconductor at level 1 only) or `none` (CRAN only),
  and `packages:` accepts a Bioconductor name too.
* Bioconductor packages come from the release that R's version maps to, as do the Bioconductor dependencies of every package checked.
  Bioconductor devel is not checked.
* Report links for a Bioconductor package point at its bioconductor.org page.
* The planner and shard scripts come from [cynkra/cynkratemplate](https://github.com/cynkra/cynkratemplate)'s `.github/actions/revdepx/`,
  pinned to one commit in `.github/workflows/revdep4.yaml`,
  and `.github/revdepx/bioconductor.patch` adds Bioconductor to them, so moving the pin means re-cutting the patch.
  `revdep` and `revdep2` check CRAN packages only.

*To deepen: absorb `revdep/README.md`, and say what the `revdep`, `revdep2` and `revdep4` workflows each run.*
