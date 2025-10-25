# Query or set attributes of the vertices in a vertex sequence

The `$` operator is a syntactic sugar to query and set the attributes of
the vertices in a vertex sequence.

## Usage

``` r
# S3 method for class 'igraph.vs'
x[[i]] <- value

# S3 method for class 'igraph.vs'
x[i] <- value

# S3 method for class 'igraph.vs'
x$name

# S3 method for class 'igraph.vs'
x$name <- value

V(x) <- value
```

## Arguments

- x:

  A vertex sequence. For `V<-` it is a graph.

- i:

  Index.

- value:

  New value of the attribute, for the vertices in the vertex sequence.

- name:

  Name of the vertex attribute to query or set.

## Value

A vector or list, containing the values of attribute `name` for the
vertices in the vertex sequence. For numeric, character or logical
attributes, it is a vector of the appropriate type, otherwise it is a
list.

## Details

The query form of `$` is a shortcut for
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md), e.g.
`V(g)[idx]$attr` is equivalent to `vertex_attr(g, attr, V(g)[idx])`.

The assignment form of `$` is a shortcut for
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
e.g. `V(g)[idx]$attr <- value` is equivalent to
`g <- set_vertex_attr(g, attr, V(g)[idx], value)`.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
[`print.igraph.es()`](https://r.igraph.org/reference/print.igraph.es.md),
[`print.igraph.vs()`](https://r.igraph.org/reference/print.igraph.vs.md)

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
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md),
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
`vertex_attr<-()`,
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_(
  ring(10),
  with_vertex_(
    name = LETTERS[1:10],
    color = sample(1:2, 10, replace = TRUE)
  )
)
V(g)$name
#>  [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J"
V(g)$color
#>  [1] 2 1 1 1 1 2 1 1 2 2
V(g)$frame.color <- V(g)$color

# color vertices of the largest component
largest_comp <- function(graph) {
  cl <- components(graph)
  V(graph)[which.max(cl$csize) == cl$membership]
}
g <- sample_(
  gnp(100, 2 / 100),
  with_vertex_(size = 3, label = ""),
  with_graph_(layout = layout_with_fr)
)
giant_v <- largest_comp(g)
V(g)$color <- "blue"
V(g)[giant_v]$color <- "orange"
plot(g)
```
