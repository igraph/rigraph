# Convert a graph to an adjacency matrix

**\[deprecated\]** We plan to remove `as_adj()` in favor of the more
explicitly named
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
so please use
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
instead.

## Usage

``` r
as_adj(
  graph,
  type = c("both", "upper", "lower"),
  attr = NULL,
  edges = deprecated(),
  names = TRUE,
  sparse = igraph_opt("sparsematrices")
)
```

## Arguments

- graph:

  The graph to convert.

- type:

  Gives how to create the adjacency matrix for undirected graphs. It is
  ignored for directed graphs. Possible values: `upper`: the upper right
  triangle of the matrix is used, `lower`: the lower left triangle of
  the matrix is used. `both`: the whole matrix is used, a symmetric
  matrix is returned.

- attr:

  Either `NULL` or a character string giving an edge attribute name. If
  `NULL` a traditional adjacency matrix is returned. If not `NULL` then
  the values of the given edge attribute are included in the adjacency
  matrix. If the graph has multiple edges, the edge attribute of an
  arbitrarily chosen edge (for the multiple edges) is included. This
  argument is ignored if `edges` is `TRUE`.

  Note that this works only for certain attribute types. If the `sparse`
  argumen is `TRUE`, then the attribute must be either logical or
  numeric. If the `sparse` argument is `FALSE`, then character is also
  allowed. The reason for the difference is that the `Matrix` package
  does not support character sparse matrices yet.

- edges:

  **\[deprecated\]** Logical scalar, whether to return the edge ids in
  the matrix. For non-existant edges zero is returned.

- names:

  Logical constant, whether to assign row and column names to the
  matrix. These are only assigned if the `name` vertex attribute is
  present in the graph.

- sparse:

  Logical scalar, whether to create a sparse matrix. The ‘`Matrix`’
  package must be installed for creating sparse matrices.

## Related documentation in the C library

[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
