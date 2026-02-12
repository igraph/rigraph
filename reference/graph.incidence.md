# Create graphs from a bipartite adjacency matrix

**\[deprecated\]**

`graph.incidence()` was renamed to
[`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
graph.incidence(
  incidence,
  directed = FALSE,
  mode = c("all", "out", "in", "total"),
  multiple = FALSE,
  weighted = NULL,
  add.names = NULL
)
```

## Arguments

- incidence:

  The input bipartite adjacency matrix. It can also be a sparse matrix
  from the `Matrix` package.

- directed:

  Logical scalar, whether to create a directed graph.

- mode:

  A character constant, defines the direction of the edges in directed
  graphs, ignored for undirected graphs. If ‘`out`’, then edges go from
  vertices of the first kind (corresponding to rows in the bipartite
  adjacency matrix) to vertices of the second kind (columns in the
  incidence matrix). If ‘`in`’, then the opposite direction is used. If
  ‘`all`’ or ‘`total`’, then mutual edges are created.

- multiple:

  Logical scalar, specifies how to interpret the matrix elements. See
  details below.

- weighted:

  This argument specifies whether to create a weighted graph from the
  bipartite adjacency matrix. If it is `NULL` then an unweighted graph
  is created and the `multiple` argument is used to determine the edges
  of the graph. If it is a character constant then for every non-zero
  matrix entry an edge is created and the value of the entry is added as
  an edge attribute named by the `weighted` argument. If it is `TRUE`
  then a weighted graph is created and the name of the edge attribute
  will be ‘`weight`’.

- add.names:

  A character constant, `NA` or `NULL`.
  [`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)
  can add the row and column names of the incidence matrix as vertex
  attributes. If this argument is `NULL` (the default) and the bipartite
  adjacency matrix has both row and column names, then these are added
  as the ‘`name`’ vertex attribute. If you want a different vertex
  attribute for this, then give the name of the attributes as a
  character string. If this argument is `NA`, then no vertex attributes
  (other than type) will be added.
