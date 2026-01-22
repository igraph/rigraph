# Graph layout by multidimensional scaling

**\[deprecated\]**

`layout.mds()` was renamed to
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md)
to create a more consistent API.

## Usage

``` r
layout.mds(graph, dist = NULL, dim = 2, options = arpack_defaults())
```

## Arguments

- graph:

  The input graph.

- dist:

  The distance matrix for the multidimensional scaling. If `NULL` (the
  default), then the unweighted shortest path matrix is used.

- dim:

  [`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md)
  supports dimensions up to the number of nodes minus one, but only if
  the graph is connected; for unconnected graphs, the only possible
  value is 2. This is because
  [`merge_coords()`](https://r.igraph.org/reference/merge_coords.md)
  only works in 2D.

- options:

  This is currently ignored, as ARPACK is not used any more for solving
  the eigenproblem

## Related documentation in the C library

[`layout_mds()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_mds)
