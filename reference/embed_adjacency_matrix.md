# Spectral Embedding of Adjacency Matrices

Spectral decomposition of the adjacency matrices of graphs.

## Usage

``` r
embed_adjacency_matrix(
  graph,
  no,
  weights = NULL,
  which = c("lm", "la", "sa"),
  scaled = TRUE,
  cvec = strength(graph, weights = weights)/(vcount(graph) - 1),
  options = arpack_defaults()
)
```

## Arguments

- graph:

  The input graph, directed or undirected.

- no:

  An integer scalar. This value is the embedding dimension of the
  spectral embedding. Should be smaller than the number of vertices. The
  largest `no`-dimensional non-zero singular values are used for the
  spectral embedding.

- weights:

  Optional positive weight vector for calculating a weighted embedding.
  If the graph has a `weight` edge attribute, then this is used by
  default. In a weighted embedding, the edge weights are used instead of
  the binary adjacencny matrix.

- which:

  Which eigenvalues (or singular values, for directed graphs) to use.
  ‘lm’ means the ones with the largest magnitude, ‘la’ is the ones
  (algebraic) largest, and ‘sa’ is the (algebraic) smallest eigenvalues.
  The default is ‘lm’. Note that for directed graphs ‘la’ and ‘lm’ are
  the equivalent, because the singular values are used for the ordering.

- scaled:

  Logical scalar, if `FALSE`, then \\U\\ and \\V\\ are returned instead
  of \\X\\ and \\Y\\.

- cvec:

  A numeric vector, its length is the number vertices in the graph. This
  vector is added to the diagonal of the adjacency matrix.

- options:

  A named list containing the parameters for the SVD computation
  algorithm in ARPACK. By default, the list of values is assigned the
  values given by
  [`arpack_defaults()`](https://r.igraph.org/reference/arpack.md).

## Value

A list containing with entries:

- X:

  Estimated latent positions, an `n` times `no` matrix, `n` is the
  number of vertices.

- Y:

  `NULL` for undirected graphs, the second half of the latent positions
  for directed graphs, an `n` times `no` matrix, `n` is the number of
  vertices.

- D:

  The eigenvalues (for undirected graphs) or the singular values (for
  directed graphs) calculated by the algorithm.

- options:

  A named list, information about the underlying ARPACK computation. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for the
  details.

## Details

This function computes a `no`-dimensional Euclidean representation of
the graph based on its adjacency matrix, \\A\\. This representation is
computed via the singular value decomposition of the adjacency matrix,
\\A=UDV^T\\.In the case, where the graph is a random dot product graph
generated using latent position vectors in \\R^{no}\\ for each vertex,
the embedding will provide an estimate of these latent vectors.

For undirected graphs the latent positions are calculated as
\\X=U^{no}D^{1/2}\\, where \\U^{no}\\ equals to the first `no` columns
of \\U\\, and \\D^{1/2}\\ is a diagonal matrix containing the top `no`
singular values on the diagonal.

For directed graphs the embedding is defined as the pair
\\X=U^{no}D^{1/2}\\ and \\Y=V^{no}D^{1/2}\\. (For undirected graphs
\\U=V\\, so it is enough to keep one of them.)

## Related documentation in the C library

[`adjacency_spectral_embedding()`](https://igraph.org/c/html/latest/igraph-Embedding.html#igraph_adjacency_spectral_embedding),
[[`strength()`](https://r.igraph.org/reference/strength.md)](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_strength),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## References

Sussman, D.L., Tang, M., Fishkind, D.E., Priebe, C.E. A Consistent
Adjacency Spectral Embedding for Stochastic Blockmodel Graphs, *Journal
of the American Statistical Association*, Vol. 107(499), 2012

## See also

[`sample_dot_product()`](https://r.igraph.org/reference/sample_dot_product.md)

Other embedding:
[`dim_select()`](https://r.igraph.org/reference/dim_select.md),
[`embed_laplacian_matrix()`](https://r.igraph.org/reference/embed_laplacian_matrix.md)

## Examples

``` r
## A small graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
RDP <- sample_dot_product(lpvs)
embed <- embed_adjacency_matrix(RDP, 5)
```
