# Normalize layout

Scale coordinates of a layout.

## Usage

``` r
normalize(
  xmin = -1,
  xmax = 1,
  ymin = xmin,
  ymax = xmax,
  zmin = xmin,
  zmax = xmax
)
```

## Arguments

- xmin, xmax:

  Minimum and maximum for x coordinates.

- ymin, ymax:

  Minimum and maximum for y coordinates.

- zmin, zmax:

  Minimum and maximum for z coordinates.

## See also

[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md).

Other layout modifiers:
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_modifier()`](https://r.igraph.org/reference/layout_modifier.md)

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md),
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md),
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
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md)

## Examples

``` r
layout_(make_ring(10), with_fr(), normalize())
#>             [,1]         [,2]
#>  [1,]  0.3098611 -1.000000000
#>  [2,]  0.8102587 -0.629488106
#>  [3,]  1.0000000 -0.007244444
#>  [4,]  0.7955051  0.615951717
#>  [5,]  0.2928537  0.993064922
#>  [6,] -0.3167327  1.000000000
#>  [7,] -0.8126155  0.626816032
#>  [8,] -1.0000000  0.001603550
#>  [9,] -0.7996484 -0.620430877
#> [10,] -0.2982000 -0.998501399
```
