# Getting and setting graph attributes, shortcut

The `$` operator is a shortcut to get and and set graph attributes. It
is shorter and just as readable as
[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md) and
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md).

## Usage

``` r
# S3 method for class 'igraph'
x$name

# S3 method for class 'igraph'
x$name <- value
```

## Arguments

- x:

  An igraph graph

- name:

  Name of the attribute to get/set.

- value:

  New value of the graph attribute.

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
g <- make_ring(10)
g$name
#> [1] "Ring graph"
g$name <- "10-ring"
g$name
#> [1] "10-ring"
```
