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

[`diversity`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_diversity),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
