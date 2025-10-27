# Centralize a graph according to the closeness of vertices

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_clo(graph, mode = c("out", "in", "all", "total"), normalized = TRUE)
```

## Arguments

- graph:

  The input graph.

- mode:

  This is the same as the `mode` argument of
  [`closeness()`](https://r.igraph.org/reference/closeness.md).

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

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Related documentation in the C library

[`centralization_closeness()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization_closeness).

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
#> [1] 0.1969036
centr_clo(g, mode = "all")$centralization
#> [1] 0.4825447
centr_betw(g, directed = FALSE)$centralization
#> [1] 0.3384434
centr_eigen(g, directed = FALSE)$centralization
#> [1] 0.954033
```
