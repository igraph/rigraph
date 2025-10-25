# Neighborhood of graph vertices

**\[deprecated\]**

`connect.neighborhood()` was renamed to
[`connect()`](https://r.igraph.org/reference/ego.md) to create a more
consistent API.

## Usage

``` r
connect.neighborhood(graph, order, mode = c("all", "out", "in", "total"))
```

## Arguments

- graph:

  The input graph.

- order:

  Integer giving the order of the neighborhood. Negative values indicate
  an infinite order.

- mode:

  Character constant, it specifies how to use the direction of the edges
  if a directed graph is analyzed. For ‘out’ only the outgoing edges are
  followed, so all vertices reachable from the source vertex in at most
  `order` steps are counted. For ‘"in"’ all vertices from which the
  source vertex is reachable in at most `order` steps are counted.
  ‘"all"’ ignores the direction of the edges. This argument is ignored
  for undirected graphs.
