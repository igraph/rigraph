# Query vertex attributes of a graph

**\[deprecated\]**

`get.vertex.attribute()` was renamed to
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md) to
create a more consistent API.

## Usage

``` r
get.vertex.attribute(graph, name, index = V(graph))
```

## Arguments

- graph:

  The graph.

- name:

  Name of the attribute to query. If missing, then all vertex attributes
  are returned in a list.

- index:

  An optional vertex sequence to query the attribute only for these
  vertices.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
