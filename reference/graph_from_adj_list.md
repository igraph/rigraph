# Create graphs from adjacency lists

An adjacency list is a list of numeric vectors, containing the neighbor
vertices for each vertex. This function creates an igraph graph object
from such a list.

## Usage

``` r
graph_from_adj_list(
  adjlist,
  mode = c("out", "in", "all", "total"),
  duplicate = TRUE
)
```

## Arguments

- adjlist:

  The adjacency list. It should be consistent, i.e. the maximum
  throughout all vectors in the list must be less than the number of
  vectors (=the number of vertices in the graph).

- mode:

  Character scalar, it specifies whether the graph to create is
  undirected (‘all’ or ‘total’) or directed; and in the latter case,
  whether it contains the outgoing (‘out’) or the incoming (‘in’)
  neighbors of the vertices.

- duplicate:

  Logical scalar. For undirected graphs it gives whether edges are
  included in the list twice. E.g. if it is `TRUE` then for an
  undirected `{A,B}` edge `graph_from_adj_list()` expects `A` included
  in the neighbors of `B` and `B` to be included in the neighbors of
  `A`.

  This argument is ignored if `mode` is `out` or `in`.

## Value

An igraph graph object.

## Details

Adjacency lists are handy if you intend to do many (small) modifications
to a graph. In this case adjacency lists are more efficient than igraph
graphs.

The idea is that you convert your graph to an adjacency list by
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md), do
your modifications to the graphs and finally create again an igraph
graph by calling `graph_from_adj_list()`.

## See also

[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md)

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`as_directed()`](https://r.igraph.org/reference/as_directed.md),
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md),
[`as_long_data_frame()`](https://r.igraph.org/reference/as_long_data_frame.md),
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`adjlist()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_adjlist).

## Examples

``` r
## Directed
g <- make_ring(10, directed = TRUE)
al <- as_adj_list(g, mode = "out")
g2 <- graph_from_adj_list(al)
isomorphic(g, g2)
#> [1] TRUE

## Undirected
g <- make_ring(10)
al <- as_adj_list(g)
g2 <- graph_from_adj_list(al, mode = "all")
isomorphic(g, g2)
#> [1] TRUE
ecount(g2)
#> [1] 10
g3 <- graph_from_adj_list(al, mode = "all", duplicate = FALSE)
ecount(g3)
#> [1] 20
which_multiple(g3)
#>  [1] FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE
#> [13]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE
```
