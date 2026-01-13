# Minimum spanning tree

**\[deprecated\]**

`minimum.spanning.tree()` was renamed to
[`mst()`](https://r.igraph.org/reference/mst.md) to create a more
consistent API.

## Usage

``` r
minimum.spanning.tree(graph, weights = NULL, algorithm = NULL, ...)
```

## Arguments

- graph:

  The graph object to analyze.

- weights:

  Numeric vector giving the weights of the edges in the graph. The order
  is determined by the edge ids. This is ignored if the `unweighted`
  algorithm is chosen. Edge weights are interpreted as distances.

- algorithm:

  The algorithm to use for calculation. `unweighted` can be used for
  unweighted graphs, and `prim` runs Prim's algorithm for weighted
  graphs. If this is `NULL` then igraph will select the algorithm
  automatically: if the graph has an edge attribute called `weight` or
  the `weights` argument is not `NULL` then Prim's algorithm is chosen,
  otherwise the unweighted algorithm is used.

- ...:

  Additional arguments, unused.

## Related documentation in the C library

[`minimum_spanning_tree_unweighted()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_minimum_spanning_tree_unweighted),
[`minimum_spanning_tree_prim()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_minimum_spanning_tree_prim),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
