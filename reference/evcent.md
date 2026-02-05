# Find Eigenvector Centrality Scores of Network Positions

**\[deprecated\]**

`evcent()` was renamed to
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
to create a more consistent API.

## Usage

``` r
evcent(
  graph,
  directed = FALSE,
  scale = TRUE,
  weights = NULL,
  options = arpack_defaults()
)
```

## Arguments

- graph:

  Graph to be analyzed.

- directed:

  Logical scalar, whether to consider direction of the edges in directed
  graphs. It is ignored for undirected graphs.

- scale:

  **\[deprecated\]** Normalization will always take place.

- weights:

  A numerical vector or `NULL`. This argument can be used to give edge
  weights for calculating the weighted eigenvector centrality of
  vertices. If this is `NULL` and the graph has a `weight` edge
  attribute then that is used. If `weights` is a numerical vector then
  it is used, even if the graph has a `weight` edge attribute. If this
  is `NA`, then no edge weights are used (even if the graph has a
  `weight` edge attribute). Note that if there are negative edge weights
  and the direction of the edges is considered, then the eigenvector
  might be complex. In this case only the real part is reported. This
  function interprets weights as connection strength. Higher weights
  spread the centrality better.

- options:

  A named list, to override some ARPACK options. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.

## Related documentation in the C library

[`eigenvector_centrality()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_eigenvector_centrality),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
