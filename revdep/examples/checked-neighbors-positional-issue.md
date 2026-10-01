# checked `neighbors(graph, v, mode)` positional deprecation

## Issue
`checked:::deduplicate_task_graph()` calls `igraph::neighbors(g, i, "out")`,
passing `mode` positionally. Since the optional arguments moved behind `...`,
that call is soft-deprecated and warns. checked's tests are snapshot tests, so
315 warnings turn into `[ FAIL 1 | WARN 315 | SKIP 0 | PASS 171 ]` — the
package itself still works.

## Reproducible Example

``` r
library(igraph)

g <- make_ring(4, directed = TRUE)

# Old call -- soft-deprecated for 3.0.0, warns under testthat
neighbors(g, 1, "out")
#> Warning: Calling `neighbors()` with positional or abbreviated arguments was deprecated
#> in igraph 3.0.0.
#> ℹ Detected call: neighbors(graph, v, mode)
#> ℹ Use instead: neighbors(graph, v, mode = )
#> This warning is displayed once per session.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> ── <vertex sequence> 1/4 · from b36f274 ────────────────────────────────────────
#> [1] 2

# Working replacement -- name the argument
neighbors(g, 1, mode = "out")
#> ── <vertex sequence> 1/4 · from b36f274 ────────────────────────────────────────
#> [1] 2
```

## Root Cause
`neighbors()` is now `neighbors(graph, v, ..., mode = ...)`: everything after
`...` has to be named. The generated argument handler recovers the old
positional call and warns through `lifecycle::deprecate_soft()`, which is quiet
in ordinary use and loud exactly where a maintainer will see it — under
testthat, and at the prompt. That is why this surfaces as a test failure rather
than as a user-visible warning.

## Assessment
Not a bug in checked: the call is correct today and deprecated for 3.0.0. It is
a one-word fix that also silences the warning for their users ahead of time.

## Recommendation
**For checked**: `neighbors(g, i, mode = "out")` in
`deduplicate_task_graph()`. The same rule applies to any other igraph call that
passes an optional argument positionally.

File at <https://github.com/Genentech/checked/issues>.
