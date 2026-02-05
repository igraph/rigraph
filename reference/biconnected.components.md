# Biconnected components

**\[deprecated\]**

`biconnected.components()` was renamed to
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md)
to create a more consistent API.

## Usage

``` r
biconnected.components(graph)
```

## Arguments

- graph:

  The input graph. It is treated as an undirected graph, even if it is
  directed.

## Related documentation in the C library

[[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_biconnected_components),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
