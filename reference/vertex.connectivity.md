# Vertex connectivity

**\[deprecated\]**

`vertex.connectivity()` was renamed to
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)
to create a more consistent API.

## Usage

``` r
vertex.connectivity(graph, source = NULL, target = NULL, checks = TRUE)
```

## Arguments

- source:

  The id of the source vertex, for
  [`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)
  it can be `NULL`, see details below.

- target:

  The id of the target vertex, for
  [`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)
  it can be `NULL`, see details below.

- checks:

  Logical constant. Whether to check that the graph is connected and
  also the degree of the vertices. If the graph is not (strongly)
  connected then the connectivity is obviously zero. Otherwise if the
  minimum degree is one then the vertex connectivity is also one. It is
  a good idea to perform these checks, as they can be done quickly
  compared to the connectivity calculation itself. They were suggested
  by Peter McMahan, thanks Peter.

## Related documentation in the C library

[`st_vertex_connectivity()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_st_vertex_connectivity),
[[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_vertex_connectivity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
