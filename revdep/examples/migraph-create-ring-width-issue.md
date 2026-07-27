# migraph `create_ring(32, width = 2)` deprecation surfacing as test failure

> **Failure surface:** migraph (tutorial test asserts no warning).
> **Upstream owner:** [manynet](https://github.com/stocnet/manynet) — `create_ring()` is defined in manynet, which migraph `Depends` on. The deprecation originates inside manynet's implementation, not in migraph code.

## Issue
```
── Failure ('test-tutorials_migraph.R:12:5'): migraph tutorial code runs without warnings or errors ──
Expected `w` to be NULL.
...
Warning in expression 17 : rg <- create_ring(32, width = 2)
```

## Where the call actually lives

`manynet::create_ring(32, width = 2)` ([source](https://github.com/stocnet/manynet/blob/main/R/make_create.R)) internally:

```
igraph::make_ring(32, directed = FALSE)
manynet::as_matrix(...)                       # uses igraph::as_adjacency_matrix()
igraph::graph_from_adjacency_matrix(out, "undirected")
```

The deprecation warning is emitted somewhere inside this chain on dev igraph; the revdep backtrace stops at testthat's `quasi_label()` so the exact igraph function isn't surfaced.

## Reproducer

```r
# install.packages("manynet")
library(manynet)

w <- NULL
withCallingHandlers(
  rg <- create_ring(32, width = 2),
  warning = function(c) { w <<- c; invokeRestart("muffleWarning") }
)
w
# manynet 2.0.1 + CRAN igraph 2.3.1: NULL (no warning)
# dev igraph: unknown — not yet verified locally
```

## Status
- Against the latest CRAN manynet (2.0.1) + CRAN igraph 2.3.1 the call runs cleanly.
- manynet 2.0.0 reworked `as_matrix.igraph()` and other internals; the warning path may already have been removed.
- Cannot reproduce against dev igraph from this environment without building dev locally.

## Recommendation
- Re-confirm on the next revdep run.
- If the warning still fires against dev igraph, identify the specific call in manynet's `create_ring` → `as_matrix` → `graph_from_adjacency_matrix` chain that is deprecated, and fix it in **manynet** (not migraph).
