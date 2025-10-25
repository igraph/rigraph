# Theoretical maximum for degree centralization

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_degree_tmax(
  graph = NULL,
  nodes = 0,
  mode = c("all", "out", "in", "total"),
  loops
)
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- mode:

  This is the same as the `mode` argument of
  [`degree()`](https://r.igraph.org/reference/degree.md). Ignored if
  `graph` is given and the graph is undirected.

- loops:

  Logical scalar, whether to consider loops edges when calculating the
  degree.

## Value

Real scalar, the theoretical maximum (unnormalized) graph degree
centrality score for graphs with given order and other parameters.

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g, normalized = FALSE)$centralization %>%
  `/`(centr_degree_tmax(g, loops = FALSE))
#> [1] 0.1459476
centr_degree(g, normalized = TRUE)$centralization
#> [1] 0.1458015
```
