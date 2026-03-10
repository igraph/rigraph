# Centralize a graph according to the closeness of vertices

**\[deprecated\]**

`centralization.closeness()` was renamed to
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md) to create a
more consistent API.

## Usage

``` r
centralization.closeness(
  graph,
  mode = c("out", "in", "all", "total"),
  normalized = TRUE
)
```

## Arguments

- graph:

  The input graph.

- mode:

  This is the same as the `mode` argument of
  [`closeness()`](https://r.igraph.org/reference/closeness.md).

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the theoretical maximum.

## Related documentation in the C library

[`centralization_closeness()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_closeness)
