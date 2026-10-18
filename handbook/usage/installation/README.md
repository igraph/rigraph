# Installation

How to install `igraph` and `igraph.dev`, and what each one is.

**`igraph` is the package on CRAN**, built from `igraph/rigraph`'s `main`.
**`igraph.dev` is the bleeding edge**: the same R code over the newest igraph C library this repository has verified,
built by r-universe from the `main-green` ref ([`branches/flavors/`](/handbook/branches/flavors/README.md)).
The two have different package names, so both install into one library and load side by side.

*To deepen: absorb the installation part of `CONTRIBUTING.md` § Development and Compilation and of `vignettes/articles/installation-troubleshooting.Rmd`, and add the r-universe install line once `igraph.dev` is registered there.*
