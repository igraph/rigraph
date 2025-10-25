# Graph density

**\[deprecated\]**

`graph.density()` was renamed to
[`edge_density()`](https://r.igraph.org/reference/edge_density.md) to
create a more consistent API.

## Usage

``` r
graph.density(graph, loops = FALSE)
```

## Arguments

- graph:

  The input graph.

- loops:

  Logical constant, whether loop edges may exist in the graph. This
  affects the calculation of the largest possible number of edges in the
  graph. If this parameter is set to FALSE yet the graph contains
  self-loops, the result will not be meaningful.
