# Shortest (directed or undirected) paths between vertices

**\[deprecated\]**

`get.all.shortest.paths()` was renamed to
[`all_shortest_paths()`](https://r.igraph.org/reference/distances.md) to
create a more consistent API.

## Usage

``` r
get.all.shortest.paths(
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
