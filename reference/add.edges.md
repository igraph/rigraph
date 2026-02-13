# Add edges to a graph

**\[deprecated\]**

`add.edges()` was renamed to
[`add_edges()`](https://r.igraph.org/reference/add_edges.md) to create a
more consistent API.

## Usage

``` r
add.edges(graph, edges, ..., attr = list())
```

## Arguments

- graph:

  The input graph

- edges:

  The edges to add, a vertex sequence with even number of vertices.

- ...:

  Additional arguments, they must be named, and they will be added as
  edge attributes, for the newly added edges. See also details below.

- attr:

  A named list, its elements will be added as edge attributes, for the
  newly added edges. See also details below.

## Related documentation in the C library

[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
