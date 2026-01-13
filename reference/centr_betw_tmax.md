# Theoretical maximum for betweenness centralization

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_betw_tmax(graph = NULL, nodes = 0, directed = TRUE)
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` and `directed` are
  both given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- directed:

  Logical scalar, whether to use directed shortest paths for calculating
  betweenness. Ignored if an undirected graph was given.

## Value

Real scalar, the theoretical maximum (unnormalized) graph betweenness
centrality score for graphs with given order and other parameters.

## Related documentation in the C library

[`centralization_betweenness_tmax()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization_betweenness_tmax)

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
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
centr_betw(g, normalized = FALSE)$centralization %>%
  `/`(centr_betw_tmax(g))
#> [1] 0.001284695
centr_betw(g, normalized = TRUE)$centralization
#> [1] 0.001284695
```
