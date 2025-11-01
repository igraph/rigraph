# Breadth-first search

Breadth-first search is an algorithm to traverse a graph. We start from
a root vertex and spread along every edge “simultaneously”.

## Usage

``` r
bfs(
  graph,
  root,
  mode = c("out", "in", "all", "total"),
  ...,
  unreachable = TRUE,
  restricted = NULL,
  order = TRUE,
  rank = FALSE,
  parent = FALSE,
  pred = FALSE,
  succ = FALSE,
  dist = FALSE,
  callback = NULL,
  extra = NULL,
  rho = parent.frame(),
  neimode = deprecated(),
  father = deprecated()
)
```

## Arguments

- graph:

  The input graph.

- root:

  Numeric vector, usually of length one. The root vertex, or root
  vertices to start the search from.

- mode:

  For directed graphs specifies the type of edges to follow. ‘out’
  follows outgoing, ‘in’ incoming edges. ‘all’ ignores edge directions
  completely. ‘total’ is a synonym for ‘all’. This argument is ignored
  for undirected graphs.

- ...:

  These dots are for future extensions and must be empty.

- unreachable:

  Logical scalar, whether the search should visit the vertices that are
  unreachable from the given root vertex (or vertices). If `TRUE`, then
  additional searches are performed until all vertices are visited.

- restricted:

  `NULL` (=no restriction), or a vector of vertices (ids or symbolic
  names). In the latter case, the search is restricted to the given
  vertices.

- order:

  Logical scalar, whether to return the ordering of the vertices.

- rank:

  Logical scalar, whether to return the rank of the vertices.

- parent:

  Logical scalar, whether to return the parent of the vertices.

- pred:

  Logical scalar, whether to return the predecessors of the vertices.

- succ:

  Logical scalar, whether to return the successors of the vertices.

- dist:

  Logical scalar, whether to return the distance from the root of the
  search tree.

- callback:

  If not `NULL`, then it must be callback function. This is called
  whenever a vertex is visited. See details below.

- extra:

  Additional argument to supply to the callback function.

- rho:

  The environment in which the callback function is evaluated.

- neimode:

  **\[deprecated\]** This argument is deprecated from igraph 1.3.0; use
  `mode` instead.

- father:

  **\[deprecated\]** Use `parent` instead.

## Value

A named list with the following entries:

- root:

  Numeric scalar. The root vertex that was used as the starting point of
  the search.

- neimode:

  Character scalar. The `mode` argument of the function call. Note that
  for undirected graphs this is always ‘all’, irrespectively of the
  supplied value.

- order:

  Numeric vector. The vertex ids, in the order in which they were
  visited by the search.

- rank:

  Numeric vector. The rank for each vertex, zero for unreachable
  vertices.

- parent:

  Numeric vector. The parent of each vertex, i.e. the vertex it was
  discovered from.

- father:

  Like parent, kept for compatibility for now.

- pred:

  Numeric vector. The previously visited vertex for each vertex, or 0 if
  there was no such vertex.

- succ:

  Numeric vector. The next vertex that was visited after the current
  one, or 0 if there was no such vertex.

- dist:

  Numeric vector, for each vertex its distance from the root of the
  search tree. Unreachable vertices have a negative distance as of
  igraph 1.6.0, this used to be `NaN`.

Note that `order`, `rank`, `parent`, `pred`, `succ` and `dist` might be
`NULL` if their corresponding argument is `FALSE`, i.e. if their
calculation is not requested.

## Details

The callback function must have the following arguments:

- graph:

  The input graph is passed to the callback function here.

- data:

  A named numeric vector, with the following entries: ‘vid’, the vertex
  that was just visited, ‘pred’, its predecessor (zero if this is the
  first vertex), ‘succ’, its successor (zero if this is the last
  vertex), ‘rank’, the rank of the current vertex, ‘dist’, its distance
  from the root of the search tree.

- extra:

  The extra argument.

The callback must return `FALSE` to continue the search or `TRUE` to
terminate it. See examples below on how to use the callback function.

## See also

