# Create a graph from an isomorphism class

**\[deprecated\]**

`graph.isocreate()` was renamed to
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md)
to create a more consistent API.

## Usage

``` r
graph.isocreate(size, number, directed = TRUE)
```

## Arguments

- size:

  The number of vertices in the graph.

- number:

  The isomorphism class.

- directed:

  Whether to create a directed graph (the default).
