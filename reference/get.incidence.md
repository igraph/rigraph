# Bipartite adjacency matrix of a bipartite graph

**\[deprecated\]**

`get.incidence()` was renamed to
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
get.incidence(graph, types = NULL, attr = NULL, names = TRUE, sparse = FALSE)
```

## Arguments

- graph:

  The input graph. The direction of the edges is ignored in directed
  graphs.

- types:

  An optional vertex type vector to use instead of the `type` vertex
  attribute. You must supply this argument if the graph has no `type`
  vertex attribute.

- attr:

  Either `NULL` or a character string giving an edge attribute name. If
  `NULL`, then a traditional bipartite adjacency matrix is returned. If
  not `NULL` then the values of the given edge attribute are included in
  the bipartite adjacency matrix. If the graph has multiple edges, the
  edge attribute of an arbitrarily chosen edge (for the multiple edges)
  is included.

- names:

  Logical scalar, if `TRUE` and the vertices in the graph are named
  (i.e. the graph has a vertex attribute called `name`), then vertex
  names will be added to the result as row and column names. Otherwise
  the ids of the vertices are used as row and column names.

- sparse:

  Logical scalar, if it is `TRUE` then a sparse matrix is created, you
  will need the `Matrix` package for this.

## Related documentation in the C library

[`get_biadjacency()`](https://igraph.org/c/html/latest/igraph-Bipartite.html#igraph_get_biadjacency),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
