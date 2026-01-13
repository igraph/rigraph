# Bipartite adjacency matrix of a bipartite graph

This function can return a sparse or dense bipartite adjacency matrix of
a bipartite network. The bipartite adjacency matrix is an \\n\\ times
\\m\\ matrix, \\n\\ and \\m\\ are the number of vertices of the two
kinds.

## Usage

``` r
as_biadjacency_matrix(
  graph,
  types = NULL,
  attr = NULL,
  names = TRUE,
  sparse = FALSE
)
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

## Value

A sparse or dense matrix.

## Details

Bipartite graphs have a `type` vertex attribute in igraph, this is
boolean and `FALSE` for the vertices of the first kind and `TRUE` for
vertices of the second kind.

Some authors refer to the bipartite adjacency matrix as the "bipartite
incidence matrix". igraph 1.6.0 and later does not use this naming to
avoid confusion with the edge-vertex incidence matrix.

## Related documentation in the C library

[`get_biadjacency()`](https://igraph.org/c/html/latest/igraph-Bipartite.html#igraph_get_biadjacency),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

[`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)
for the opposite operation.

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_bipartite_graph(c(0, 1, 0, 1, 0, 0), c(1, 2, 2, 3, 3, 4))
as_biadjacency_matrix(g)
#>   2 4
#> 1 1 0
#> 3 1 1
#> 5 0 0
#> 6 0 0
```
