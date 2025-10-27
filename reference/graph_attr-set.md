# Set all or some graph attributes

Set all or some graph attributes

## Usage

``` r
graph_attr(graph, name) <- value
```

## Arguments

- graph:

  The graph.

- name:

  The name of the attribute to set. If missing, then `value` should be a
  named list, and all list members are set as attributes.

- value:

  The value of the attribute to set

## Value

The graph, with the attribute(s) added.

## See also

Vertex, edge and graph attributes
[`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md),
[`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md),
[`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md),
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md),
`edge_attr<-()`,
[`edge_attr_names()`](https://r.igraph.org/reference/edge_attr_names.md),
[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md),
[`graph_attr_names()`](https://r.igraph.org/reference/graph_attr_names.md),
[`igraph-attribute-combination`](https://r.igraph.org/reference/igraph-attribute-combination.md),
[`igraph-dollar`](https://r.igraph.org/reference/igraph-dollar.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md),
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
`vertex_attr<-()`,
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_graph(~ A - B:C:D)
graph_attr(g, "name") <- "4-star"
g
#> IGRAPH 5000335 UN-- 4 3 -- 4-star
#> + attr: name (g/c), name (v/c)
#> + edges from 5000335 (vertex names):
#> [1] A--B A--C A--D

graph_attr(g) <- list(
  layout = layout_with_fr(g),
  name = "4-star layed out"
)
plot(g)
```
