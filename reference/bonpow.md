# Find Bonacich Power Centrality Scores of Network Positions

**\[deprecated\]**

`bonpow()` was renamed to
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md)
to create a more consistent API.

## Usage

``` r
bonpow(
  graph,
  nodes = V(graph),
  loops = FALSE,
  exponent = 1,
  rescale = FALSE,
  tol = 1e-07,
  sparse = TRUE
)
```

## Arguments

- graph:

  the input graph.

- nodes:

  vertex sequence indicating which vertices are to be included in the
  calculation. By default, all vertices are included.

- loops:

  boolean indicating whether or not the diagonal should be treated as
  valid data. Set this true if and only if the data can contain loops.
  `loops` is `FALSE` by default.

- exponent:

  exponent (decay rate) for the Bonacich power centrality score; can be
  negative

- rescale:

  if true, centrality scores are rescaled such that they sum to 1.

- tol:

  tolerance for near-singularities during matrix inversion (see
  [`solve()`](https://rdrr.io/pkg/Matrix/man/solve-methods.html))

- sparse:

  Logical scalar, whether to use sparse matrices for the calculation.
  The ‘Matrix’ package is required for sparse matrix support

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[[`degree()`](https://r.igraph.org/reference/degree.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_degree),
[`get_adjacency()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency),
[`get_adjacency_sparse()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_adjacency_sparse),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
