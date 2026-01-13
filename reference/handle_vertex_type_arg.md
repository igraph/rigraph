# Common handler for vertex type arguments in igraph functions

This function takes the `types` and `graph` arguments from a public
igraph function call and validates the vertex type vector.

## Usage

``` r
handle_vertex_type_arg(types, graph, required = T)
```

## Arguments

- types:

  the vertex types

- graph:

  the graph

- required:

  whether the graph has to be bipartite

## Value

A logical vector representing the resolved vertex type for each vertex
in the graph

## Details

When the provided vertex types are NULL and the graph has a `types`
vertex attribute, then the value of this vertex attribute will be used
as vertex types. Non-logical vertex type vectors are coerced into
logical vectors after printing a warning.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## Author

Tamas Nepusz <ntamas@gmail.com>
