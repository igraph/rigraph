# Randomly place vertices on a plane or in 3d space

This function uniformly randomly places the vertices of the graph in two
or three dimensions.

## Usage

``` r
layout_randomly(graph, dim = c(2, 3))

randomly(...)
```

## Arguments

- graph:

  The input graph.

- dim:

  Integer scalar, the dimension of the space to use. It must be 2 or 3.

- ...:

  Parameters to pass to `layout_randomly()`.

## Value

A numeric matrix with two or three columns.

## Details

Randomly places vertices on a \[-1,1\] square (in 2d) or in a cube (in
3d). It is probably a useless layout, but it can use as a starting point
for other layout generators.

## Related documentation in the C library

[`layout_random()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_random),
[`layout_random_3d()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_random_3d)

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

Gabor Csardi <csardi.gabor@gmail.com>
