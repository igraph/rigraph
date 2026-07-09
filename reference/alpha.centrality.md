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

  One of the following:

  - `NULL` (default): use the `weight` edge attribute if the graph has
    one, otherwise return a traditional (unweighted) adjacency matrix.

  - `NA`: explicitly unweighted, ignoring any `weight` edge attribute.

  - A numeric or logical vector of length
    [`ecount()`](https://r.igraph.org/reference/gsize.md): use these
    values directly as edge weights.

  - A character scalar: the name of an edge attribute whose values are
    used as weights. The attribute must be numeric or logical.

  If multiple edges share endpoints, the value of an arbitrarily chosen
  edge is included in the matrix.

- tol:

  Tolerance for near-singularities during matrix inversion, see
  [`solve()`](https://rdrr.io/r/base/solve.html).

- sparse:

  Logical, whether to use sparse matrices for the calculation. The
  ‘Matrix’ package is required for sparse matrix support

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`simplify()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`get_adjacency()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[`is_simple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_simple),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
