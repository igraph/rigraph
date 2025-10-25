# Depth-first search

Depth-first search is an algorithm to traverse a graph. It starts from a
root vertex and tries to go quickly as far from as possible.

## Usage

``` r
dfs(
  graph,
  root,
  mode = c("out", "in", "all", "total"),
  ...,
  unreachable = TRUE,
  order = TRUE,
  order.out = FALSE,
  parent = FALSE,
  dist = FALSE,
  in.callback = NULL,
  out.callback = NULL,
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

  The single root vertex to start the search from.

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

- order:

  Logical scalar, whether to return the DFS ordering of the vertices.

- order.out:

  Logical scalar, whether to return the ordering based on leaving the
  subtree of the vertex.

- parent:

  Logical scalar, whether to return the parent of the vertices.

- dist:

  Logical scalar, whether to return the distance from the root of the
  search tree.

- in.callback:

  If not `NULL`, then it must be callback function. This is called
  whenever a vertex is visited. See details below.

- out.callback:

  If not `NULL`, then it must be callback function. This is called
  whenever the subtree of a vertex is completed by the algorithm. See
  details below.

- extra:

  Additional argument to supply to the callback function.

- rho:

  The environment in which the callback function is evaluated.

- neimode:

  **\[deprecated\]** This argument is deprecated from igraph 1.3.0; use
  `mode` instead.

- father:

  **\[deprecated\]**, use `parent` instead.

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

- order.out:

  Numeric vector, the vertex ids, in the order of the completion of
  their subtree.

- parent:

  Numeric vector. The parent of each vertex, i.e. the vertex it was
  discovered from.

- father:

  Like parent, kept for compatibility for now.

- dist:

  Numeric vector, for each vertex its distance from the root of the
  search tree.

Note that `order`, `order.out`, `parent`, and `dist` might be `NULL` if
their corresponding argument is `FALSE`, i.e. if their calculation is
not requested.

## Details

The callback functions must have the following arguments:

- graph:

  The input graph is passed to the callback function here.

- data:

  A named numeric vector, with the following entries: ‘vid’, the vertex
  that was just visited and ‘dist’, its distance from the root of the
  search tree.

- extra:

  The extra argument.

The callback must return FALSE to continue the search or TRUE to
terminate it. See examples below on how to use the callback functions.

## See also

[`bfs()`](https://r.igraph.org/reference/bfs.md) for breadth-first
search.

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
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
## A graph with two separate trees
dfs(
  graph = make_tree(10) %du% make_tree(10),
  root = 1, mode = "out",
  unreachable = TRUE,
  order = TRUE,
  order.out = TRUE,
  parent = TRUE
)
#> $root
#> [1] 1
#> 
#> $mode
#> [1] "out"
#> 
#> $order
#> + 20/20 vertices, from 782a44f:
#>  [1]  1  2  4  8  9  5 10  3  6  7 11 12 14 18 19 15 20 13 16 17
#> 
#> $order.out
#> + 20/20 vertices, from 782a44f:
#>  [1]  8  9  4 10  5  2  6  7  3  1 18 19 14 20 15 12 16 17 13 11
#> 
#> $parent
#> + 20/20 vertices, from 782a44f:
#>  [1] NA  1  1  2  2  3  3  4  4  5 NA 11 11 12 12 13 13 14 14 15
#> 
#> $dist
#> NULL
#> 
#> $neimode
#> [1] "out"
#> 
#> $father
#> + 20/20 vertices, from 782a44f:
#>  [1] NA  1  1  2  2  3  3  4  4  5 NA 11 11 12 12 13 13 14 14 15
#> 

## How to use a callback
f.in <- function(graph, data, extra) {
  cat("in:", paste(collapse = ", ", data), "\n")
  FALSE
}
f.out <- function(graph, data, extra) {
  cat("out:", paste(collapse = ", ", data), "\n")
  FALSE
}
tmp <- dfs(
  graph = make_tree(10),
  root = 1, mode = "out",
  in.callback = f.in, out.callback = f.out
)
#> in: 1, 0 
#> in: 2, 1 
#> in: 4, 2 
#> in: 8, 3 
#> out: 8, 2 
#> in: 9, 3 
#> out: 9, 2 
#> out: 4, 1 
#> in: 5, 2 
#> in: 10, 3 
#> out: 10, 2 
#> out: 5, 1 
#> out: 2, 0 
#> in: 3, 1 
#> in: 6, 2 
#> out: 6, 1 
#> in: 7, 2 
#> out: 7, 1 
#> out: 3, 0 
#> out: 1, -1 

## Terminate after the first component, using a callback
f.out <- function(graph, data, extra) {
  data["vid"] == 1
}
tmp <- dfs(
  graph = make_tree(10) %du% make_tree(10),
  root = 1,
  out.callback = f.out
)
```
