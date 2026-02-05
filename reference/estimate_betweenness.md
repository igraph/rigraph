# Deprecated version of `betweenness()`

**\[deprecated\]**

Use [`betweenness()`](https://r.igraph.org/reference/betweenness.md)
with the `cutoff` argument instead.

## Usage

``` r
estimate_betweenness(
  graph,
  vids = V(graph),
  directed = TRUE,
  cutoff,
  weights = NULL
)
```

## Arguments

- graph:

  The graph to analyze.

- vids:

  The vertices for which the vertex betweenness estimation will be
  calculated.

- directed:

  Logical, whether directed paths should be considered while determining
  the shortest paths.

- cutoff:

  The maximum shortest path length to consider when calculating
  betweenness. If negative, then there is no such limit.

- weights:

  Optional positive weight vector for calculating weighted betweenness.
  If the graph has a `weight` edge attribute, then this is used by
  default. Weights are used to calculate weighted shortest paths, so
  they are interpreted as distances.

## Related documentation in the C library

[`betweenness_cutoff()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_betweenness_cutoff),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
