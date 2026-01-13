# Eigenvalues and eigenvectors of the adjacency matrix of a graph

Calculate selected eigenvalues and eigenvectors of a (supposedly sparse)
graph.

## Usage

``` r
spectrum(
  graph,
  algorithm = c("arpack", "auto", "lapack", "comp_auto", "comp_lapack", "comp_arpack"),
  which = list(),
  options = arpack_defaults()
)
```

## Arguments

- graph:

  The input graph, can be directed or undirected.

- algorithm:

  The algorithm to use. Currently only `arpack` is implemented, which
  uses the ARPACK solver. See also
  [`arpack()`](https://r.igraph.org/reference/arpack.md).

- which:

  A list to specify which eigenvalues and eigenvectors to calculate. By
  default the leading (i.e. largest magnitude) eigenvalue and the
  corresponding eigenvector is calculated.

- options:

  Options for the ARPACK solver. See
  [`arpack_defaults()`](https://r.igraph.org/reference/arpack.md).

## Value

Depends on the algorithm used.

For `arpack` a list with three entries is returned:

- options:

  See the return value for
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for a complete
  description.

- values:

  Numeric vector, the eigenvalues.

- vectors:

  Numeric matrix, with the eigenvectors as columns.

## Details

The `which` argument is a list and it specifies which eigenvalues and
corresponding eigenvectors to calculate: There are eight options:

1.  Eigenvalues with the largest magnitude. Set `pos` to `LM`, and
    `howmany` to the number of eigenvalues you want.

2.  Eigenvalues with the smallest magnitude. Set `pos` to `SM` and
    `howmany` to the number of eigenvalues you want.

3.  Largest eigenvalues. Set `pos` to `LA` and `howmany` to the number
    of eigenvalues you want.

4.  Smallest eigenvalues. Set `pos` to `SA` and `howmany` to the number
    of eigenvalues you want.

5.  Eigenvalues from both ends of the spectrum. Set `pos` to `BE` and
    `howmany` to the number of eigenvalues you want. If `howmany` is
    odd, then one more eigenvalue is returned from the larger end.

6.  Selected eigenvalues. This is not (yet) implemented currently.

7.  Eigenvalues in an interval. This is not (yet) implemented.

8.  All eigenvalues. This is not implemented yet. The standard `eigen`
    function does a better job at this, anyway.

Note that ARPACK might be unstable for graphs with multiple components,
e.g. graphs with isolate vertices.

## See also

[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)
to create a (sparse) adjacency matrix.

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
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## Small example graph, leading eigenvector by default
kite <- make_graph("Krackhardt_kite")
spectrum(kite)[c("values", "vectors")]
#> $values
#> [1] 4.306404
#> 
#> $vectors
#>              [,1]
#>  [1,] -0.35220940
#>  [2,] -0.35220940
#>  [3,] -0.28583499
#>  [4,] -0.48102086
#>  [5,] -0.28583499
#>  [6,] -0.39769064
#>  [7,] -0.39769064
#>  [8,] -0.19586058
#>  [9,] -0.04807349
#> [10,] -0.01116326
#> 

## Double check
eigen(as_adjacency_matrix(kite, sparse = FALSE))$vectors[, 1]
#>  [1] -0.35220940 -0.35220940 -0.28583499 -0.48102086 -0.28583499 -0.39769064
#>  [7] -0.39769064 -0.19586058 -0.04807349 -0.01116326

## Should be the same as 'eigen_centrality' (but rescaled)
cor(eigen_centrality(kite)$vector, spectrum(kite)$vectors)
#>      [,1]
#> [1,]   -1

## Smallest eigenvalues
spectrum(kite, which = list(pos = "SM", howmany = 2))$values
#> [1] -0.4043420  0.6403647
```
