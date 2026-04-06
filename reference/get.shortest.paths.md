# Shortest (directed or undirected) paths between vertices

**\[deprecated\]**

`get.shortest.paths()` was renamed to
[`shortest_paths()`](https://r.igraph.org/reference/distances.md) to
create a more consistent API.

## Usage

``` r
get.shortest.paths(
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
```

## Arguments

- graph:

  The graph to work on.

- from:

  Numeric constant, the vertex from or to the shortest paths will be
  calculated. Note that right now this is not a vector of vertex ids,
  but only a single vertex.

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
