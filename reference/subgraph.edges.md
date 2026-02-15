# Subgraph of a graph

**\[deprecated\]**

`subgraph.edges()` was renamed to
[`subgraph_from_edges()`](https://r.igraph.org/reference/subgraph.md) to
create a more consistent API.

## Usage

``` r
subgraph.edges(graph, eids, delete.vertices = TRUE)
```

## Arguments

- graph:

  The original graph.

- eids:

  The edge ids of the edges that will be kept in the result graph.

- delete.vertices:

  Logical scalar, whether to remove vertices that do not have any
  adjacent edges in `eids`.

## Related documentation in the C library

[`subgraph_from_edges`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_subgraph_from_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
