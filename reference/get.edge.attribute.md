# Query edge attributes of a graph

**\[deprecated\]**

`get.edge.attribute()` was renamed to
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md) to create a
more consistent API.

## Usage

``` r
get.edge.attribute(graph, name, index = E(graph))
```

## Arguments

- graph:

  The graph

- name:

  The name of the attribute to query. If missing, then all edge
  attributes are returned in a list.

- index:

  An optional edge sequence to query edge attributes for a subset of
  edges.
