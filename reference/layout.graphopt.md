# The graphopt layout algorithm

**\[deprecated\]**

`layout.graphopt()` was renamed to
[`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md)
to create a more consistent API.

## Usage

``` r
layout.graphopt(
  graph,
  start = NULL,
  niter = 500,
  charge = 0.001,
  mass = 30,
  spring.length = 0,
  spring.constant = 1,
  max.sa.movement = 5
)
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
