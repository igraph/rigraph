# Dominator tree

**\[deprecated\]**

`dominator.tree()` was renamed to
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md)
to create a more consistent API.

## Usage

``` r
dominator.tree(graph, root, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  A directed graph. If it is not a flowgraph, and it contains some
  vertices not reachable from the root vertex, then these vertices will
  be collected and returned as part of the result.

- root:

  The id of the root (or source) vertex, this will be the root of the
  tree.

- mode:

  Constant, must be ‘`in`’ or ‘`out`’. If it is ‘`in`’, then all
  directions are considered as opposite to the original one in the input
  graph.
