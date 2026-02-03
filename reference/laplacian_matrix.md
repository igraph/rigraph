# Graph Laplacian

The Laplacian of a graph.

## Usage

``` r
laplacian_matrix(
  graph,
  weights = NULL,
  sparse = igraph_opt("sparsematrices"),
  normalization = c("unnormalized", "symmetric", "left", "right"),
  normalized
)
```

## Arguments

- graph:

  The input graph.

- weights:

  An optional vector giving edge weights for weighted Laplacian matrix.
  If this is `NULL` and the graph has an edge attribute called `weight`,
  then it will be used automatically. Set this to `NA` if you want the
  unweighted Laplacian on a graph that has a `weight` edge attribute.

- sparse:

  Logical scalar, whether to return the result as a sparse matrix. The
  `Matrix` package is required for sparse matrices.

- normalization:

  The normalization method to use when calculating the Laplacian matrix.
  See the "Normalization methods" section on this page.

- normalized:

  Deprecated, use `normalization` instead.

## Value

A numeric matrix.

## Details

The Laplacian Matrix of a graph is a symmetric matrix having the same
number of rows and columns as the number of vertices in the graph and
element (i,j) is d\[i\], the degree of vertex i if if i==j, -1 if i!=j
and there is an edge between vertices i and j and 0 otherwise.

The Laplacian matrix can also be normalized, with several conventional
normalization methods. See the "Normalization methods" section on this
page.

The weighted version of the Laplacian simply works with the weighted
degree instead of the plain degree. I.e. (i,j) is d\[i\], the weighted
degree of vertex i if if i==j, -w if i!=j and there is an edge between
vertices i and j with weight w, and 0 otherwise. The weighted degree of
a vertex is the sum of the weights of its adjacent edges.

## Normalization methods

The Laplacian matrix \\L\\ is defined in terms of the adjacency matrix
\\A\\ and a diagonal matrix \\D\\ containing the degrees as follows:

- "unnormalized": Unnormalized Laplacian, \\L = D - A\\.

- "symmetric": Symmetrically normalized Laplacian, \\L = I -
  D^{-\frac{1}{2}} A D^{-\frac{1}{2}}\\.

- "left": Left-stochastic normalized Laplacian, \\{L = I - D^{-1} A}\\.

- "right": Right-stochastic normalized Laplacian, \\L = I - A D^{-1}\\.

## Related documentation in the C library

[`get_laplacian()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_laplacian),
[`get_laplacian_sparse()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_laplacian_sparse),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
laplacian_matrix(g)
#> 10 x 10 sparse Matrix of class "dgCMatrix"
#>                                    
#>  [1,]  2 -1  .  .  .  .  .  .  . -1
#>  [2,] -1  2 -1  .  .  .  .  .  .  .
#>  [3,]  . -1  2 -1  .  .  .  .  .  .
#>  [4,]  .  . -1  2 -1  .  .  .  .  .
#>  [5,]  .  .  . -1  2 -1  .  .  .  .
#>  [6,]  .  .  .  . -1  2 -1  .  .  .
#>  [7,]  .  .  .  .  . -1  2 -1  .  .
#>  [8,]  .  .  .  .  .  . -1  2 -1  .
#>  [9,]  .  .  .  .  .  .  . -1  2 -1
#> [10,] -1  .  .  .  .  .  .  . -1  2
laplacian_matrix(g, normalization = "unnormalized")
#> 10 x 10 sparse Matrix of class "dgCMatrix"
#>                                    
#>  [1,]  2 -1  .  .  .  .  .  .  . -1
#>  [2,] -1  2 -1  .  .  .  .  .  .  .
#>  [3,]  . -1  2 -1  .  .  .  .  .  .
#>  [4,]  .  . -1  2 -1  .  .  .  .  .
#>  [5,]  .  .  . -1  2 -1  .  .  .  .
#>  [6,]  .  .  .  . -1  2 -1  .  .  .
#>  [7,]  .  .  .  .  . -1  2 -1  .  .
#>  [8,]  .  .  .  .  .  . -1  2 -1  .
#>  [9,]  .  .  .  .  .  .  . -1  2 -1
#> [10,] -1  .  .  .  .  .  .  . -1  2
laplacian_matrix(g, normalization = "unnormalized", sparse = FALSE)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
#>  [1,]    2   -1    0    0    0    0    0    0    0    -1
#>  [2,]   -1    2   -1    0    0    0    0    0    0     0
#>  [3,]    0   -1    2   -1    0    0    0    0    0     0
#>  [4,]    0    0   -1    2   -1    0    0    0    0     0
#>  [5,]    0    0    0   -1    2   -1    0    0    0     0
#>  [6,]    0    0    0    0   -1    2   -1    0    0     0
#>  [7,]    0    0    0    0    0   -1    2   -1    0     0
#>  [8,]    0    0    0    0    0    0   -1    2   -1     0
#>  [9,]    0    0    0    0    0    0    0   -1    2    -1
#> [10,]   -1    0    0    0    0    0    0    0   -1     2
```
