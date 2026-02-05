# Grid Fruchterman-Reingold layout, this was removed from igraph

**\[deprecated\]**

Now it calls the Fruchterman-Reingold layout
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md).

## Usage

``` r
layout.fruchterman.reingold.grid(graph, ...)
```

## Arguments

- graph:

  Input graph.

- ...:

  Extra arguments are ignored.

## Value

Layout coordinates, a two column matrix.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
