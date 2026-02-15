# Community structure via greedy optimization of modularity

**\[deprecated\]**

`fastgreedy.community()` was renamed to
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md)
to create a more consistent API.

## Usage

``` r
fastgreedy.community(
  graph,
  merges = TRUE,
  modularity = TRUE,
  membership = TRUE,
  weights = NULL
)
```

## Arguments

- graph:

  The input graph. It must be undirected and must not have multi-edges.

- merges:

  Logical scalar, whether to return the merge matrix.

- modularity:

  Logical scalar, whether to return a vector containing the modularity
  after each merge.

- membership:

  Logical scalar, whether to calculate the membership vector
  corresponding to the maximum modularity score, considering all
  possible community structures along the merges.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
