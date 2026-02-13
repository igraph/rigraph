# Centralize a graph according to the degrees of vertices

**\[deprecated\]**

`centralization.degree()` was renamed to
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md) to
create a more consistent API.

## Usage

``` r
centralization.degree(
  graph,
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  normalized = TRUE
)
```

## Arguments

- graph:

  The input graph.

- mode:

  This is the same as the `mode` argument of
  [`degree()`](https://r.igraph.org/reference/degree.md).

- loops:

  Logical scalar, whether to consider loops edges when calculating the
  degree.

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the theoretical maximum.

## Related documentation in the C library

[`centralization_degree()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_degree)
