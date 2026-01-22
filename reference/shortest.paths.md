# Shortest (directed or undirected) paths between vertices

**\[deprecated\]**

`shortest.paths()` was renamed to
[`distances()`](https://r.igraph.org/reference/distances.md) to create a
more consistent API.

## Usage

``` r
shortest.paths(
  graph,
  v = V(graph),
  to = V(graph),
  mode = c("all", "out", "in"),
  weights = NULL,
  algorithm = c("automatic", "unweighted", "dijkstra", "bellman-ford", "johnson")
)
```

## Arguments

- graph:

  The graph to work on.

- v:

  Numeric vector, the vertices from which the shortest paths will be
  calculated.

- to:

  Numeric vector, the vertices to which the shortest paths will be
  calculated. By default it includes all vertices. Note that for
  [`distances()`](https://r.igraph.org/reference/distances.md) every
  vertex must be included here at most once. (This is not required for
  [`shortest_paths()`](https://r.igraph.org/reference/distances.md).

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the graph is treated as
  undirected, i.e. edge directions are not taken into account. This
  argument is ignored for undirected graphs.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

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

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
