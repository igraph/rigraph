# The Watts-Strogatz small-world model

**\[deprecated\]**

`watts.strogatz.game()` was renamed to
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md)
to create a more consistent API.

## Usage

``` r
watts.strogatz.game(dim, size, nei, p, loops = FALSE, multiple = FALSE)
```

## Arguments

- dim:

  Integer constant, the dimension of the starting lattice.

- size:

  Integer constant, the size of the lattice along each dimension.

- nei:

  Integer constant, the neighborhood within which the vertices of the
  lattice will be connected.

- p:

  Real constant between zero and one, the rewiring probability.

- loops:

  Logical scalar, whether loops edges are allowed in the generated
  graph.

- multiple:

  Logical scalar, whether multiple edges are allowed int the generated
  graph.
