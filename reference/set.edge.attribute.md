# Set edge attributes

**\[deprecated\]**

`set.edge.attribute()` was renamed to
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md) to
create a more consistent API.

## Usage

``` r
set.edge.attribute(graph, name, index = E(graph), value)
```

## Arguments

- graph:

  The graph

- name:

  The name of the attribute to set.

- index:

  An optional edge sequence to set the attributes of a subset of edges.

- value:

  The new value of the attribute for all (or `index`) edges. If `NULL`,
  the input is returned unchanged.
