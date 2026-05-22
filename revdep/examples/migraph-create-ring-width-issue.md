# migraph create_ring(width = ) deprecation surfacing as test failure

## Issue
A migraph tutorial test asserts that no code expression in the tutorial emits a warning. `migraph::create_ring(32, width = 2)` now emits an igraph deprecation warning, breaking the assertion:

```
── Failure ('test-tutorials_migraph.R:12:5'): migraph tutorial code runs without warnings or errors ──
Expected `w` to be NULL.
...
Warning in expression 17 : rg <- create_ring(32, width = 2)
```

`create_ring()` is migraph's own wrapper; it internally calls into igraph and the deprecation originates from there. Without reading the migraph source the exact igraph function involved cannot be pinned down.

## Reproducible Example

```r
# install.packages("migraph")
library(migraph)

w <- NULL
withCallingHandlers(
  rg <- create_ring(32, width = 2),
  warning = function(c) { w <<- c; invokeRestart("muffleWarning") }
)
w
# On dev igraph: a <lifecycle_warning_deprecated/...> condition
# On CRAN igraph 2.3.1: NULL
```

## Root Cause
A function or argument called inside `migraph:::create_ring(width = ...)` was deprecated in a recent igraph release. The migraph tutorial does not catch this warning, and its strict no-warning assertion fails.

## Assessment
Bug in migraph — its `create_ring()` passes an argument or calls an igraph function whose argument is deprecated.

## Recommendation
**For migraph**:
1. Run `create_ring(32, width = 2)` against dev igraph and read the warning message to identify the deprecated function/argument being relayed.
2. Switch the internal implementation to the current API. If the deprecation is about a "thicker ring" / `width`-style argument on an igraph constructor, the canonical replacement is typically `make_lattice(length = N, dim = 1, circular = TRUE, nei = W)`.
