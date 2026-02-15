# Find Bonacich alpha centrality scores of network positions

`alpha_centrality()` calculates the alpha centrality of some (or all)
vertices in a graph.

## Usage

``` r
alpha_centrality(
  graph,
  nodes = V(graph),
  alpha = 1,
  loops = FALSE,
  exo = 1,
  weights = NULL,
  tol = 1e-07,
  sparse = TRUE
)
```

## Arguments

- graph:

  The input graph, can be directed or undirected. In undirected graphs,
  edges are treated as if they were reciprocal directed ones.

- nodes:

  Vertex sequence, the vertices for which the alpha centrality values
  are returned. (For technical reasons they will be calculated for all
  vertices, anyway.)

- alpha:

  Parameter specifying the relative importance of endogenous versus
  exogenous factors in the determination of centrality. See details
  below.

- loops:

  Whether to eliminate loop edges from the graph before the calculation.

- exo:

  The exogenous factors, in most cases this is either a constant – the
  same factor for every node, or a vector giving the factor for every
  vertex. Note that too long vectors will be truncated and too short
  vectors will be replicated to match the number of vertices.

- weights:

  A character scalar that gives the name of the edge attribute to use in
  the adjacency matrix. If it is `NULL`, then the ‘weight’ edge
  attribute of the graph is used, if there is one. Otherwise, or if it
  is `NA`, then the calculation uses the standard adjacency matrix.

- tol:

  Tolerance for near-singularities during matrix inversion, see
  [`solve()`](https://rdrr.io/r/base/solve.html).

- sparse:

  Logical scalar, whether to use sparse matrices for the calculation.
  The ‘Matrix’ package is required for sparse matrix support

## Value

A numeric vector contaning the centrality scores for the selected
vertices.

## Details

The alpha centrality measure can be considered as a generalization of
eigenvector centrality to directed graphs. It was proposed by Bonacich
in 2001 (see reference below).

The alpha centrality of the vertices in a graph is defined as the
solution of the following matrix equation: \$\$x=\alpha A^T x+e,\$\$
where \\A\\ is the (not necessarily symmetric) adjacency matrix of the
graph, \\e\\ is the vector of exogenous sources of status of the
vertices and \\\alpha\\ is the relative importance of the endogenous
versus exogenous factors.

## Warning

Singular adjacency matrices cause problems for this algorithm, the
routine may fail is certain cases.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`simplify`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`get_adjacency`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Bonacich, P. and Lloyd, P. (2001). “Eigenvector-like measures of
centrality for asymmetric relations” *Social Networks*, 23, 191-201.

## See also

[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
and
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md)

Centrality measures
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
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# The examples from Bonacich's paper
g.1 <- make_graph(c(1, 3, 2, 3, 3, 4, 4, 5))
g.2 <- make_graph(c(2, 1, 3, 1, 4, 1, 5, 1))
g.3 <- make_graph(c(1, 2, 2, 3, 3, 4, 4, 1, 5, 1))
alpha_centrality(g.1)
#> [1] 1 1 3 4 5
alpha_centrality(g.2)
#> [1] 5 1 1 1 1
alpha_centrality(g.3, alpha = 0.5)
#> [1] 2.533333 2.266667 2.133333 2.066667 1.000000
```
