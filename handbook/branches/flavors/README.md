# Flavors

One source tree, published under two package names.

**`igraph`** is the package on CRAN, released from `igraph/rigraph`'s `main`.
**`igraph.dev`** is the bleeding edge: the series `main`, with the newest igraph C library CI has verified, published by r-universe from `main-green`.
Because the names differ, both install into one library and load side by side.
[`scripts/series.yaml`](/scripts/series.yaml) declares both.

**A flavor is a mechanical rename applied on top of a series' seed.**
`scripts/flavor.sh` applies `scripts/flavor.patch`, whose content is the rename surface:
the places that cannot ask for the package name at run time, such as `DESCRIPTION` and the native routine registration.
It regenerates `src/cpp11.cpp` and `R/cpp11.R` rather than patching them, because cpp11 derives the registration names from the package name.
Everywhere else the package asks for its name at run time ([`architecture/r-layer/conventions/`](/handbook/architecture/r-layer/conventions/README.md)),
and the per-commit gate checks that every name in a tree agrees (`scripts/flavor-package-name.R`).

**The rc strand reverses the flavor** commit for commit, so that the unflavored package has verdicts of its own before it lands on `main`
([`series-rc`](/.claude/skills/series-rc/SKILL.md)).

*To deepen: say where `igraph.dev` is registered in igraph's universe, once it is.*
