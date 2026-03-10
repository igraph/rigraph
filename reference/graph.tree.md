# Create tree graphs

**\[deprecated\]**

`graph.tree()` was renamed to
[`make_tree()`](https://r.igraph.org/reference/make_tree.md) to create a
more consistent API.

## Usage

``` r
graph.tree(n, children = 2, mode = c("out", "in", "undirected"))
```

## Arguments

- n:

  Number of vertices.

- children:

  Integer scalar, the number of children of a vertex (except for leafs)

- mode:

  Defines the direction of the edges. `out` indicates that the edges
  point from the parent to the children, `in` indicates that they point
  from the children to their parents, while `undirected` creates an
  undirected graph.

## Related documentation in the C library

[`kary_tree()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_kary_tree)
