# Project a bipartite graph

**\[deprecated\]**

`bipartite.projection.size()` was renamed to
[`bipartite_projection_size()`](https://r.igraph.org/reference/bipartite_projection.md)
to create a more consistent API.

## Usage

``` r
bipartite.projection.size(graph, types = NULL)
```

## Arguments

- graph:

  The input graph. It can be directed, but edge directions are ignored
  during the computation.

- types:

  An optional vertex type vector to use instead of the ‘`type`’ vertex
  attribute. You must supply this argument if the graph has no ‘`type`’
  vertex attribute.

## Related documentation in the C library

[[`bipartite_projection_size()`](https://r.igraph.org/reference/bipartite_projection.md)](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_bipartite_projection_size),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
