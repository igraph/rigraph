# Theoretical maximum for betweenness centralization

**\[deprecated\]**

`centralization.evcent.tmax()` was renamed to
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md)
to create a more consistent API.

## Usage

``` r
centralization.evcent.tmax(
  graph = NULL,
  nodes = 0,
  directed = FALSE,
  scale = TRUE
)
```

## Arguments

- graph:

  The input graph. It can also be `NULL`, if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- directed:

  logical scalar, whether to consider edge directions during the
  calculation. Ignored in undirected graphs.

- scale:

  **\[deprecated\]** Ignored. Computing eigenvector centralization
  requires normalized eigenvector centrality scores.

## Related documentation in the C library

[`centralization_eigenvector_centrality_tmax`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_eigenvector_centrality_tmax)
