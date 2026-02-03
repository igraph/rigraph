# Centralization of a graph

Centralization is a method for creating a graph level centralization
measure from the centrality scores of the vertices.

## Usage

``` r
centralize(scores, theoretical.max = 0, normalized = TRUE)
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

## Value

A real scalar, the centralization of the graph from which `scores` were
derived.

## Details

Centralization is a general method for calculating a graph-level
centrality score based on node-level centrality measure. The formula for
this is \$\$C(G)=\sum_v (\max_w c_w - c_v),\$\$ where \\c_v\\ is the
centrality of vertex \\v\\.

The graph-level centralization measure can be normalized by dividing by
the maximum theoretical score for a graph with the same number of
vertices, using the same parameters, e.g. directedness, whether we
consider loop edges, etc.

For degree, closeness and betweenness the most centralized structure is
some version of the star graph, in-star, out-star or undirected star.

For eigenvector centrality the most centralized structure is the graph
with a single edge (and potentially many isolates).

`centralize()` implements general centralization formula to calculate a
graph-level score from vertex-level scores.

## Related documentation in the C library

[`centralization()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_centralization)

## References

Freeman, L.C. (1979). Centrality in Social Networks I: Conceptual
Clarification. *Social Networks* 1, 215–239.

Wasserman, S., and Faust, K. (1994). *Social Network Analysis: Methods
and Applications.* Cambridge University Press.

## See also

Other centralization related:
[`centr_betw()`](https://r.igraph.org/reference/centr_betw.md),
[`centr_betw_tmax()`](https://r.igraph.org/reference/centr_betw_tmax.md),
[`centr_clo()`](https://r.igraph.org/reference/centr_clo.md),
[`centr_clo_tmax()`](https://r.igraph.org/reference/centr_clo_tmax.md),
[`centr_degree()`](https://r.igraph.org/reference/centr_degree.md),
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md),
[`centr_eigen()`](https://r.igraph.org/reference/centr_eigen.md),
[`centr_eigen_tmax()`](https://r.igraph.org/reference/centr_eigen_tmax.md)

## Examples

``` r
# A BA graph is quite centralized
g <- sample_pa(1000, m = 4)
centr_degree(g)$centralization
#> [1] 0.1763625
centr_clo(g, mode = "all")$centralization
#> [1] 0.4347504
centr_eigen(g, directed = FALSE)$centralization
#> [1] 0.9460374

# Calculate centralization from pre-computed scores
deg <- degree(g)
tmax <- centr_degree_tmax(g, loops = FALSE)
centralize(deg, tmax)
#> [1] 0.1765393

# The most centralized graph according to eigenvector centrality
g0 <- make_graph(c(2, 1), n = 10, dir = FALSE)
g1 <- make_star(10, mode = "undirected")
centr_eigen(g0)$centralization
#> [1] 1
centr_eigen(g1)$centralization
#> [1] 0.75
```
