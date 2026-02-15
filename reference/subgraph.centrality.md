# Find subgraph centrality scores of network positions

**\[deprecated\]**

`subgraph.centrality()` was renamed to
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)
to create a more consistent API.

## Usage

``` r
subgraph.centrality(graph, diag = FALSE)
```

## Arguments

- graph:

  The input graph. It will be treated as undirected.

- diag:

  Boolean scalar, whether to include the diagonal of the adjacency
  matrix in the analysis. Giving `FALSE` here effectively eliminates the
  loops edges from the graph before the calculation.

## Related documentation in the C library

[`is_directed`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[`get_adjacency`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
