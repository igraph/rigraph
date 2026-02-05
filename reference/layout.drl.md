# The DrL graph layout generator

**\[deprecated\]**

`layout.drl()` was renamed to
[`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md)
to create a more consistent API.

## Usage

``` r
layout.drl(
  graph,
  use.seed = FALSE,
  seed = matrix(runif(vcount(graph) * 2), ncol = 2),
  options = drl_defaults$default,
  weights = NULL,
  dim = 2
)
```

## Arguments

- graph:

  The input graph, in can be directed or undirected.

- use.seed:

  Logical scalar, whether to use the coordinates given in the `seed`
  argument as a starting point.

- seed:

  A matrix with two columns, the starting coordinates for the vertices
  is `use.seed` is `TRUE`. It is ignored otherwise.

- options:

  Options for the layout generator, a named list. See details below.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for the layout. Larger edge weights correspond to stronger
  connections.

- dim:

  Either ‘2’ or ‘3’, it specifies whether we want a two dimensional or a
  three dimensional layout. Note that because of the nature of the DrL
  algorithm, the three dimensional layout takes significantly longer to
  compute.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
