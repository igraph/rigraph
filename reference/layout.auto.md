# Choose an appropriate graph layout algorithm automatically

**\[deprecated\]**

`layout.auto()` was renamed to
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md) to
create a more consistent API.

## Usage

``` r
layout.auto(graph, dim = 2, ...)
```

## Arguments

- graph:

  The input graph

- dim:

  Dimensions, should be 2 or 3.

- ...:

  For
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  the extra arguments are passed to the real layout function. For
  [`nicely()`](https://r.igraph.org/reference/layout_nicely.md) all
  argument are passed to
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md).

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`layout_align()`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_align),
[[`is_forest()`](https://r.igraph.org/reference/is_forest.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_forest),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
