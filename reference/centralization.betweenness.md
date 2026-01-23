# Centralize a graph according to the betweenness of vertices

**\[deprecated\]**

`centralization.betweenness()` was renamed to
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md) to create
a more consistent API.

## Usage

``` r
centralization.betweenness(graph, directed = TRUE, normalized = TRUE)
```

## Arguments

- graph:

  The input graph.

- directed:

  logical scalar, whether to use directed shortest paths for calculating
  betweenness.

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the theoretical maximum.
