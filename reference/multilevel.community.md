# Finding community structure by multi-level optimization of modularity

**\[deprecated\]**

`multilevel.community()` was renamed to
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
to create a more consistent API.

## Usage

``` r
multilevel.community(graph, weights = NULL, resolution = 1)
```

## Arguments

- graph:

  The input graph. It must be undirected.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- resolution:

  Optional resolution parameter that allows the user to adjust the
  resolution parameter of the modularity function that the algorithm
  uses internally. Lower values typically yield fewer, larger clusters.
  The original definition of modularity is recovered when the resolution
  parameter is set to 1.

## Related documentation in the C library

[`community_multilevel()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_community_multilevel),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
