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
