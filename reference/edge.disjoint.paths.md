# Edge connectivity

**\[deprecated\]**

`edge.disjoint.paths()` was renamed to
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)
to create a more consistent API.

## Usage

``` r
edge.disjoint.paths(graph, source = NULL, target = NULL, checks = TRUE)
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

[`st_edge_connectivity()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_st_edge_connectivity),
[[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_edge_connectivity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
