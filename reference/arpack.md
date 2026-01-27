# ARPACK eigenvector calculation

Interface to the ARPACK library for calculating eigenvectors of sparse
matrices

## Usage

``` r
arpack_defaults()

arpack(
  func,
  extra = NULL,
  sym = FALSE,
  options = arpack_defaults(),
  env = parent.frame(),
  complex = !sym
)
```

## Arguments

- func:

  The function to perform the matrix-vector multiplication. ARPACK
  requires to perform these by the user. The function gets the vector
  \\x\\ as the first argument, and it should return \\Ax\\, where \\A\\
  is the “input matrix”. (The input matrix is never given explicitly.)
  The second argument is `extra`.

- extra:

  Extra argument to supply to `func`.

- sym:

  Logical scalar, whether the input matrix is symmetric. Always supply
  `TRUE` here if it is, since it can speed up the computation.

- options:

  Options to ARPACK, a named list to overwrite some of the default
  option values. See details below.

- env:

  The environment in which `func` will be evaluated.

- complex:

  Whether to convert the eigenvectors returned by ARPACK into R complex
  vectors. By default this is not done for symmetric problems (these
  only have real eigenvectors/values), but only non-symmetric ones. If
  you have a non-symmetric problem, but you're sure that the results
  will be real, then supply `FALSE` here.

## Value

A named list with the following members:

- values:

  Numeric vector, the desired eigenvalues.

- vectors:

  Numeric matrix, the desired eigenvectors as columns. If `complex=TRUE`
  (the default for non-symmetric problems), then the matrix is complex.

- options:

  A named list with the supplied `options` and some information about
  the performed calculation, including an ARPACK exit code. See the
  details above.

## Details

ARPACK is a library for solving large scale eigenvalue problems. The
package is designed to compute a few eigenvalues and corresponding
eigenvectors of a general \\n\\ by \\n\\ matrix \\A\\. It is most
appropriate for large sparse or structured matrices \\A\\ where
structured means that a matrix-vector product `w <- Av` requires order
\\n\\ rather than the usual order \\n^2\\ floating point operations.

This function is an interface to ARPACK. igraph does not contain all
ARPACK routines, only the ones dealing with symmetric and non-symmetric
eigenvalue problems using double precision real numbers.

The eigenvalue calculation in ARPACK (in the simplest case) involves the
calculation of the \\Av\\ product where \\A\\ is the matrix we work with
and \\v\\ is an arbitrary vector. The function supplied in the `fun`
argument is expected to perform this product. If the product can be done
efficiently, e.g. if the matrix is sparse, then `arpack()` is usually
able to calculate the eigenvalues very quickly.

The `options` argument specifies what kind of calculation to perform. It
is a list with the following members, they correspond directly to ARPACK
parameters. On input it has the following fields:

- bmat:

  Character constant, possible values: ‘`I`’, standard eigenvalue
  problem, \\Ax=\lambda x\\; and ‘`G`’, generalized eigenvalue problem,
  \\Ax=\lambda B x\\. Currently only ‘`I`’ is supported.

