# Set vertex attributes

**\[deprecated\]**

`set.vertex.attribute()` was renamed to
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md)
to create a more consistent API.

## Usage

``` r
set.vertex.attribute(graph, name, index = V(graph), value)
```

## Arguments

- graph:

  The graph.

- name:

  The name of the attribute to set.

- index:

  An optional vertex sequence to set the attributes of a subset of
  vertices.

- value:

  The new value of the attribute for all (or `index`) vertices. If
  `NULL`, the input is returned unchanged.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
