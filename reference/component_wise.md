# Component-wise layout

This is a layout modifier function, and it can be used to calculate the
layout separately for each component of the graph.

## Usage

``` r
component_wise(merge_method = "dla")
```

## Arguments

- merge_method:

  Merging algorithm, the `method` argument of
  [`merge_coords()`](https://r.igraph.org/reference/merge_coords.md).

## See also

[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md).

Other layout modifiers:
[`layout_modifier()`](https://r.igraph.org/reference/layout_modifier.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
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
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Examples

``` r
g <- make_ring(10) + make_ring(10)
g %>%
  add_layout_(in_circle(), component_wise()) %>%
  plot()
```
