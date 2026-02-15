# The GEM layout algorithm

**\[deprecated\]**

`layout.gem()` was renamed to
[`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md)
to create a more consistent API.

## Usage

``` r
layout.gem(
  graph,
  coords = NULL,
  maxiter = 40 * vcount(graph)^2,
  temp.max = max(vcount(graph), 1),
  temp.min = 1/10,
  temp.init = sqrt(max(vcount(graph), 1))
)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

- coords:

  If not `NULL`, then the starting coordinates should be given here, in
  a two or three column matrix, depending on the `dim` argument.

- maxiter:

  The maximum number of iterations to perform. Updating a single vertex
  counts as an iteration. A reasonable default is 40 \* n \* n, where n
  is the number of vertices. The original paper suggests 4 \* n \* n,
  but this usually only works if the other parameters are set up
  carefully.

- temp.max:

  The maximum allowed local temperature. A reasonable default is the
  number of vertices.

- temp.min:

  The global temperature at which the algorithm terminates (even before
  reaching `maxiter` iterations). A reasonable default is 1/10.

- temp.init:

  Initial local temperature of all vertices. A reasonable default is the
  square root of the number of vertices.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`layout_gem`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_gem)
