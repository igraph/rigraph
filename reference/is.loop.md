# Find the multiple or loop edges in a graph

**\[deprecated\]**

`is.loop()` was renamed to
[`which_loop()`](https://r.igraph.org/reference/which_multiple.md) to
create a more consistent API.

## Usage

``` r
is.loop(graph, eids = E(graph))
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.

## Related documentation in the C library

[`is_loop`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_loop),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
