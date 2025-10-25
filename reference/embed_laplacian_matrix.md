# Spectral Embedding of the Laplacian of a Graph

Spectral decomposition of Laplacian matrices of graphs.

## Usage

``` r
embed_laplacian_matrix(
  graph,
  no,
  weights = NULL,
  which = c("lm", "la", "sa"),
  type = c("default", "D-A", "DAD", "I-DAD", "OAP"),
  scaled = TRUE,
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
  default. For weighted embedding, edge weights are used instead of the
  binary adjacency matrix, and vertex strength (see
  [`strength()`](https://r.igraph.org/reference/strength.md)) is used
  instead of the degrees.

- which:

  Which eigenvalues (or singular values, for directed graphs) to use.
  ‘lm’ means the ones with the largest magnitude, ‘la’ is the ones
  (algebraic) largest, and ‘sa’ is the (algebraic) smallest eigenvalues.
  The default is ‘lm’. Note that for directed graphs ‘la’ and ‘lm’ are
  the equivalent, because the singular values are used for the ordering.

- type:

  The type of the Laplacian to use. Various definitions exist for the
  Laplacian of a graph, and one can choose between them with this
  argument.

  Possible values: `D-A` means \\D-A\\ where \\D\\ is the degree matrix
  and \\A\\ is the adjacency matrix; `DAD` means \\D^{1/2}\\ times \\A\\
  times \\D^{1/2}{D^1/2}\\, \\D^{1/2}\\ is the inverse of the square
  root of the degree matrix; `I-DAD` means \\I-D^{1/2}\\, where \\I\\ is
  the identity matrix. `OAP` is \\O^{1/2}AP^{1/2}\\, where \\O^{1/2}\\
  is the inverse of the square root of the out-degree matrix and
  \\P^{1/2}\\ is the same for the in-degree matrix.

  `OAP` is not defined for undirected graphs, and is the only defined
  type for directed graphs.

  The default (i.e. type `default`) is to use `D-A` for undirected
  graphs and `OAP` for directed graphs.

- scaled:

  Logical scalar, if `FALSE`, then \\U\\ and \\V\\ are returned instead
  of \\X\\ and \\Y\\.

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
the graph based on its Laplacian matrix, \\L\\. This representation is
computed via the singular value decomposition of the Laplacian matrix.

They are essentially doing the same as
[`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md),
but work on the Laplacian matrix, instead of the adjacency matrix.

## References

Sussman, D.L., Tang, M., Fishkind, D.E., Priebe, C.E. A Consistent
Adjacency Spectral Embedding for Stochastic Blockmodel Graphs, *Journal
of the American Statistical Association*, Vol. 107(499), 2012

## See also

[`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md),
[`sample_dot_product()`](https://r.igraph.org/reference/sample_dot_product.md)

Other embedding:
[`dim_select()`](https://r.igraph.org/reference/dim_select.md),
[`embed_adjacency_matrix()`](https://r.igraph.org/reference/embed_adjacency_matrix.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`laplacian_spectral_embedding()`](https://igraph.org/c/html/latest/igraph-Embedding.html#igraph_laplacian_spectral_embedding).

## Examples

``` r
## A small graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
RDP <- sample_dot_product(lpvs)
embed <- embed_laplacian_matrix(RDP, 5)
```
