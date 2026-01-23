# Theoretical maximum for eigenvector centralization

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_eigen_tmax(
  graph = NULL,
  nodes = 0,
  directed = FALSE,
  scale = deprecated()
)
```

## Arguments

- graph:

  The input graph. It can also be `NULL`, if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- directed:

  logical scalar, whether to consider edge directions during the
  calculation. Ignored in undirected graphs.

- scale:

  **\[deprecated\]** Ignored. Computing eigenvector centralization
  requires normalized eigenvector centrality scores.

## Value

Real scalar, the theoretical maximum (unnormalized) graph eigenvector
centrality score for graphs with given vertex count and other
parameters.

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Related documentation in the C library

[`centralization_eigenvector_centrality_tmax()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization_eigenvector_centrality_tmax).

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_eigen(g, normalized = FALSE)$centralization %>%
  `/`(centr_eigen_tmax(g))
#> [1] 0.9468524
centr_eigen(g, normalized = TRUE)$centralization
#> [1] 0.9468524
```
