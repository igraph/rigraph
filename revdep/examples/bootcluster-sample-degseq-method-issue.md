# bootcluster `sample_degseq(method = "simple.no.multiple")` defunct

## Issue
`bootcluster:::scheme2.exp()` calls
`igraph::sample_degseq(out.deg = degree.seq, method = "simple.no.multiple")`,
which hard-errors because the `"simple.no.multiple"` method value is defunct as
of igraph 2.1.0. It surfaces as an ERROR in the `network.stability()` example.

## Reproducible Example

``` r
library(igraph)

deg <- rep(2, 10) # any graphical degree sequence

# Old call -- defunct since igraph 2.1.0
sample_degseq(out.deg = deg, method = "simple.no.multiple")
#> Error:
#> ! The `method` argument of `sample_degseq()` must be fast.heur.simple
#>   instead of simple.no.multiple as of igraph 2.1.0.

# Working replacement -- new method name, same sampler
g <- sample_degseq(out.deg = deg, method = "fast.heur.simple")
vcount(g)
#> [1] 10
ecount(g)
#> [1] 10
```

## Root Cause
`sample_degseq()` had three legacy method values renamed in 2.1.0:

| Old value | New value |
|---|---|
| `"simple"` | `"configuration"` |
| `"simple.no.multiple"` | `"fast.heur.simple"` |
| `"simple.no.multiple.uniform"` | `"configuration.simple"` |

All three advanced from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

## Assessment
Bug in bootcluster — pinned to an obsolete method name. Same root cause as
qgraph and degreenet; see `qgraph-sample-degseq-method-issue` and
`degreenet-reedmolloy-issue`.

## Recommendation
**For bootcluster**: switch to `method = "fast.heur.simple"` in
`scheme2.exp()`. The same example also emits deprecation warnings for
`clusters()`, `induced.subgraph()` and `fastgreedy.community()`; their
replacements are `components()`, `induced_subgraph()` and
`cluster_fast_greedy()`.

CRAN has no URL or BugReports field for bootcluster, so this one goes to the
maintainer by email: Tianmou Liu &lt;tianmouliu@outlook.com&gt;.
