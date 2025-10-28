# Match Graphs given a seeding of vertex correspondences

Given two adjacency matrices `A` and `B` of the same size, match the two
graphs with the help of `m` seed vertex pairs which correspond to the
first `m` rows (and columns) of the adjacency matrices.

## Usage

``` r
match_vertices(A, B, m, start, iteration)
```

## Arguments

- A:

  a numeric matrix, the adjacency matrix of the first graph

- B:

  a numeric matrix, the adjacency matrix of the second graph

- m:

  The number of seeds. The first `m` vertices of both graphs are
  matched.

- start:

  a numeric matrix, the permutation matrix estimate is initialized with
  `start`

- iteration:

  The number of iterations for the Frank-Wolfe algorithm

## Value

A numeric matrix which is the permutation matrix that determines the
bijection between the graphs of `A` and `B`

## Details

The approximate graph matching problem is to find a bijection between
the vertices of two graphs , such that the number of edge disagreements
between the corresponding vertex pairs is minimized. For seeded graph
matching, part of the bijection that consist of known correspondences
(the seeds) is known and the problem task is to complete the bijection
by estimating the permutation matrix that permutes the rows and columns
of the adjacency matrix of the second graph.

It is assumed that for the two supplied adjacency matrices `A` and `B`,
both of size \\n\times n\\, the first \\m\\ rows(and columns) of `A` and
`B` correspond to the same vertices in both graphs. That is, the \\n
\times n\\ permutation matrix that defines the bijection is \\I\_{m}
\bigoplus P\\ for a \\(n-m)\times (n-m)\\ permutation matrix \\P\\ and
\\m\\ times \\m\\ identity matrix \\I\_{m}\\. The function
`match_vertices()` estimates the permutation matrix \\P\\ via an
optimization algorithm based on the Frank-Wolfe algorithm.

See references for further details.

## References

Vogelstein, J. T., Conroy, J. M., Podrazik, L. J., Kratzer, S. G.,
Harley, E. T., Fishkind, D. E.,Vogelstein, R. J., Priebe, C. E. (2011).
Fast Approximate Quadratic Programming for Large (Brain) Graph Matching.
Online: <https://arxiv.org/abs/1112.5507>

Fishkind, D. E., Adali, S., Priebe, C. E. (2012). Seeded Graph Matching
Online: <https://arxiv.org/abs/1209.0367>

## See also

[`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md),[`sample_correlated_gnp_pair()`](https://r.igraph.org/reference/sample_correlated_gnp_pair.md)

## Author

Vince Lyzinski <https://www.ams.jhu.edu/~lyzinski/>

## Examples

``` r
# require(Matrix)
g1 <- sample_gnp(10, 0.1)
randperm <- c(1:3, 3 + sample(7))
g2 <- sample_correlated_gnp(g1, corr = 1, p = g1$p, permutation = randperm)
A <- as_adjacency_matrix(g1)
B <- as_adjacency_matrix(g2)
P <- match_vertices(A, B, m = 3, start = diag(rep(1, nrow(A) - 3)), 20)
P
#> $corr
#>      [,1] [,2]
#> [1,]    4    9
#> [2,]    5    5
#> [3,]    6    6
#> [4,]    7   10
#> [5,]    8    4
#> [6,]    9    7
#> [7,]   10    8
#> 
#> $P
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    1    0    0    0    0    0    0    0    0     0
#>  [2,]    0    1    0    0    0    0    0    0    0     0
#>  [3,]    0    0    1    0    0    0    0    0    0     0
#>  [4,]    0    0    0    0    0    0    0    0    1     0
#>  [5,]    0    0    0    0    1    0    0    0    0     0
#>  [6,]    0    0    0    0    0    1    0    0    0     0
#>  [7,]    0    0    0    0    0    0    0    0    0     1
#>  [8,]    0    0    0    1    0    0    0    0    0     0
#>  [9,]    0    0    0    0    0    0    1    0    0     0
#> [10,]    0    0    0    0    0    0    0    1    0     0
#> 
#> $D
#> 7 x 7 sparse Matrix of class "dgCMatrix"
#>                   
#> [1,] . . . . . 1 .
#> [2,] . 1 . . . . .
#> [3,] . . 1 . . . .
#> [4,] . . . . . . 1
#> [5,] 1 . . . . . .
#> [6,] . . . 1 . . .
#> [7,] . . . . 1 . .
#> 
```
