# Query edge attributes of a graph

Query edge attributes of a graph

## Usage

``` r
edge_attr(graph, name, index = E(graph))
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

## Value

The value of the edge attribute, or the list of all edge attributes if
`name` is missing.

## See also

Vertex, edge and graph attributes
[`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md),
[`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md),
[`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md),
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
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
`vertex_attr<-()`,
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_ring(10) %>%
  set_edge_attr("weight", value = 1:10) %>%
  set_edge_attr("color", value = "red")
g
#> IGRAPH e1e408e U-W- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), weight (e/n), color
#> | (e/c)
#> + edges from e1e408e:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
plot(g, edge.width = E(g)$weight)
```
