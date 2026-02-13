# Centralize a graph according to the betweenness of vertices

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_betw(graph, directed = TRUE, normalized = TRUE)
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

## Value

A named list with the following components:

- res:

  The node-level centrality scores.

- centralization:

  The graph level centrality index.

- theoretical_max:

  The maximum theoretical graph level centralization score for a graph
  with the given number of vertices, using the same parameters. If the
  `normalized` argument was `TRUE`, then the result was divided by this
  number.

## Related documentation in the C library

[`centralization_betweenness()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_betweenness)

## See also

Other centralization related:
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
#> [1] 0.1618335
centr_clo(g, mode = "all")$centralization
#> [1] 0.4288587
centr_betw(g, directed = FALSE)$centralization
#> [1] 0.2645597
centr_eigen(g, directed = FALSE)$centralization
#> [1] 0.948102
```
