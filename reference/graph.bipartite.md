# Create a bipartite graph

**\[deprecated\]**

`graph.bipartite()` was renamed to
[`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)
to create a more consistent API.

## Usage

``` r
graph.bipartite(types, edges, directed = FALSE)
```

## Arguments

- types:

  A vector giving the vertex types. It will be coerced into boolean. The
  length of the vector gives the number of vertices in the graph. When
  the vector is a named vector, the names will be attached to the graph
  as the `name` vertex attribute.

- edges:

  A vector giving the edges of the graph, the same way as for the
  regular [`make_graph()`](https://r.igraph.org/reference/make_graph.md)
  function. It is checked that the edges indeed connect vertices of
  different kind, according to the supplied `types` vector. The vector
  may be a string vector if `types` is a named vector.

- directed:

  Whether to create a directed graph, boolean constant. Note that by
  default undirected graphs are created, as this is more common for
  bipartite graphs.
