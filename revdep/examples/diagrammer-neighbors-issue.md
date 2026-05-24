# DiagrammeR neighbors() issue

## Issue
`neighbors()` now requires exactly one vertex

## Reproducible Example

```r
library(igraph)

# Create a simple graph
g <- make_ring(5)

# This works - single vertex
neighbors(g, 1)
#> + 2/5 vertices, from 7bb1be6:
#> [1] 5 2

# This fails - multiple vertices
neighbors(g, c(1, 2))
#> Error: `vid` must specify exactly one vertex

# This also fails - passing a vector
degree_vals <- degree(g)
neighbors(g, degree_vals)
#> Error: `vid` must specify exactly one vertex
```

## Root Cause
- igraph added stricter validation requiring exactly one vertex for `neighbors()`
- DiagrammeR's `get_leverage_centrality()` passes `degree_vals` (a vector) to `neighbors()`
- The code: `mean(degree_vals[igraph::neighbors(ig_graph, degree_vals)])`
- This previously may have worked with implicit vectorization or used first element

## Assessment
- This is an intentional API tightening in igraph for safety
- DiagrammeR needs to update to iterate over vertices individually
- The fix should loop: `lapply(seq_along(degree_vals), function(i) neighbors(g, i))`

## Recommendation for DiagrammeR
Change from:
```r
neighbors(ig_graph, degree_vals)
```
To:
```r
lapply(seq_along(degree_vals), function(i) neighbors(ig_graph, i))
```
