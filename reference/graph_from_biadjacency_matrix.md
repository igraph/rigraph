# Create graphs from a bipartite adjacency matrix

`graph_from_biadjacency_matrix()` creates a bipartite igraph graph from
an incidence matrix.

## Usage

``` r
graph_from_biadjacency_matrix(
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
  `graph_from_biadjacency_matrix()` can add the row and column names of
  the incidence matrix as vertex attributes. If this argument is `NULL`
  (the default) and the bipartite adjacency matrix has both row and
  column names, then these are added as the ‘`name`’ vertex attribute.
  If you want a different vertex attribute for this, then give the name
  of the attributes as a character string. If this argument is `NA`,
  then no vertex attributes (other than type) will be added.

## Value

A bipartite igraph graph. In other words, an igraph graph that has a
vertex attribute `type`.

## Details

Bipartite graphs have a ‘`type`’ vertex attribute in igraph, this is
boolean and `FALSE` for the vertices of the first kind and `TRUE` for
vertices of the second kind.

`graph_from_biadjacency_matrix()` can operate in two modes, depending on
the `multiple` argument. If it is `FALSE` then a single edge is created
for every non-zero element in the bipartite adjacency matrix. If
`multiple` is `TRUE`, then the matrix elements are rounded up to the
closest non-negative integer to get the number of edges to create
between a pair of vertices.

Some authors refer to the bipartite adjacency matrix as the "bipartite
incidence matrix". igraph 1.6.0 and later does not use this naming to
avoid confusion with the edge-vertex incidence matrix.

## See also

[`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
for another way to create bipartite graphs

Other biadjacency:
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
inc <- matrix(sample(0:1, 15, repl = TRUE), 3, 5)
colnames(inc) <- letters[1:5]
rownames(inc) <- LETTERS[1:3]
graph_from_biadjacency_matrix(inc)
#> IGRAPH b47d775 UN-B 8 8 -- 
#> + attr: type (v/l), name (v/c)
#> + edges from b47d775 (vertex names):
#> [1] A--a A--b A--c A--d A--e B--d C--b C--d
```
