# Deprecated version of `closeness()`

**\[deprecated\]**

Use [`closeness()`](https://r.igraph.org/reference/closeness.md) with
the `cutoff` argument instead.

## Usage

``` r
estimate_closeness(
  graph,
  vids = V(graph),
  mode = c("out", "in", "all", "total"),
  cutoff,
  weights = NULL,
  normalized = FALSE
)
```

## Arguments

- graph:

  The graph to analyze.

- vids:

  The vertices for which closeness will be calculated.

- mode:

  Character string, defined the types of the paths used for measuring
  the distance in directed graphs. “in” measures the paths *to* a
  vertex, “out” measures paths *from* a vertex, *all* uses undirected
  paths. This argument is ignored for undirected graphs.

- cutoff:

  The maximum path length to consider when calculating the closeness. If
  zero or negative then there is no such limit.

- weights:

  Optional positive weight vector for calculating weighted closeness. If
  the graph has a `weight` edge attribute, then this is used by default.
  Weights are used for calculating weighted shortest paths, so they are
  interpreted as distances.

- normalized:

  Logical scalar, whether to calculate the normalized closeness, i.e.
  the inverse average distance to all reachable vertices. The
  non-normalized closeness is the inverse of the sum of distances to all
  reachable vertices.

## Related documentation in the C library

[`closeness_cutoff()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_closeness_cutoff),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
