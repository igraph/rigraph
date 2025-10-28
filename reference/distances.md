# Shortest (directed or undirected) paths between vertices

`distances()` calculates the length of all the shortest paths from or to
the vertices in the network. `shortest_paths()` calculates one shortest
path (the path itself, and not just its length) from or to the given
vertex.

## Usage

``` r
distance_table(graph, directed = TRUE)

mean_distance(
  graph,
  weights = NULL,
  directed = TRUE,
  unconnected = TRUE,
  details = FALSE
)

distances(
  graph,
  v = V(graph),
  to = V(graph),
  mode = c("all", "out", "in"),
  weights = NULL,
  algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford", "johnson",
    "floyd-warshall")
)

shortest_paths(
  graph,
  from,
  to = V(graph),
  mode = c("out", "all", "in"),
  weights = NULL,
  output = c("vpath", "epath", "both"),
  predecessors = FALSE,
  inbound.edges = FALSE,
  algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford")
)

all_shortest_paths(
  graph,
  from,
  to = V(graph),
  mode = c("out", "all", "in"),
  weights = NULL
)
```

## Arguments

- graph:

  The graph to work on.

- directed:

  Whether to consider directed paths in directed graphs, this argument
  is ignored for undirected graphs.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- unconnected:

  What to do if the graph is unconnected (not strongly connected if
  directed paths are considered). If TRUE, only the lengths of the
  existing paths are considered and averaged; if FALSE, the length of
  the missing paths are considered as having infinite length, making the
  mean distance infinite as well.

- details:

  Whether to provide additional details in the result. Functions
  accepting this argument (like `mean_distance()`) return additional
  information like the number of disconnected vertex pairs in the result
  when this parameter is set to `TRUE`.

- v:

  Numeric vector, the vertices from which the shortest paths will be
  calculated.

