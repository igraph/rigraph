# Centralize a graph according to the eigenvector centrality of vertices

**\[deprecated\]**

`centralization.evcent()` was renamed to
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md) to
create a more consistent API.

## Usage

``` r
centralization.evcent(
  graph,
  directed = FALSE,
  scale = TRUE,
  options = arpack_defaults(),
  normalized = TRUE
)
```

## Arguments

- graph:

  The input graph.

- directed:

  logical scalar, whether to use directed shortest paths for calculating
  eigenvector centrality.

- scale:

  **\[deprecated\]** Ignored. Computing eigenvector centralization
  requires normalized eigenvector centrality scores.

- options:

  This is passed to
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
  the options for the ARPACK eigensolver.

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the theoretical maximum.

## Related documentation in the C library

[`centralization_eigenvector_centrality()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_eigenvector_centrality)
