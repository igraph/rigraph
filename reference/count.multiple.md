# Find the multiple or loop edges in a graph

**\[deprecated\]**

`count.multiple()` was renamed to
[`count_multiple()`](https://r.igraph.org/reference/which_multiple.md)
to create a more consistent API.

## Usage

``` r
count.multiple(graph, eids = E(graph))
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.