[`dfs()`](https://r.igraph.org/reference/dfs.md) for depth-first search.

Other structural.properties:
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`edge_density()`](https://r.igraph.org/reference/edge_density.md),
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## Two rings
bfs(make_ring(10) %du% make_ring(10),
  root = 1, "out",
  order = TRUE, rank = TRUE, parent = TRUE, pred = TRUE,
  succ = TRUE, dist = TRUE
)
#> $root
#> [1] 1
#> 
#> $mode
#> [1] "out"
#> 
#> $order
#> + 20/20 vertices, from 2efa5d0:
#>  [1]  1  2 10  3  9  4  8  5  7  6 11 12 20 13 19 14 18 15 17 16
#> 
#> $rank
#>  [1]  1  2  4  6  8 10  9  7  5  3 11 12 14 16 18 20 19 17 15 13
#> 
#> $parent
#> + 20/20 vertices, from 2efa5d0:
#>  [1] NA  1  2  3  4  5  8  9 10  1 NA 11 12 13 14 15 18 19 20 11
#> 
#> $pred
#> + 20/20 vertices, from 2efa5d0:
#>  [1] NA  1 10  9  8  7  5  4  3  2 NA 11 20 19 18 17 15 14 13 12
#> 
#> $succ
#> + 20/20 vertices, from 2efa5d0:
#>  [1]  2 10  9  8  7 NA  6  5  4  3 12 20 19 18 17 NA 16 15 14 13
#> 
#> $dist
#>  [1] 0 1 2 3 4 5 4 3 2 1 0 1 2 3 4 5 4 3 2 1
#> 
#> $neimode
#> [1] "out"
#> 
#> $father
#> + 20/20 vertices, from 2efa5d0:
#>  [1] NA  1  2  3  4  5  8  9 10  1 NA 11 12 13 14 15 18 19 20 11
#> 

## How to use a callback
f <- function(graph, data, extra) {
  print(data)
  FALSE
}
tmp <- bfs(make_ring(10) %du% make_ring(10),
  root = 1, "out",
  callback = f
)
#>  vid pred succ rank dist 
#>    1    0    2    1    0 
#>  vid pred succ rank dist 
#>    2    1   10    2    1 
#>  vid pred succ rank dist 
#>   10    2    3    3    1 
#>  vid pred succ rank dist 
#>    3   10    9    4    2 
#>  vid pred succ rank dist 
#>    9    3    4    5    2 
#>  vid pred succ rank dist 
#>    4    9    8    6    3 
#>  vid pred succ rank dist 
#>    8    4    5    7    3 
#>  vid pred succ rank dist 
#>    5    8    7    8    4 
#>  vid pred succ rank dist 
#>    7    5    6    9    4 
#>  vid pred succ rank dist 
#>    6    7    0   10    5 
#>  vid pred succ rank dist 
#>   11    0   12   11    0 
#>  vid pred succ rank dist 
#>   12   11   20   12    1 
#>  vid pred succ rank dist 
#>   20   12   13   13    1 
#>  vid pred succ rank dist 
#>   13   20   19   14    2 
#>  vid pred succ rank dist 
#>   19   13   14   15    2 
#>  vid pred succ rank dist 
#>   14   19   18   16    3 
#>  vid pred succ rank dist 
#>   18   14   15   17    3 
#>  vid pred succ rank dist 
#>   15   18   17   18    4 
#>  vid pred succ rank dist 
#>   17   15   16   19    4 
#>  vid pred succ rank dist 
#>   16   17    0   20    5 

## How to use a callback to stop the search
## We stop after visiting all vertices in the initial component
f <- function(graph, data, extra) {
  data["succ"] == -1
}
bfs(make_ring(10) %du% make_ring(10), root = 1, callback = f)
#> $root
#> [1] 1
#> 
#> $mode
#> [1] "out"
#> 
#> $order
#> + 20/20 vertices, from a25057e:
#>  [1]  1  2 10  3  9  4  8  5  7  6 11 12 20 13 19 14 18 15 17 16
#> 
#> $rank
#> NULL
#> 
#> $parent
#> NULL
#> 
#> $pred
#> NULL
#> 
#> $succ
#> NULL
#> 
#> $dist
#> NULL
#> 
#> $neimode
#> [1] "out"
#> 
```
