# The graphopt layout algorithm

A force-directed layout algorithm, that scales relatively well to large
graphs.

## Usage

``` r
layout_with_graphopt(
  graph,
  start = NULL,
  niter = 500,
  charge = 0.001,
  mass = 30,
  spring.length = 0,
  spring.constant = 1,
  max.sa.movement = 5
)

with_graphopt(...)
```

## Arguments

- graph:

  The input graph.

- start:

  If given, then it should be a matrix with two columns and one line for
  each vertex. This matrix will be used as starting positions for the
  algorithm. If not given, then a random starting matrix is used.

- niter:

  Integer scalar, the number of iterations to perform. Should be a
  couple of hundred in general. If you have a large graph then you might
  want to only do a few iterations and then check the result. If it is
  not good enough you can feed it in again in the `start` argument. The
  default value is 500.

- charge:

  The charge of the vertices, used to calculate electric repulsion. The
  default is 0.001.

- mass:

  The mass of the vertices, used for the spring forces. The default is
  30.

- spring.length:

  The length of the springs, an integer number. The default value is
  zero.

- spring.constant:

  The spring constant, the default value is one.

- max.sa.movement:

  Real constant, it gives the maximum amount of movement allowed in a
  single step along a single axis. The default value is 5.

- ...:

  Passed to `layout_with_graphopt()`.

## Value

A numeric matrix with two columns, and a row for each vertex.

## Details

`layout_with_graphopt()` is a port of the graphopt layout algorithm by
Michael Schmuhl. graphopt version 0.4.1 was rewritten in C and the
support for layers was removed (might be added later) and a code was a
bit reorganized to avoid some unnecessary steps is the node charge (see
below) is zero.

graphopt uses physical analogies for defining attracting and repelling
forces among the vertices and then the physical system is simulated
until it reaches an equilibrium. (There is no simulated annealing or
anything like that, so a stable fixed point is not guaranteed.)

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
[`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md),
[`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md),
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Michael Schmuhl for the original graphopt code, rewritten and wrapped by
Gabor Csardi <csardi.gabor@gmail.com>.
