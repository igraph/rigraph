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
