# Graph layout by multidimensional scaling

Multidimensional scaling of some distance matrix defined on the vertices
of a graph.

## Usage

``` r
layout_with_mds(graph, dist = NULL, dim = 2, options = arpack_defaults())

with_mds(...)
```

## Arguments

- graph:

  The input graph.

- dist:

  The distance matrix for the multidimensional scaling. If `NULL` (the
  default), then the unweighted shortest path matrix is used.

- dim:

  `layout_with_mds()` supports dimensions up to the number of nodes
  minus one, but only if the graph is connected; for unconnected graphs,
  the only possible value is 2. This is because
  [`merge_coords()`](https://r.igraph.org/reference/merge_coords.md)
  only works in 2D.

- options:

  This is currently ignored, as ARPACK is not used any more for solving
  the eigenproblem

- ...:

  Passed to `layout_with_mds()`.

## Value

A numeric matrix with `dim` columns.

## Details

`layout_with_mds()` uses classical multidimensional scaling (Torgerson
scaling) for generating the coordinates. Multidimensional scaling aims
to place points from a higher dimensional space in a (typically) 2
dimensional plane, so that the distances between the points are kept as
much as this is possible.

By default igraph uses the shortest path matrix as the distances between
the nodes, but the user can override this via the `dist` argument.

Warning: If the graph is symmetric to the exchange of two vertices (as
is the case with leaves of a tree connecting to the same parent),
classical multidimensional scaling may assign the same coordinates to
these vertices.

This function generates the layout separately for each graph component
and then merges them via
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md).

## References

Cox, T. F. and Cox, M. A. A. (2001) *Multidimensional Scaling*. Second
edition. Chapman and Hall.

## See also

[`layout()`](https://r.igraph.org/reference/layout_.md),
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)

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
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnp(100, 2 / 100)
l <- layout_with_mds(g)
plot(g, layout = l, vertex.label = NA, vertex.size = 3)
```
