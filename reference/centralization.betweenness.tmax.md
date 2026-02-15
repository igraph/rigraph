# Theoretical maximum for betweenness centralization

**\[deprecated\]**

`centralization.betweenness.tmax()` was renamed to
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md)
to create a more consistent API.

## Usage

``` r
centralization.betweenness.tmax(graph = NULL, nodes = 0, directed = TRUE)
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` and `directed` are
  both given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- directed:

  Logical scalar, whether to use directed shortest paths for calculating
  betweenness. Ignored if an undirected graph was given.

## Related documentation in the C library

[`centralization_betweenness_tmax`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_betweenness_tmax)
