# Delete edges from a graph

**\[deprecated\]**

`delete.edges()` was renamed to
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md) to
create a more consistent API.

## Usage

``` r
delete.edges(graph, edges)
```

## Arguments

- graph:

  The input graph.

- edges:

  The edges to remove, specified as an edge sequence. Typically this is
  either a numeric vector containing edge IDs, or a character vector
  containing the IDs or names of the source and target vertices,
  separated by `|`

## Related documentation in the C library

[`delete_edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_delete_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
