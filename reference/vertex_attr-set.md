# Set one or more vertex attributes

Set one or more vertex attributes

## Usage

``` r
vertex_attr(graph, name, index = V(graph)) <- value
```

## Arguments

- graph:

  The graph.

- name:

  The name of the vertex attribute to set. If missing, then `value` must
  be a named list, and its entries are set as vertex attributes.

- index:

  An optional vertex sequence to set the attributes of a subset of
  vertices.

- value:

  The new value of the attribute(s) for all (or `index`) vertices.

## Value

The graph, with the vertex attribute(s) added or set.

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
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_ring(10)
vertex_attr(g) <- list(
  name = LETTERS[1:10],
  color = rep("yellow", gorder(g))
)
vertex_attr(g, "label") <- V(g)$name
g
#> IGRAPH 5578ad6 UN-- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c), color
#> | (v/c), label (v/c)
#> + edges from 5578ad6 (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
plot(g)
```
