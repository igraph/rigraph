# Simple two-row layout for bipartite graphs

**\[deprecated\]**

`layout.bipartite()` was renamed to
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md)
to create a more consistent API.

## Usage

``` r
layout.bipartite(graph, types = NULL, hgap = 1, vgap = 1, maxiter = 100)
```

## Arguments

- graph:

  The bipartite input graph. It should have a logical ‘`type`’ vertex
  attribute, or the `types` argument must be given.

- types:

  A logical vector, the vertex types. If this argument is `NULL` (the
  default), then the ‘`type`’ vertex attribute is used.

- hgap:

  Real scalar, the minimum horizontal gap between vertices in the same
  layer.

- vgap:

  Real scalar, the distance between the two layers.

- maxiter:

  Integer scalar, the maximum number of iterations in the crossing
  minimization stage. 100 is a reasonable default; if you feel that you
  have too many edge crossings, increase this.

## Related documentation in the C library

[`layout_bipartite`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_bipartite),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
