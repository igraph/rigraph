# Edge connectivity

**\[deprecated\]**

`graph.adhesion()` was renamed to
[`adhesion()`](https://r.igraph.org/reference/edge_connectivity.md) to
create a more consistent API.

## Usage

``` r
graph.adhesion(graph, checks = TRUE)
```

## Arguments

- graph:

  The input graph.

- checks:

  Logical constant. Whether to check that the graph is connected and
  also the degree of the vertices. If the graph is not (strongly)
  connected then the connectivity is obviously zero. Otherwise if the
  minimum degree is one then the edge connectivity is also one. It is a
  good idea to perform these checks, as they can be done quickly
  compared to the connectivity calculation itself. They were suggested
  by Peter McMahan, thanks Peter.

## Related documentation in the C library

[`adhesion`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_adhesion)
