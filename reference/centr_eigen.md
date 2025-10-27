# Centralize a graph according to the eigenvector centrality of vertices

See [`centralize()`](https://r.igraph.org/reference/centralize.md) for a
summary of graph centralization.

## Usage

``` r
centr_eigen(
  graph,
  directed = FALSE,
  scale = deprecated(),
  options = arpack_defaults(),
  normalized = TRUE
)
```

## Arguments

- graph:

  The input graph.

- directed:

  logical scalar, whether to use directed shortest paths for calculating
  eigenvector centrality.

- scale:

  **\[deprecated\]** Ignored. Computing eigenvector centralization
  requires normalized eigenvector centrality scores.

- options:

  This is passed to
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
  the options for the ARPACK eigensolver.

- normalized:

  Logical scalar. Whether to normalize the graph level centrality score
  by dividing by the theoretical maximum.

## Value

A named list with the following components:

- vector:

  The node-level centrality scores.

- value:

  The corresponding eigenvalue.

- options:

  ARPACK options, see the return value of
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
  for details.

- centralization:

  The graph level centrality index.

- theoretical_max:

  The same as above, the theoretical maximum centralization score for a
  graph with the same number of vertices.

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md),
[`centralize()`](https://r.igraph.org/reference/centralize.md)

## Related documentation in the C library

[`centralization_eigenvector_centrality()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_centralization_eigenvector_centrality).

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
#> [1] 0.1473045
centr_clo(g, mode = "all")$centralization
#> [1] 0.4057694
centr_betw(g, directed = FALSE)$centralization
#> [1] 0.2188419
centr_eigen(g, directed = FALSE)$centralization
#> [1] 0.9409572

# The most centralized graph according to eigenvector centrality
g0 <- make_graph(c(2, 1), n = 10, dir = FALSE)
g1 <- make_star(10, mode = "undirected")
centr_eigen(g0)$centralization
#> [1] 1
centr_eigen(g1)$centralization
#> [1] 0.75
```
