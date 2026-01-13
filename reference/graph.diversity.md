# Graph diversity

**\[deprecated\]**

`graph.diversity()` was renamed to
[`diversity()`](https://r.igraph.org/reference/diversity.md) to create a
more consistent API.

## Usage

``` r
graph.diversity(graph, weights = NULL, vids = V(graph))
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

- weights:

  `NULL`, or the vector of edge weights to use for the computation. If
  `NULL`, then the ‘weight’ attibute is used. Note that this measure is
  not defined for unweighted graphs.

- vids:

  The vertex ids for which to calculate the measure.

## Related documentation in the C library

[[`diversity()`](https://r.igraph.org/reference/diversity.md)](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_diversity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
