# Find the multiple or loop edges in a graph

**\[deprecated\]**

`count.multiple()` was renamed to
[`count_multiple()`](https://r.igraph.org/reference/which_multiple.md)
to create a more consistent API.

## Usage

``` r
count.multiple(graph, eids = E(graph))
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.

## Related documentation in the C library

[[`count_multiple()`](https://r.igraph.org/reference/which_multiple.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_count_multiple),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
