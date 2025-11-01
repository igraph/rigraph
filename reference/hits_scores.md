# Kleinberg's hub and authority centrality scores.

The hub scores of the vertices are defined as the principal eigenvector
of \\A A^T\\, where \\A\\ is the adjacency matrix of the graph.

## Usage

``` r
hits_scores(
  graph,
  ...,
  scale = TRUE,
  weights = NULL,
  options = arpack_defaults()
)
```

## Arguments

- graph:

  The input graph.

- ...:

  These dots are for future extensions and must be empty.

- scale:

  Logical scalar, whether to scale the result to have a maximum score of
  one. If no scaling is used then the result vector has unit length in
  the Euclidean norm.

- weights:

  Optional positive weight vector for calculating weighted scores. If
  the graph has a `weight` edge attribute, then this is used by default.
  Pass `NA` to ignore the weight attribute. This function interprets
  edge weights as connection strengths. The weights of parallel edges
  are effectively added up.

- options:

  A named list, to override some ARPACK options. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.

## Value

A named list with members:

- hub:

  The hub score of the vertices.

- authority:

  The authority score of the vertices.

- value:

  The corresponding eigenvalue of the calculated principal eigenvector.

- options:

  Some information about the ARPACK computation, it has the same members
  as the `options` member returned by
  [`arpack()`](https://r.igraph.org/reference/arpack.md), see that for
  documentation.

## Details

Similarly, the authority scores of the vertices are defined as the
principal eigenvector of \\A^T A\\, where \\A\\ is the adjacency matrix
of the graph.

For undirected matrices the adjacency matrix is symmetric and the hub
scores are the same as authority scores.

## References

J. Kleinberg. Authoritative sources in a hyperlinked environment. *Proc.
9th ACM-SIAM Symposium on Discrete Algorithms*, 1998. Extended version
in *Journal of the ACM* 46(1999). Also appears as IBM Research Report RJ
10076, May 1997.

## See also

[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
for eigenvector centrality,
[`page_rank()`](https://r.igraph.org/reference/page_rank.md) for the
Page Rank scores. [`arpack()`](https://r.igraph.org/reference/arpack.md)
for the underlining machinery of the computation.

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Related documentation in the C library

[`hub_and_authority_scores()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_hub_and_authority_scores).

## Examples

``` r
## An in-star
g <- make_star(10)
hits_scores(g)
#> $hub
#>  [1] 2.919382e-18 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00
#>  [6] 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00
#> 
#> $authority
#>  [1] 1 0 0 0 0 0 0 0 0 0
#> 
#> $value
#> [1] 9
#> 
#> $options
#> $options$bmat
#> [1] "I"
#> 
#> $options$n
#> [1] 10
#> 
#> $options$which
#> [1] "LA"
#> 
#> $options$nev
#> [1] 1
#> 
#> $options$tol
#> [1] 0
#> 
#> $options$ncv
#> [1] 0
#> 
#> $options$ldv
#> [1] 0
#> 
#> $options$ishift
#> [1] 1
#> 
#> $options$maxiter
#> [1] 3000
#> 
#> $options$nb
#> [1] 1
#> 
#> $options$mode
#> [1] 1
#> 
#> $options$start
#> [1] 1
#> 
#> $options$sigma
#> [1] 0
#> 
#> $options$sigmai
#> [1] 0
#> 
#> $options$info
#> [1] 0
#> 
#> $options$iter
#> [1] 1
#> 
#> $options$nconv
#> [1] 1
#> 
#> $options$numop
#> [1] 7
#> 
#> $options$numopb
#> [1] 0
#> 
#> $options$numreo
#> [1] 7
#> 
#> 

## A ring
g2 <- make_ring(10)
hits_scores(g2)
#> $hub
#>  [1] 0 1 0 1 0 1 0 1 0 1
#> 
#> $authority
#>  [1] 1 0 1 0 1 0 1 0 1 0
#> 
#> $value
#> [1] 4
#> 
#> $options
#> $options$bmat
#> [1] "I"
#> 
#> $options$n
#> [1] 10
#> 
#> $options$which
#> [1] "LA"
#> 
#> $options$nev
#> [1] 1
#> 
#> $options$tol
#> [1] 0
#> 
#> $options$ncv
#> [1] 0
#> 
#> $options$ldv
#> [1] 0
#> 
#> $options$ishift
#> [1] 1
#> 
#> $options$maxiter
#> [1] 3000
#> 
#> $options$nb
#> [1] 1
#> 
#> $options$mode
#> [1] 1
#> 
#> $options$start
#> [1] 1
#> 
#> $options$sigma
#> [1] 0
#> 
#> $options$sigmai
#> [1] 0
#> 
#> $options$info
#> [1] 0
#> 
#> $options$iter
#> [1] 1
#> 
#> $options$nconv
#> [1] 1
#> 
#> $options$numop
#> [1] 7
#> 
#> $options$numopb
#> [1] 0
#> 
#> $options$numreo
#> [1] 5
#> 
#> 
```
