# Convert a general graph into a forest

**\[deprecated\]**

`unfold.tree()` was renamed to
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md) to
create a more consistent API.

## Usage

``` r
unfold.tree(graph, mode = c("all", "out", "in", "total"), roots)
```

## Arguments

- graph:

  The input graph, it can be either directed or undirected.

- mode:

  Character string, defined the types of the paths used for the
  breadth-first search. “out” follows the outgoing, “in” the incoming
  edges, “all” and “total” both of them. This argument is ignored for
  undirected graphs.

- roots:

  A vector giving the vertices from which the breadth-first search is
  performed. Typically it contains one vertex per component.

## Related documentation in the C library

[[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_unfold_tree),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
