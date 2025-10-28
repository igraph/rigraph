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
[`component_wise()`](https://r.igraph.org/reference/component_wise.md)

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
#>  [1,]  0.2811658 -1.00000000
#>  [2,]  0.7909317 -0.63507932
#>  [3,]  1.0000000 -0.03024950
#>  [4,]  0.8333225  0.58294920
#>  [5,]  0.3427992  0.98092922
#>  [6,] -0.2791935  1.00000000
#>  [7,] -0.7907697  0.63044139
#>  [8,] -1.0000000  0.02539405
#>  [9,] -0.8309357 -0.59098622
#> [10,] -0.3423460 -0.98625007
```
