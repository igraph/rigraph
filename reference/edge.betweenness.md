# Vertex and edge betweenness centrality

**\[deprecated\]**

`edge.betweenness()` was renamed to
[`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md) to
create a more consistent API.

## Usage

``` r
edge.betweenness(
  graph,
  e = E(graph),
  directed = TRUE,
  weights = NULL,
  cutoff = -1
)
```

## Arguments

- graph:

  The graph to analyze.

- e:

  The edges for which the edge betweenness will be calculated.

- directed:

  Logical, whether directed paths should be considered while determining
  the shortest paths.

- weights:

  Optional positive weight vector for calculating weighted betweenness.
  If the graph has a `weight` edge attribute, then this is used by
  default. Weights are used to calculate weighted shortest paths, so
  they are interpreted as distances.

- cutoff:

  The maximum shortest path length to consider when calculating
  betweenness. If negative, then there is no such limit.

## Related documentation in the C library

[`edge_betweenness_cutoff()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_edge_betweenness_cutoff),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
