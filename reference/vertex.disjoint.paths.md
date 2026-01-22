# Vertex connectivity

**\[deprecated\]**

`vertex.disjoint.paths()` was renamed to
[`vertex_disjoint_paths()`](https://r.igraph.org/reference/vertex_connectivity.md)
to create a more consistent API.

## Usage

``` r
vertex.disjoint.paths(graph, source = NULL, target = NULL)
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

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
