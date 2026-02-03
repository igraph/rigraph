# Find the multiple or loop edges in a graph

**\[deprecated\]**

`is.multiple()` was renamed to
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md)
to create a more consistent API.

## Usage

``` r
is.multiple(graph, eids = E(graph))
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.

## Related documentation in the C library

[`is_multiple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_multiple),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