- n:

  Numeric scalar. The dimension of the eigenproblem. You only need to
  set this if you call `arpack()` directly. (I.e. not needed for
  [`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
  [`page_rank()`](https://r.igraph.org/reference/page_rank.md), etc.)

- which:

  Specify which eigenvalues/vectors to compute, character constant with
  exactly two characters. Possible values for symmetric input matrices:

  "LA"

  :   Compute `nev` largest (algebraic) eigenvalues.

  "SA"

  :   Compute `nev` smallest (algebraic) eigenvalues.

  "LM"

  :   Compute `nev` largest (in magnitude) eigenvalues.

  "SM"

  :   Compute `nev` smallest (in magnitude) eigenvalues.

  "BE"

  :   Compute `nev` eigenvalues, half from each end of the spectrum.
      When `nev` is odd, compute one more from the high end than from
      the low end.

  Possible values for non-symmetric input matrices:

  "LM"

  :   Compute `nev` eigenvalues of largest magnitude.

  "SM"

  :   Compute `nev` eigenvalues of smallest magnitude.

  "LR"

  :   Compute `nev` eigenvalues of largest real part.

  "SR"

  :   Compute `nev` eigenvalues of smallest real part.

  "LI"

  :   Compute `nev` eigenvalues of largest imaginary part.

  "SI"

  :   Compute `nev` eigenvalues of smallest imaginary part.

  This parameter is sometimes overwritten by the various functions, e.g.
  [`page_rank()`](https://r.igraph.org/reference/page_rank.md) always
  sets ‘`LM`’.

- nev:

  Numeric scalar. The number of eigenvalues to be computed.

- tol:

  Numeric scalar. Stopping criterion: the relative accuracy of the Ritz
  value is considered acceptable if its error is less than `tol` times
  its estimated value. If this is set to zero then machine precision is
  used.

- ncv:

  Number of Lanczos vectors to be generated.

- ldv:

  Numberic scalar. It should be set to zero in the current
  implementation.

- ishift:

  Either zero or one. If zero then the shifts are provided by the user
  via reverse communication. If one then exact shifts with respect to
  the reduced tridiagonal matrix \\T\\. Please always set this to one.

- maxiter:

  Maximum number of Arnoldi update iterations allowed.

- nb:

  Blocksize to be used in the recurrence. Please always leave this on
  the default value, one.

- mode:

  The type of the eigenproblem to be solved. Possible values if the
  input matrix is symmetric:

  1

  :   \\Ax=\lambda x\\, \\A\\ is symmetric.

  2

  :   \\Ax=\lambda Mx\\, \\A\\ is symmetric, \\M\\ is symmetric positive
      definite.

  3

  :   \\Kx=\lambda Mx\\, \\K\\ is symmetric, \\M\\ is symmetric positive
      semi-definite.

  4

  :   \\Kx=\lambda KGx\\, \\K\\ is symmetric positive semi-definite,
      \\KG\\ is symmetric indefinite.

  5

  :   \\Ax=\lambda Mx\\, \\A\\ is symmetric, \\M\\ is symmetric positive
      semi-definite. (Cayley transformed mode.)

  Please note that only `mode==1` was tested and other values might not
  work properly. Possible values if the input matrix is not symmetric:

  1

  :   \\Ax=\lambda x\\.

  2

  :   \\Ax=\lambda Mx\\, \\M\\ is symmetric positive definite.

  3

  :   \\Ax=\lambda Mx\\, \\M\\ is symmetric semi-definite.

  4

  :   \\Ax=\lambda Mx\\, \\M\\ is symmetric semi-definite.

  Please note that only `mode==1` was tested and other values might not
  work properly.

- start:

  Not used currently. Later it be used to set a starting vector.

- sigma:

  Not used currently.

- sigmai:

  Not use currently.

: On output the following additional fields are added:

- info:

  Error flag of ARPACK. Possible values:

  0

  :   Normal exit.

  1

  :   Maximum number of iterations taken.

  3

  :   No shifts could be applied during a cycle of the implicitly
      restarted Arnoldi iteration. One possibility is to increase the
      size of `ncv` relative to `nev`.

  ARPACK can return more error conditions than these, but they are
  converted to regular igraph errors.

- iter:

  Number of Arnoldi iterations taken.

- nconv:

  Number of “converged” Ritz values. This represents the number of Ritz
  values that satisfy the convergence critetion.

- numop:

  Total number of matrix-vector multiplications.

- numopb:

  Not used currently.

- numreo:

  Total number of steps of re-orthogonalization.

Please see the ARPACK documentation for additional details.

## References

D.C. Sorensen, Implicit Application of Polynomial Filters in a k-Step
Arnoldi Method. *SIAM J. Matr. Anal. Apps.*, 13 (1992), pp 357-385.

R.B. Lehoucq, Analysis and Implementation of an Implicitly Restarted
Arnoldi Iteration. *Rice University Technical Report* TR95-13,
Department of Computational and Applied Mathematics.

B.N. Parlett & Y. Saad, Complex Shift and Invert Strategies for Real
Matrices. *Linear Algebra and its Applications*, vol 88/89, pp 575-595,
(1987).

## See also

[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`hub_score()`](https://r.igraph.org/reference/hub_score.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)
are some of the functions in igraph that use ARPACK.

## Author

Rich Lehoucq, Kristi Maschhoff, Danny Sorensen, Chao Yang for ARPACK,
Gabor Csardi <csardi.gabor@gmail.com> for the R interface.

## Examples

``` r
# Identity matrix
f <- function(x, extra = NULL) x
arpack(f, options = list(n = 10, nev = 2, ncv = 4), sym = TRUE)
#> $values
#> [1] 1 1
#> 
#> $vectors
#>              [,1]        [,2]
#>  [1,]  0.47899559 -0.22165241
#>  [2,]  0.02563875 -0.05909943
#>  [3,]  0.47539054 -0.19000747
#>  [4,] -0.52783666 -0.67727036
#>  [5,] -0.27844498 -0.21112117
#>  [6,]  0.14568395  0.04884236
#>  [7,]  0.07307229  0.02239947
#>  [8,] -0.37430168  0.63030259
#>  [9,] -0.02487496  0.05239496
#> [10,]  0.14311774  0.07136832
#> 
#> $options
#> $options$bmat
#> [1] "I"
#> 
#> $options$n
#> [1] 10
#> 
#> $options$which
#> [1] "XX"
#> 
#> $options$nev
#> [1] 2
#> 
#> $options$tol
#> [1] 0
#> 
#> $options$ncv
#> [1] 4
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
#> [1] 0
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
#> [1] 2
#> 
#> $options$numop
#> [1] 4
#> 
#> $options$numopb
#> [1] 0
#> 
#> $options$numreo
#> [1] 4
#> 
#> 

# Graph laplacian of a star graph (undirected), n>=2
# Note that this is a linear operation
f <- function(x, extra = NULL) {
  y <- x
  y[1] <- (length(x) - 1) * x[1] - sum(x[-1])
  for (i in 2:length(x)) {
    y[i] <- x[i] - x[1]
  }
  y
}

arpack(f, options = list(n = 10, nev = 1, ncv = 3), sym = TRUE)
#> $values
#> [1] 10
#> 
#> $vectors
#>  [1]  0.9486833 -0.1054093 -0.1054093 -0.1054093 -0.1054093 -0.1054093
#>  [7] -0.1054093 -0.1054093 -0.1054093 -0.1054093
#> 
#> $options
#> $options$bmat
#> [1] "I"
#> 
#> $options$n
#> [1] 10
#> 
#> $options$which
#> [1] "XX"
#> 
#> $options$nev
#> [1] 1
#> 
#> $options$tol
#> [1] 0
#> 
#> $options$ncv
#> [1] 3
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
#> [1] 0
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
#> [1] 3
#> 
#> $options$numopb
#> [1] 0
#> 
#> $options$numreo
#> [1] 2
#> 
#> 

# double check
eigen(laplacian_matrix(make_star(10, mode = "undirected")))
#> eigen() decomposition
#> $values
#>  [1] 1.000000e+01 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00
#>  [6] 1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00 3.552714e-15
#> 
#> $vectors
#>             [,1]          [,2]          [,3]          [,4]         [,5]
#>  [1,]  0.9486833  0.000000e+00  0.000000e+00  0.000000e+00  0.000000000
#>  [2,] -0.1054093  8.326673e-17  3.700743e-17  5.088522e-17  0.000000000
#>  [3,] -0.1054093 -2.797408e-02  4.776398e-02  2.607166e-02  0.013093681
#>  [4,] -0.1054093 -1.039830e-01 -2.360909e-02 -1.303764e-02 -0.013631362
#>  [5,] -0.1054093  5.476910e-01 -6.326953e-01 -3.451259e-01 -0.162677941
#>  [6,] -0.1054093 -7.522271e-01 -2.295315e-01 -1.264230e-01 -0.116804378
#>  [7,] -0.1054093 -6.660610e-02  3.990335e-01 -5.876702e-01  0.028588417
#>  [8,] -0.1054093 -6.660610e-02 -2.728812e-01  6.564537e-01  0.002388718
#>  [9,] -0.1054093  2.761427e-01  5.248776e-01  2.717508e-01 -0.556544346
#> [10,] -0.1054093  1.935626e-01  1.870420e-01  1.179806e-01  0.805587211
#>                [,6]          [,7]          [,8]       [,9]      [,10]
#>  [1,]  0.000000e+00  0.000000e+00  0.000000e+00  0.0000000 -0.3162278
#>  [2,]  7.401487e-17 -2.775558e-17  1.850372e-16  0.9428090 -0.3162278
#>  [3,] -9.208834e-02 -5.293868e-02  9.272551e-01 -0.1178511 -0.3162278
#>  [4,] -5.890805e-02  9.229437e-01 -8.932611e-02 -0.1178511 -0.3162278
#>  [5,] -9.316695e-02 -1.117852e-01 -8.932611e-02 -0.1178511 -0.3162278
#>  [6,] -3.433928e-01 -2.698728e-01 -1.899836e-01 -0.1178511 -0.3162278
#>  [7,]  5.871007e-01 -1.117852e-01 -8.932611e-02 -0.1178511 -0.3162278
#>  [8,]  5.871007e-01 -1.117852e-01 -8.932611e-02 -0.1178511 -0.3162278
#>  [9,] -2.933226e-01 -1.323884e-01 -1.899836e-01 -0.1178511 -0.3162278
#> [10,] -2.933226e-01 -1.323884e-01 -1.899836e-01 -0.1178511 -0.3162278
#> 

## First three eigenvalues of the adjacency matrix of a graph
## We need the 'Matrix' package for this
library("Matrix")
set.seed(42)
g <- sample_gnp(1000, 5 / 1000)
M <- as_adjacency_matrix(g, sparse = TRUE)
f2 <- function(x, extra = NULL) {
  cat(".")
  as.vector(M %*% x)
}
baev <- arpack(
  f2,
  sym = TRUE,
  options = list(
    n = vcount(g),
    nev = 3,
    ncv = 8,
    which = "LM",
    maxiter = 2000
  )
)
#> .....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................
```
