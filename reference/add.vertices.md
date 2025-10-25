# Add vertices to a graph

**\[deprecated\]**

`add.vertices()` was renamed to
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md) to
create a more consistent API.

## Usage

``` r
add.vertices(graph, nv, ..., attr = list())
```

## Arguments

- graph:

  The input graph.

- nv:

  The number of vertices to add.

- ...:

  Additional arguments, they must be named, and they will be added as
  vertex attributes, for the newly added vertices. See also details
  below.

- attr:

  A named list, its elements will be added as vertex attributes, for the
  newly added vertices. See also details below.
