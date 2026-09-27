# Theoretical maximum for closeness centralization

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_clo_tmax(graph = NULL, nodes = 0, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- mode:

  This is the same as the `mode` argument of
  [`closeness()`](https://r.igraph.org/reference/closeness.md). Ignored
  if an undirected graph is given.

## Value

Real scalar, the theoretical maximum (unnormalized) graph closeness
centrality score for graphs with given order and other parameters.

## Related documentation in the C library

[`centralization_closeness_tmax()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_closeness_tmax)

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_clo(g, normalized = FALSE)$centralization %>%
  `/`(centr_clo_tmax(g))
#> [1] NaN
centr_clo(g, normalized = TRUE)$centralization
#> [1] NaN
```
