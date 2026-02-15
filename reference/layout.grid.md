# Simple grid layout

**\[deprecated\]**

`layout.grid()` was renamed to
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md)
to create a more consistent API.

## Usage

``` r
layout.grid(graph, width = 0, height = 0, dim = 2)
```

## Arguments

- graph:

  The input graph.

- width:

  The number of vertices in a single row of the grid. If this is zero or
  negative, then for 2d layouts the width of the grid will be the square
  root of the number of vertices in the graph, rounded up to the next
  integer. Similarly, it will be the cube root for 3d layouts.

- height:

  The number of vertices in a single column of the grid, for three
  dimensional layouts. If this is zero or negative, then it is
  determinted automatically.

- dim:

  Two or three. Whether to make 2d or a 3d layout.

## Related documentation in the C library

[`layout_grid`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_grid),
[`layout_grid_3d`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_grid_3d)
