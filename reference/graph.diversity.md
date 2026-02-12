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
