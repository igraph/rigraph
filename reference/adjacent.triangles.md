# Find triangles in graphs

**\[deprecated\]**

`adjacent.triangles()` was renamed to
[`count_triangles()`](https://r.igraph.org/reference/count_triangles.md)
to create a more consistent API.

## Usage

``` r
adjacent.triangles(graph, vids = V(graph))
```

## Arguments

- graph:

  The input graph. It might be directed, but edge directions are
  ignored.

- vids:

  The vertices to query, all of them by default. This might be a vector
  of numeric ids, or a character vector of symbolic vertex names for
  named graphs.
