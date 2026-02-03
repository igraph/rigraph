# Neighborhood of graph vertices

**\[deprecated\]**

`graph.neighborhood()` was renamed to
[`make_ego_graph()`](https://r.igraph.org/reference/ego.md) to create a
more consistent API.

## Usage

``` r
graph.neighborhood(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)
```

## Arguments

- graph:

  The input graph.

- order:

  Integer giving the order of the neighborhood. Negative values indicate
  an infinite order.

- nodes:

  The vertices for which the calculation is performed.

- mode:

  Character constant, it specifies how to use the direction of the edges
  if a directed graph is analyzed. For ‘out’ only the outgoing edges are
  followed, so all vertices reachable from the source vertex in at most
  `order` steps are counted. For ‘"in"’ all vertices from which the
  source vertex is reachable in at most `order` steps are counted.
  ‘"all"’ ignores the direction of the edges. This argument is ignored
  for undirected graphs.

- mindist:

  The minimum distance to include the vertex in the result.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
