# Simple grid layout

This layout places vertices on a rectangular grid, in two or three
dimensions.

## Usage

``` r
layout_on_grid(graph, width = 0, height = 0, dim = 2)

on_grid(...)
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

- ...:

  Passed to `layout_on_grid()`.

## Value

A two-column or three-column matrix.

## Details

The function places the vertices on a simple rectangular grid, one after
the other. If you want to change the order of the vertices, then see the
[`permute()`](https://r.igraph.org/reference/permute.md) function.

## Related documentation in the C library

[`layout_grid()`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_grid),
[`layout_grid_3d()`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_grid_3d)

## See also

[`layout()`](https://r.igraph.org/reference/layout_.md) for other layout
generators

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md),
[`layout_on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md),
[`layout_randomly()`](https://r.igraph.org/reference/layout_randomly.md),
[`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md),
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
[`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md),
[`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md),
[`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md),
[`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md),
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
g <- make_lattice(c(3, 3))
layout_on_grid(g)
#>       [,1] [,2]
#>  [1,]    0    0
#>  [2,]    1    0
#>  [3,]    2    0
#>  [4,]    0    1
#>  [5,]    1    1
#>  [6,]    2    1
#>  [7,]    0    2
#>  [8,]    1    2
#>  [9,]    2    2

g2 <- make_lattice(c(3, 3, 3))
layout_on_grid(g2, dim = 3)
#>       [,1] [,2] [,3]
#>  [1,]    0    0    0
#>  [2,]    1    0    0
#>  [3,]    2    0    0
#>  [4,]    0    1    0
#>  [5,]    1    1    0
#>  [6,]    2    1    0
#>  [7,]    0    2    0
#>  [8,]    1    2    0
#>  [9,]    2    2    0
#> [10,]    0    0    1
#> [11,]    1    0    1
#> [12,]    2    0    1
#> [13,]    0    1    1
#> [14,]    1    1    1
#> [15,]    2    1    1
#> [16,]    0    2    1
#> [17,]    1    2    1
#> [18,]    2    2    1
#> [19,]    0    0    2
#> [20,]    1    0    2
#> [21,]    2    0    2
#> [22,]    0    1    2
#> [23,]    1    1    2
#> [24,]    2    1    2
#> [25,]    0    2    2
#> [26,]    1    2    2
#> [27,]    2    2    2

plot(g, layout = layout_on_grid)

if (interactive() && requireNamespace("rgl", quietly = TRUE)) {
  rglplot(g, layout = layout_on_grid(g, dim = 3))
}
```
