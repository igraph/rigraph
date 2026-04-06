# Large Graph Layout

A layout generator for larger graphs.

## Usage

``` r
layout_with_lgl(
  graph,
  maxiter = 150,
  maxdelta = vcount(graph),
  area = vcount(graph)^2,
  coolexp = 1.5,
  repulserad = area * vcount(graph),
  cellsize = sqrt(sqrt(area)),
  root = NULL
)

with_lgl(...)
```

## Arguments

- graph:

  The input graph

- maxiter:

  The maximum number of iterations to perform (150).

- maxdelta:

  The maximum change for a vertex during an iteration (the number of
  vertices).

- area:

  The area of the surface on which the vertices are placed (square of
  the number of vertices).

- coolexp:

  The cooling exponent of the simulated annealing (1.5).

- repulserad:

  Cancellation radius for the repulsion (the `area` times the number of
  vertices).

- cellsize:

  The size of the cells for the grid. When calculating the repulsion
  forces between vertices only vertices in the same or neighboring grid
  cells are taken into account (the fourth root of the number of `area`.

- root:

  The id of the vertex to place at the middle of the layout. The default
  value is -1 which means that a random vertex is selected.

- ...:

  Passed to `layout_with_lgl()`.

## Value

A numeric matrix with two columns and as many rows as vertices.

## Details

`layout_with_lgl()` is for large connected graphs, it is similar to the
layout generator of the Large Graph Layout software
(<https://lgl.sourceforge.net/>).

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
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
