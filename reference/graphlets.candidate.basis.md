# Graphlet decomposition of a graph

**\[deprecated\]**

`graphlets.candidate.basis()` was renamed to
[`graphlet_basis()`](https://r.igraph.org/reference/graphlet_basis.md)
to create a more consistent API.

## Usage

``` r
graphlets.candidate.basis(graph, weights = NULL)
```

## Arguments

- graph:

  The input graph, edge directions are ignored. Only simple graph (i.e.
  graphs without self-loops and multiple edges) are supported.

- weights:

  Edge weights. If the graph has a `weight` edge attribute and this
  argument is `NULL` (the default), then the `weight` edge attribute is
  used.

## Related documentation in the C library

[`graphlets_candidate_basis()`](https://igraph.org/c/html/0.10.17/igraph-Graphlets.html#igraph_graphlets_candidate_basis),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
