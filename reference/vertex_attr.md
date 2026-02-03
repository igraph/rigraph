# Query vertex attributes of a graph

Query vertex attributes of a graph

## Usage

``` r
vertex_attr(graph, name, index = V(graph))
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

## Value

The value of the vertex attribute, or the list of all vertex attributes,
if `name` is missing.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

Vertex, edge and graph attributes
[`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md),
[`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md),
[`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md),
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md),
`edge_attr<-()`,
[`edge_attr_names()`](https://r.igraph.org/reference/edge_attr_names.md),
[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md),
`graph_attr<-()`,
[`graph_attr_names()`](https://r.igraph.org/reference/graph_attr_names.md),
[`igraph-attribute-combination`](https://r.igraph.org/reference/igraph-attribute-combination.md),
[`igraph-dollar`](https://r.igraph.org/reference/igraph-dollar.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md),
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md),
`vertex_attr<-()`,
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_ring(10) %>%
  set_vertex_attr("color", value = "red") %>%
  set_vertex_attr("label", value = letters[1:10])
vertex_attr(g, "label")
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
vertex_attr(g)
#> $color
#>  [1] "red" "red" "red" "red" "red" "red" "red" "red" "red" "red"
#> 
#> $label
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
#> 
plot(g)
```
