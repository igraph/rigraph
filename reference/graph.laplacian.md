# Graph Laplacian

**\[deprecated\]**

`graph.laplacian()` was renamed to
[`laplacian_matrix()`](https://r.igraph.org/reference/laplacian_matrix.md)
to create a more consistent API.

## Usage

``` r
graph.laplacian(
  graph,
  normalized = FALSE,
  weights = NULL,
  sparse = igraph_opt("sparsematrices")
)
```

## Arguments

- graph:

  The input graph.

- normalized:

  Deprecated, use `normalization` instead.

- weights:

  An optional vector giving edge weights for weighted Laplacian matrix.
  If this is `NULL` and the graph has an edge attribute called `weight`,
  then it will be used automatically. Set this to `NA` if you want the
  unweighted Laplacian on a graph that has a `weight` edge attribute.

- sparse:

  Logical scalar, whether to return the result as a sparse matrix. The
  `Matrix` package is required for sparse matrices.
