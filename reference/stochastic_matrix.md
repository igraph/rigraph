# Stochastic matrix of a graph

Retrieves the stochastic matrix of a graph of class `igraph`.

## Usage

``` r
stochastic_matrix(
  graph,
  column.wise = FALSE,
  sparse = igraph_opt("sparsematrices")
)
```

## Arguments

- graph:

  The input graph. Must be of class `igraph`.

- column.wise:

  If `FALSE`, then the rows of the stochastic matrix sum up to one;
  otherwise it is the columns.

- sparse:

  Logical scalar, whether to return a sparse matrix. The `Matrix`
  package is needed for sparse matrices.

## Value

A regular matrix or a matrix of class `Matrix` if a `sparse` argument
was `TRUE`.

## Details

Let \\M\\ be an \\n \times n\\ adjacency matrix with real non-negative
entries. Let us define \\D = \textrm{diag}(\sum\_{i}M\_{1i}, \dots,
\sum\_{i}M\_{ni})\\

The (row) stochastic matrix is defined as \$\$W = D^{-1}M,\$\$ where it
is assumed that \\D\\ is non-singular. Column stochastic matrices are
defined in a symmetric way.

## Related documentation in the C library

[`get_stochastic`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_stochastic),
[`get_stochastic_sparse`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_stochastic_sparse),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`as_adjacency_matrix()`](https://r.igraph.org/reference/as_adjacency_matrix.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
library(Matrix)
## g is a large sparse graph
g <- sample_pa(n = 10^5, power = 2, directed = FALSE)
W <- stochastic_matrix(g, sparse = TRUE)

## a dense matrix here would probably not fit in the memory
class(W)
#> [1] "dgCMatrix"
#> attr(,"package")
#> [1] "Matrix"

## may not be exactly 1, due to numerical errors
max(abs(rowSums(W)) - 1)
#> [1] 0
```
