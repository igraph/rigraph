# cranly eigen_centrality(scale = ) defunct

## Issue
`cranly:::summary.cranly_network()` calls `igraph::eigen_centrality(cranly_graph, scale = FALSE)`. Defunct since igraph 2.1.1. Breaks the `cranly.Rmd` vignette re-build.

## Reproducible Example

```r
library(igraph)

g <- sample_gnp(20, 0.3)

eigen_centrality(g, scale = FALSE)
#> Error:
#> ! The `scale` argument of `eigen_centrality()` always as if TRUE as of
#>   igraph 2.1.1.
#> i Normalization is always performed

# Working replacement
res <- eigen_centrality(g)
res$vector
```

## Root Cause
`eigen_centrality(scale = )` was deprecated in igraph 2.1.1 ([#1543](https://github.com/igraph/rigraph/pull/1543)); normalization is now mandatory. Advanced from `deprecate_warn` to `deprecate_stop` in [#2634](https://github.com/igraph/rigraph/pull/2634).

## Assessment
Bug in cranly — relies on an argument whose effect has been removed.

## Recommendation
**For cranly**: drop the `scale = FALSE` argument. If un-normalized values are needed downstream, rescale manually afterwards.
