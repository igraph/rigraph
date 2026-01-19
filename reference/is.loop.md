# Find the multiple or loop edges in a graph

**\[deprecated\]**

`is.loop()` was renamed to
[`which_loop()`](https://r.igraph.org/reference/which_multiple.md) to
create a more consistent API.

## Usage

``` r
is.loop(graph, eids = E(graph))
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.
