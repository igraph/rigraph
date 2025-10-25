# Topological sorting of vertices in a graph

**\[deprecated\]**

`topological.sort()` was renamed to
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md) to create a
more consistent API.

## Usage

``` r
topological.sort(graph, mode = c("out", "all", "in"))
```

## Arguments

- graph:

  The input graph, should be directed

- mode:

  Specifies how to use the direction of the edges. For “`out`”, the
  sorting order ensures that each node comes before all nodes to which
  it has edges, so nodes with no incoming edges go first. For “`in`”, it
  is quite the opposite: each node comes before all nodes from which it
  receives edges. Nodes with no outgoing edges go first.
