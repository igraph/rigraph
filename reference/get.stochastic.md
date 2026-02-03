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

## Related documentation in the C library

[`get_stochastic()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_stochastic),
[`get_stochastic_sparse()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_stochastic_sparse),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
