# Normalize coordinates for plotting graphs

Rescale coordinates linearly to be within given bounds.

## Usage

``` r
norm_coords(
  layout,
  xmin = -1,
  xmax = 1,
  ymin = -1,
  ymax = 1,
  zmin = -1,
  zmax = 1
)
```

## Arguments

- layout:

  A matrix with two or three columns, the layout to normalize.

- xmin, xmax:

  The limits for the first coordinate, if one of them or both are `NULL`
  then no normalization is performed along this direction.

- ymin, ymax:

  The limits for the second coordinate, if one of them or both are
  `NULL` then no normalization is performed along this direction.

- zmin, zmax:

  The limits for the third coordinate, if one of them or both are `NULL`
  then no normalization is performed along this direction.

## Value

A numeric matrix with at the same dimension as `layout`.

## Details

`norm_coords()` normalizes a layout, it linearly transforms each
coordinate separately to fit into the given limits.

## See also

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
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
