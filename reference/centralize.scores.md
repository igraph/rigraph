# Centralization of a graph

**\[deprecated\]**

`centralize.scores()` was renamed to
[`centralize()`](https://r.igraph.org/reference/centralize.md) to create
a more consistent API.

## Usage

``` r
centralize.scores(scores, theoretical.max = 0, normalized = TRUE)
```

## Arguments

- scores:

  The vertex level centrality scores.

- theoretical.max:

  Real scalar. The graph-level centralization measure of the most
  centralized graph with the same number of vertices as the graph under
  study. This is only used if the `normalized` argument is set to
  `TRUE`.

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the supplied theoretical maximum.

## Related documentation in the C library

[[`centralization()`](https://r.igraph.org/reference/centralize.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization)
