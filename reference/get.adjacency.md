# Convert a graph to an adjacency matrix

**\[deprecated\]**

`get.adjacency()` was renamed to
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
get.adjacency(
  graph,
  type = c("both", "upper", "lower"),
  attr = NULL,
  edges = FALSE,
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
