# Stochastic matrix of a graph

**\[deprecated\]**

`get.stochastic()` was renamed to
[`stochastic_matrix()`](https://r.igraph.org/reference/stochastic_matrix.md)
to create a more consistent API.

## Usage

``` r
get.stochastic(
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
