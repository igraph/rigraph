# Theoretical maximum for closeness centralization

**\[deprecated\]**

`centralization.closeness.tmax()` was renamed to
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md)
to create a more consistent API.

## Usage

``` r
centralization.closeness.tmax(
  graph = NULL,
  nodes = 0,
  mode = c("out", "in", "all", "total")
)
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- mode:

  This is the same as the `mode` argument of
  [`closeness()`](https://r.igraph.org/reference/closeness.md). Ignored
  if an undirected graph is given.

## Related documentation in the C library

[`centralization_closeness_tmax`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_closeness_tmax)
