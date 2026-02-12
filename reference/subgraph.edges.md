# Subgraph of a graph

**\[deprecated\]**

`subgraph.edges()` was renamed to
[`subgraph_from_edges()`](https://r.igraph.org/reference/subgraph.md) to
create a more consistent API.

## Usage

``` r
subgraph.edges(graph, eids, delete.vertices = TRUE)
```

## Arguments

- graph:

  The original graph.

- eids:

  The edge ids of the edges that will be kept in the result graph.

- delete.vertices:

  Logical scalar, whether to remove vertices that do not have any
  adjacent edges in `eids`.
