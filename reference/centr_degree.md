# Centralize a graph according to the degrees of vertices

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_degree(
  graph,
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  normalized = TRUE
)
```

## Arguments

- graph:

  The input graph.

- mode:

  This is the same as the `mode` argument of
  [`degree()`](https://r.igraph.org/reference/degree.md).

- loops:

  Logical scalar, whether to consider loops edges when calculating the
  degree.

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

[`centralization_degree()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization_degree)

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
#> [1] 0.1753605
centr_clo(g, mode = "all")$centralization
#> [1] 0.4440289
centr_betw(g, directed = FALSE)$centralization
#> [1] 0.2695826
centr_eigen(g, directed = FALSE)$centralization
#> [1] 0.9468208
```
