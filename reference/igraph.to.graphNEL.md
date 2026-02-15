# Convert igraph graphs to graphNEL objects from the graph package

**\[deprecated\]**

`igraph.to.graphNEL()` was renamed to
[`as_graphnel()`](https://r.igraph.org/reference/as_graphnel.md) to
create a more consistent API.

## Usage

``` r
igraph.to.graphNEL(graph)
```

## Arguments

- graph:

  An igraph graph object.

## Related documentation in the C library

[`get_edgelist`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`is_directed`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`has_multiple`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_has_multiple),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
