# Find the edge ids based on the incident vertices of the edges

**\[deprecated\]**

`get.edge.ids()` was renamed to
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md) to
create a more consistent API.

## Usage

``` r
get.edge.ids(graph, vp, directed = TRUE, error = FALSE, multi = deprecated())
```

## Arguments

- graph:

  The input graph.

- vp:

  The incident vertices, given as a two-column data frame, two-column
  matrix, or vector of vertex ids or symbolic vertex names. For a
  vector, the values are interpreted pairwise, i.e. the first and second
  are used for the first edge, the third and fourth for the second, etc.

- directed:

  Logical scalar, whether to consider edge directions in directed
  graphs. This argument is ignored for undirected graphs.

- error:

  Logical scalar, whether to report an error if an edge is not found in
  the graph. If `FALSE`, then no error is reported, and zero is returned
  for the non-existant edge(s).

- multi:

  **\[deprecated\]**

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
