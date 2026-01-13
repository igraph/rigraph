# Edge connectivity

**\[deprecated\]**

`edge.connectivity()` was renamed to
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)
to create a more consistent API.

## Usage

``` r
edge.connectivity(graph, source = NULL, target = NULL, checks = TRUE)
```

## Arguments

- graph:

  The input graph.

- source:

  The id of the source vertex, for
  [`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)
  it can be `NULL`, see details below.

- target:

  The id of the target vertex, for
  [`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)
  it can be `NULL`, see details below.

- checks:

  Logical constant. Whether to check that the graph is connected and
  also the degree of the vertices. If the graph is not (strongly)
  connected then the connectivity is obviously zero. Otherwise if the
  minimum degree is one then the edge connectivity is also one. It is a
  good idea to perform these checks, as they can be done quickly
  compared to the connectivity calculation itself. They were suggested
  by Peter McMahan, thanks Peter.

## Related documentation in the C library

[[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)](https://igraph.org/c/html/latest/igraph-Flows.html#igraph_edge_connectivity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