- to:

  Numeric vector, the vertices to which the shortest paths will be
  calculated. By default it includes all vertices. Note that for
  `distances()` every vertex must be included here at most once. (This
  is not required for `shortest_paths()`.

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the graph is treated as
  undirected, i.e. edge directions are not taken into account. This
  argument is ignored for undirected graphs.

- algorithm:

  Which algorithm to use for the calculation. By default igraph tries to
  select the fastest suitable algorithm. If there are no weights, then
  an unweighted breadth-first search is used, otherwise if all weights
  are positive, then Dijkstra's algorithm is used. If there are negative
  weights and we do the calculation for more than 100 sources, then
  Johnson's algorithm is used. Otherwise the Bellman-Ford algorithm is
  used. You can override igraph's choice by explicitly giving this
  parameter. Note that the igraph C core might still override your
  choice in obvious cases, i.e. if there are no edge weights, then the
  unweighted algorithm will be used, regardless of this argument.

- from:

  Numeric constant, the vertex from or to the shortest paths will be
  calculated. Note that right now this is not a vector of vertex ids,
  but only a single vertex.

- output:

  Character scalar, defines how to report the shortest paths. “vpath”
  means that the vertices along the paths are reported, this form was
  used prior to igraph version 0.6. “epath” means that the edges along
  the paths are reported. “both” means that both forms are returned, in
  a named list with components “vpath” and “epath”.

- predecessors:

  Logical scalar, whether to return the predecessor vertex for each
  vertex. The predecessor of vertex `i` in the tree is the vertex from
  which vertex `i` was reached. The predecessor of the start vertex (in
  the `from` argument) is itself by definition. If the predecessor is
  zero, it means that the given vertex was not reached from the source
  during the search. Note that the search terminates if all the vertices
  in `to` are reached.

- inbound.edges:

  Logical scalar, whether to return the inbound edge for each vertex.
  The inbound edge of vertex `i` in the tree is the edge via which
  vertex `i` was reached. The start vertex and vertices that were not
  reached during the search will have zero in the corresponding entry of
  the vector. Note that the search terminates if all the vertices in
  `to` are reached.

## Value

For `distances()` a numeric matrix with `length(to)` columns and
`length(v)` rows. The shortest path length from a vertex to itself is
always zero. For unreachable vertices `Inf` is included.

For `shortest_paths()` a named list with four entries is returned:

- vpath:

  This itself is a list, of length `length(to)`; list element `i`
  contains the vertex ids on the path from vertex `from` to vertex
  `to[i]` (or the other way for directed graphs depending on the `mode`
  argument). The vector also contains `from` and `i` as the first and
  last elements. If `from` is the same as `i` then it is only included
  once. If there is no path between two vertices then a numeric vector
  of length zero is returned as the list element. If this output is not
  requested in the `output` argument, then it will be `NULL`.

- epath:

  This is a list similar to `vpath`, but the vectors of the list contain
  the edge ids along the shortest paths, instead of the vertex ids. This
  entry is set to `NULL` if it is not requested in the `output`
  argument.

- predecessors:

  Numeric vector, the predecessor of each vertex in the `to` argument,
  or `NULL` if it was not requested.

- inbound_edges:

  Numeric vector, the inbound edge for each vertex, or `NULL`, if it was
  not requested.

For `all_shortest_paths()` a list is returned:

- vpaths:

  This is a list. Each list element contains the vertices of a shortest
  path from `from` to a vertex in `to`. The shortest paths to the same
  vertex are collected into consecutive elements of the list.

- epaths:

  This is a list similar to vpaths, but the vectors of the list contain
  the edge ids along the shortest paths, instead of the vertex ids.

- nrgeo:

  A vector in which each element is the number of shortest paths
  (geodesics) from `from` to the corresponding vertex in `to`.

- res:

  Deprecated

For `mean_distance()` a single number is returned if `details=FALSE`, or
a named list with two entries:

- `res`:

  the mean distance as a numeric scalar

- `unconnected`:

  the number of unconnected vertex pairs, also as a numeric scalar.

`distance_table()` returns a named list with two entries:

- `res`:

  a numeric vector, the histogram of distances

- `unconnected`:

  a numeric scalar, the number of pairs for which the first vertex is
  not reachable from the second. In undirected and directed graphs,
  unorderde and ordered pairs are considered, respectively. Therefore
  the sum of the two entries is always \\n(n-1)\\ for directed graphs
  and \\n(n-1)/2\\ for undirected graphs.

## Details

The shortest path, or geodesic between two pair of vertices is a path
with the minimal number of vertices. The functions documented in this
manual page all calculate shortest paths between vertex pairs.

`distances()` calculates the lengths of pairwise shortest paths from a
set of vertices (`from`) to another set of vertices (`to`). It uses
different algorithms, depending on the `algorithm` argument and the
`weight` edge attribute of the graph. The implemented algorithms are
breadth-first search (‘`unweighted`’), this only works for unweighted
graphs; the Dijkstra algorithm (‘`dijkstra`’), this works for graphs
with non-negative edge weights; the Bellman-Ford algorithm
(‘`bellman-ford`’); Johnson's algorithm (‘`johnson`’); and a faster
version of the Floyd-Warshall algorithm with expected quadratic running
time (‘`floyd-warshall`’). The latter three algorithms work with
arbitrary edge weights, but (naturally) only for graphs that don't have
a negative cycle. Note that a negative-weight edge in an undirected
graph implies such a cycle. Johnson's algorithm performs better than the
Bellman-Ford one when many source (and target) vertices are given, with
all-pairs shortest path length calculations being the typical use case.

igraph can choose automatically between algorithms, and chooses the most
efficient one that is appropriate for the supplied weights (if any). For
automatic algorithm selection, supply ‘`automatic`’ as the `algorithm`
argument. (This is also the default.)

`shortest_paths()` calculates a single shortest path (i.e. the path
itself, not just its length) between the source vertex given in `from`,
to the target vertices given in `to`. `shortest_paths()` uses
breadth-first search for unweighted graphs and Dijkstra's algorithm for
weighted graphs. The latter only works if the edge weights are
non-negative.

`all_shortest_paths()` calculates *all* shortest paths between pairs of
vertices, including several shortest paths of the same length. More
precisely, it computerd all shortest path starting at `from`, and ending
at any vertex given in `to`. It uses a breadth-first search for
unweighted graphs and Dijkstra's algorithm for weighted ones. The latter
only supports non-negative edge weights. Caution: in multigraphs, the
result size is exponentially large in the number of vertex pairs with
multiple edges between them.

`mean_distance()` calculates the average path length in a graph, by
calculating the shortest paths between all pairs of vertices (both ways
for directed graphs). It uses a breadth-first search for unweighted
graphs and Dijkstra's algorithm for weighted ones. The latter only
supports non-negative edge weights.

`distance_table()` calculates a histogram, by calculating the shortest
path length between each pair of vertices. For directed graphs both
directions are considered, so every pair of vertices appears twice in
the histogram.

## References

West, D.B. (1996). *Introduction to Graph Theory.* Upper Saddle River,
N.J.: Prentice Hall.

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
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

Other paths:
[`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md),
[`diameter()`](https://r.igraph.org/reference/diameter.md),
[`eccentricity()`](https://r.igraph.org/reference/eccentricity.md),
[`graph_center()`](https://r.igraph.org/reference/graph_center.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`path_length_hist()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_path_length_hist),
[`average_path_length_dijkstra()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_average_path_length_dijkstra).

## Examples

``` r
g <- make_ring(10)
distances(g)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0    1    2    3    4    5    4    3    2     1
#>  [2,]    1    0    1    2    3    4    5    4    3     2
#>  [3,]    2    1    0    1    2    3    4    5    4     3
#>  [4,]    3    2    1    0    1    2    3    4    5     4
#>  [5,]    4    3    2    1    0    1    2    3    4     5
#>  [6,]    5    4    3    2    1    0    1    2    3     4
#>  [7,]    4    5    4    3    2    1    0    1    2     3
#>  [8,]    3    4    5    4    3    2    1    0    1     2
#>  [9,]    2    3    4    5    4    3    2    1    0     1
#> [10,]    1    2    3    4    5    4    3    2    1     0
shortest_paths(g, 5)
#> $vpath
#> $vpath[[1]]
#> + 5/10 vertices, from 2666aa8:
#> [1] 5 4 3 2 1
#> 
#> $vpath[[2]]
#> + 4/10 vertices, from 2666aa8:
#> [1] 5 4 3 2
#> 
#> $vpath[[3]]
#> + 3/10 vertices, from 2666aa8:
#> [1] 5 4 3
#> 
#> $vpath[[4]]
#> + 2/10 vertices, from 2666aa8:
#> [1] 5 4
#> 
#> $vpath[[5]]
#> + 1/10 vertex, from 2666aa8:
#> [1] 5
#> 
#> $vpath[[6]]
#> + 2/10 vertices, from 2666aa8:
#> [1] 5 6
#> 
#> $vpath[[7]]
#> + 3/10 vertices, from 2666aa8:
#> [1] 5 6 7
#> 
#> $vpath[[8]]
#> + 4/10 vertices, from 2666aa8:
#> [1] 5 6 7 8
#> 
#> $vpath[[9]]
#> + 5/10 vertices, from 2666aa8:
#> [1] 5 6 7 8 9
#> 
#> $vpath[[10]]
#> + 6/10 vertices, from 2666aa8:
#> [1]  5  4  3  2  1 10
#> 
#> 
#> $epath
#> NULL
#> 
#> $predecessors
#> NULL
#> 
#> $inbound_edges
#> NULL
#> 
all_shortest_paths(g, 1, 6:8)
#> $vpaths
#> $vpaths[[1]]
#> + 6/10 vertices, from 2666aa8:
#> [1]  1 10  9  8  7  6
#> 
#> $vpaths[[2]]
#> + 6/10 vertices, from 2666aa8:
#> [1] 1 2 3 4 5 6
#> 
#> $vpaths[[3]]
#> + 5/10 vertices, from 2666aa8:
#> [1]  1 10  9  8  7
#> 
#> $vpaths[[4]]
#> + 4/10 vertices, from 2666aa8:
#> [1]  1 10  9  8
#> 
#> 
#> $epaths
#> $epaths[[1]]
#> + 5/10 edges from 2666aa8:
#> [1] 1--10 9--10 8-- 9 7-- 8 6-- 7
#> 
#> $epaths[[2]]
#> + 5/10 edges from 2666aa8:
#> [1] 1--2 2--3 3--4 4--5 5--6
#> 
#> $epaths[[3]]
#> + 4/10 edges from 2666aa8:
#> [1] 1--10 9--10 8-- 9 7-- 8
#> 
#> $epaths[[4]]
#> + 3/10 edges from 2666aa8:
#> [1] 1--10 9--10 8-- 9
#> 
#> 
#> $nrgeo
#>  [1] 1 1 1 1 1 2 1 1 1 1
#> 
#> $res
#> $res[[1]]
#> + 6/10 vertices, from 2666aa8:
#> [1]  1 10  9  8  7  6
#> 
#> $res[[2]]
#> + 6/10 vertices, from 2666aa8:
#> [1] 1 2 3 4 5 6
#> 
#> $res[[3]]
#> + 5/10 vertices, from 2666aa8:
#> [1]  1 10  9  8  7
#> 
#> $res[[4]]
#> + 4/10 vertices, from 2666aa8:
#> [1]  1 10  9  8
#> 
#> 
mean_distance(g)
#> [1] 2.777778
## Weighted shortest paths
el <- matrix(
  ncol = 3, byrow = TRUE,
  c(
    1, 2, 0,
    1, 3, 2,
    1, 4, 1,
    2, 3, 0,
    2, 5, 5,
    2, 6, 2,
    3, 2, 1,
    3, 4, 1,
    3, 7, 1,
    4, 3, 0,
    4, 7, 2,
    5, 6, 2,
    5, 8, 8,
    6, 3, 2,
    6, 7, 1,
    6, 9, 1,
    6, 10, 3,
    8, 6, 1,
    8, 9, 1,
    9, 10, 4
  )
)
g2 <- add_edges(make_empty_graph(10), t(el[, 1:2]), weight = el[, 3])
distances(g2, mode = "out")
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    0    0    0    1    5    2    1   13    3     5
#>  [2,]  Inf    0    0    1    5    2    1   13    3     5
#>  [3,]  Inf    1    0    1    6    3    1   14    4     6
#>  [4,]  Inf    1    0    0    6    3    1   14    4     6
#>  [5,]  Inf    5    4    5    0    2    3    8    3     5
#>  [6,]  Inf    3    2    3    8    0    1   16    1     3
#>  [7,]  Inf  Inf  Inf  Inf  Inf  Inf    0  Inf  Inf   Inf
#>  [8,]  Inf    4    3    4    9    1    2    0    1     4
#>  [9,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf    0     4
#> [10,]  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf  Inf     0
```
