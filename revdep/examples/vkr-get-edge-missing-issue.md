# vkR igraph::get.edge missing

## Issue
```
checking dependencies in R code ... WARNING
  Missing or unexported object: 'igraph::get.edge'
```

`get.edge()` has been removed from igraph; `ends()` is its replacement.

## Reproducible Example

```r
library(igraph)

g <- make_ring(5)

igraph::get.edge(g, 1)
#> Error: 'get.edge' is not an exported object from 'namespace:igraph'

# Working replacement
ends(g, 1)
#>      [,1] [,2]
#> [1,]    1    2
```

## Root Cause
`get.edge()` was hard-deprecated and removed. The replacement, `ends()`, has been the canonical API since igraph 1.x.

## Assessment
Bug in vkR — references a function that no longer exists. Currently a WARNING; will become an error if/when the affected code path is exercised.

## Recommendation
**For vkR**: replace `igraph::get.edge(graph, e)` with `igraph::ends(graph, e)`. `ends()` accepts a vector of edges and returns an n × 2 matrix, so single-edge callers may need `[1, ]`.
