# Community structure detecting based on the leading eigenvector of the community matrix

**\[deprecated\]**

`leading.eigenvector.community()` was renamed to
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)
to create a more consistent API.

## Usage

``` r
leading.eigenvector.community(
  graph,
  steps = -1,
  weights = NULL,
  start = NULL,
  options = arpack_defaults(),
  callback = NULL,
  extra = NULL,
  env = parent.frame()
)
```

## Arguments

- graph:

  The input graph. Should be undirected as the method needs a symmetric
  matrix.

- steps:

  The number of steps to take, this is actually the number of tries to
  make a step. It is not a particularly useful parameter.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- start:

  `NULL`, or a numeric membership vector, giving the start configuration
  of the algorithm.

- options:

  A named list to override some ARPACK options.

- callback:

  If not `NULL`, then it must be callback function. This is called after
  each iteration, after calculating the leading eigenvector of the
  modularity matrix. See details below.

- extra:

  Additional argument to supply to the callback function.

- env:

  The environment in which the callback function is evaluated.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
