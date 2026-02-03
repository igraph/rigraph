# Create graphs from adjacency matrices

**\[deprecated\]**

`graph.adjacency()` was renamed to
[`graph_from_adjacency_matrix()`](https://r.igraph.org/reference/graph_from_adjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
graph.adjacency(
  adjmatrix,
  mode = c("directed", "undirected", "max", "min", "upper", "lower", "plus"),
  weighted = NULL,
  diag = TRUE,
  add.colnames = NULL,
  add.rownames = NA
)
```

## Arguments

- adjmatrix:

  A square adjacency matrix. From igraph version 0.5.1 this can be a
  sparse matrix created with the `Matrix` package.

- mode:

  Character scalar, specifies how igraph should interpret the supplied
  matrix. See also the `weighted` argument, the interpretation depends
  on that too. Possible values are: `directed`, `undirected`, `upper`,
  `lower`, `max`, `min`, `plus`. See details below.

- weighted:

  This argument specifies whether to create a weighted graph from an
  adjacency matrix. If it is `NULL` then an unweighted graph is created
  and the elements of the adjacency matrix gives the number of edges
  between the vertices. If it is a character constant then for every
  non-zero matrix entry an edge is created and the value of the entry is
  added as an edge attribute named by the `weighted` argument. If it is
  `TRUE` then a weighted graph is created and the name of the edge
  attribute will be `weight`. See also details below.

- diag:

  Logical scalar, whether to include the diagonal of the matrix in the
  calculation. If this is `FALSE` then the diagonal is zerod out first.

- add.colnames:

  Character scalar, whether to add the column names as vertex
  attributes. If it is `NULL` (the default) then, if present, column
  names are added as vertex attribute ‘name’. If `NA` or `FALSE` then
  they will not be added. If a character constant, then it gives the
  name of the vertex attribute to add.

- add.rownames:

  Character scalar, whether to add the row names as vertex attributes.
  Possible values the same as the previous argument. By default row
  names are not added. If ‘`add.rownames`’ and ‘`add.colnames`’ specify
  the same vertex attribute, then the former is ignored.

## Related documentation in the C library

[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify)
