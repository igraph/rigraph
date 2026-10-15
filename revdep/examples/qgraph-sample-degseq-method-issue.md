# qgraph sample_degseq(method = "simple.no.multiple") defunct

## Issue
`qgraph::smallworldness()` calls `igraph::degree.sequence.game(deg.dist, method = "simple.no.multiple")`, which hard-errors because the `"simple.no.multiple"` method value is defunct as of igraph 2.1.0.

## Reproducible Example

```r
library(igraph)

deg <- rep(2, 10)

sample_degseq(deg, method = "simple.no.multiple")
#> Error:
#> ! The `method` argument of `sample_degseq()` must be fast.heur.simple
#>   instead of simple.no.multiple as of igraph 2.1.0.

# Working replacement
sample_degseq(deg, method = "fast.heur.simple")
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
Bug in qgraph — pinned to an obsolete method name.

## Recommendation
**For qgraph**: switch to `method = "fast.heur.simple"`. While there, replace the deprecated alias `degree.sequence.game()` itself with `sample_degseq()` to silence the upstream warnings (`watts.strogatz.game`, `average.path.length`, `degree.sequence.game`).
