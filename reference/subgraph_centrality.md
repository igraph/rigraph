# Find subgraph centrality scores of network positions

Subgraph centrality of a vertex measures the number of subgraphs a
vertex participates in, weighting them according to their size.

## Usage

``` r
subgraph_centrality(graph, diag = FALSE)
```

## Arguments

- graph:

  The input graph. It will be treated as undirected.

- diag:

  Boolean scalar, whether to include the diagonal of the adjacency
  matrix in the analysis. Giving `FALSE` here effectively eliminates the
  loops edges from the graph before the calculation.

## Value

A numeric vector, the subgraph centrality scores of the vertices.

## Details

The subgraph centrality of a vertex is defined as the number of closed
walks originating at the vertex, where longer walks are downweighted by
the factorial of their length.

Currently the calculation is performed by explicitly calculating all
eigenvalues and eigenvectors of the adjacency matrix of the graph. This
effectively means that the measure can only be calculated for small
graphs.

## References

Ernesto Estrada, Juan A. Rodriguez-Velazquez: Subgraph centrality in
Complex Networks. *Physical Review E* 71, 056103 (2005).

## See also

[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md)

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com> based on the Matlab code by
Ernesto Estrada

## Examples

``` r
g <- sample_pa(100, m = 4, dir = FALSE)
sc <- subgraph_centrality(g)
cor(degree(g), sc)
#> [1] 0.9442558
```
