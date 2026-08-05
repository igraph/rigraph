# Normalize layout

Scale coordinates of a layout.

## Usage

``` r
normalize(
  xmin = -1,
  xmax = 1,
  ymin = NULL,
  ymax = NULL,
  zmin = NULL,
  zmax = NULL
)
```

## Arguments

- xmin, xmax:

  Minimum and maximum for x coordinates.

- ymin, ymax:

  Minimum and maximum for y coordinates. When omitted, they follow
  `xmin` and `xmax`; `NULL` disables normalization along this axis.

- zmin, zmax:

  Minimum and maximum for z coordinates. When omitted, they follow
  `xmin` and `xmax`; `NULL` disables normalization along this axis.

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
#>             [,1]        [,2]
#>  [1,]  0.7738661 -0.63329611
#>  [2,]  1.0000000 -0.01457634
#>  [3,]  0.8336608  0.61930828
#>  [4,]  0.3436190  1.00000000
#>  [5,] -0.2645944  0.99545569
#>  [6,] -0.7727763  0.62808822
#>  [7,] -1.0000000  0.01209923
#>  [8,] -0.8366545 -0.62163536
#>  [9,] -0.3437400 -1.00000000
#> [10,]  0.2636660 -0.99741995
```
