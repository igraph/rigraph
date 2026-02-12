# Minimum cut in a graph

**\[deprecated\]**

`graph.mincut()` was renamed to
[`min_cut()`](https://r.igraph.org/reference/min_cut.md) to create a
more consistent API.

## Usage

``` r
graph.mincut(
  graph,
  source = NULL,
  target = NULL,
  capacity = NULL,
  value.only = TRUE
)
```

## Arguments

- graph:

  The input graph.

- source:

  The id of the source vertex.

- target:

  The id of the target vertex (sometimes also called sink).

- capacity:

  Vector giving the capacity of the edges. If this is `NULL` (the
  default) then the `capacity` edge attribute is used.

- value.only:

  Logical scalar, if `TRUE` only the minimum cut value is returned, if
  `FALSE` the edges in the cut and a the two (or more) partitions are
  also returned.
