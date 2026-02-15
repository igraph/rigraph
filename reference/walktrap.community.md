# Community structure via short random walks

**\[deprecated\]**

`walktrap.community()` was renamed to
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)
to create a more consistent API.

## Usage

``` r
walktrap.community(
  graph,
  weights = NULL,
  steps = 4,
  merges = TRUE,
  modularity = TRUE,
  membership = TRUE
)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored in directed graphs.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. Larger edge weights increase the
  probability that an edge is selected by the random walker. In other
  words, larger edge weights correspond to stronger connections.

- steps:

  The length of the random walks to perform.

- merges:

  Logical scalar, whether to include the merge matrix in the result.

- modularity:

  Logical scalar, whether to include the vector of the modularity scores
  in the result. If the `membership` argument is true, then it will
  always be calculated.

- membership:

  Logical scalar, whether to calculate the membership vector for the
  split corresponding to the highest modularity value.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
