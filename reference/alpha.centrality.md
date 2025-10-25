# Find Bonacich alpha centrality scores of network positions

**\[deprecated\]**

`alpha.centrality()` was renamed to
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md)
to create a more consistent API.

## Usage

``` r
alpha.centrality(
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
