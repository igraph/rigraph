# Adjacency lists

Create adjacency lists from a graph, either for adjacent edges or for
neighboring vertices

## Usage

``` r
as_adj_list(
  graph,
  mode = c("all", "out", "in", "total"),
  loops = c("twice", "once", "ignore"),
  multiple = TRUE
)

as_adj_edge_list(
  graph,
  mode = c("all", "out", "in", "total"),
  loops = c("twice", "once", "ignore")
)
```

## Arguments

- graph:

  The input graph.

- mode:

  Character scalar, it gives what kind of adjacent edges/vertices to
  include in the lists. ‘`out`’ is for outgoing edges/vertices, ‘`in`’
  is for incoming edges/vertices, ‘`all`’ is for both. This argument is
  ignored for undirected graphs.

- loops:

  Character scalar, one of `"ignore"` (to omit loops), `"twice"` (to
  include loop edges twice) and `"once"` (to include them once).
  `"twice"` is not allowed for directed graphs and will be replaced with
  `"once"`.

- multiple:

  Logical scalar, set to `FALSE` to use only one representative of each
  set of parallel edges.

## Value

A list of `igraph.vs` or a list of numeric vectors depending on the
value of `igraph_opt("return.vs.es")`, see details for performance
characteristics.

## Details

`as_adj_list()` returns a list of numeric vectors, which include the ids
of neighbor vertices (according to the `mode` argument) of all vertices.

`as_adj_edge_list()` returns a list of numeric vectors, which include
the ids of adjacent edges (according to the `mode` argument) of all
vertices.

If `igraph_opt("return.vs.es")` is true (default), the numeric vectors
of the adjacency lists are coerced to `igraph.vs`, this can be a very
expensive operation on large graphs.

## See also

[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)

Other conversion:
[`as.matrix.igraph()`](https://r.igraph.org/reference/as.matrix.igraph.md),
[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md),
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md),
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
g <- make_ring(10)
as_adj_list(g)
#> [[1]]
#> + 2/10 vertices, from 8f61e3d:
#> [1]  2 10
#> 
#> [[2]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 1 3
#> 
#> [[3]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 2 4
#> 
#> [[4]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 3 5
#> 
#> [[5]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 4 6
#> 
#> [[6]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 5 7
#> 
#> [[7]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 6 8
#> 
#> [[8]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 7 9
#> 
#> [[9]]
#> + 2/10 vertices, from 8f61e3d:
#> [1]  8 10
#> 
#> [[10]]
#> + 2/10 vertices, from 8f61e3d:
#> [1] 1 9
#> 
as_adj_edge_list(g)
#> [[1]]
#> + 2/10 edges from 8f61e3d:
#> [1] 1-- 2 1--10
#> 
#> [[2]]
#> + 2/10 edges from 8f61e3d:
#> [1] 1--2 2--3
#> 
#> [[3]]
#> + 2/10 edges from 8f61e3d:
#> [1] 2--3 3--4
#> 
#> [[4]]
#> + 2/10 edges from 8f61e3d:
#> [1] 3--4 4--5
#> 
#> [[5]]
#> + 2/10 edges from 8f61e3d:
#> [1] 4--5 5--6
#> 
#> [[6]]
#> + 2/10 edges from 8f61e3d:
#> [1] 5--6 6--7
#> 
#> [[7]]
#> + 2/10 edges from 8f61e3d:
#> [1] 6--7 7--8
#> 
#> [[8]]
#> + 2/10 edges from 8f61e3d:
#> [1] 7--8 8--9
#> 
#> [[9]]
#> + 2/10 edges from 8f61e3d:
#> [1] 8-- 9 9--10
#> 
#> [[10]]
#> + 2/10 edges from 8f61e3d:
#> [1] 1--10 9--10
#> 
```
