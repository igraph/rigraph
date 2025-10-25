# Simple grid layout

**\[deprecated\]**

Use
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md).

## Usage

``` r
layout.grid.3d(graph, width = 0, height = 0)
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
