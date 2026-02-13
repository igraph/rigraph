# Modularity of a community structure of a graph

**\[deprecated\]**

`mod.matrix()` was renamed to
[`modularity_matrix()`](https://r.igraph.org/reference/modularity.igraph.md)
to create a more consistent API.

## Usage

``` r
mod.matrix(graph, membership, weights = NULL, resolution = 1, directed = TRUE)
```

## Arguments

- membership:

  Numeric vector, one value for each vertex, the membership vector of
  the community structure.

- weights:

  If not `NULL` then a numeric vector giving edge weights.

- resolution:

  The resolution parameter. Must be greater than or equal to 0. Set it
  to 1 to use the classical definition of modularity.

- directed:

  Whether to use the directed or undirected version of modularity.
  Ignored for undirected graphs.

## Related documentation in the C library

[[`modularity_matrix()`](https://r.igraph.org/reference/modularity.igraph.md)](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_modularity_matrix),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
