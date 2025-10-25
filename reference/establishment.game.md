# Graph generation based on different vertex types

**\[deprecated\]**

`establishment.game()` was renamed to
[`sample_traits()`](https://r.igraph.org/reference/sample_traits_callaway.md)
to create a more consistent API.

## Usage

``` r
establishment.game(
  nodes,
  types,
  k = 1,
  type.dist = rep(1, types),
  pref.matrix = matrix(1, types, types),
  directed = FALSE
)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- types:

  The number of different vertex types.

- k:

  The number of trials per time step, see details below.

- type.dist:

  The distribution of the vertex types. This is assumed to be stationary
  in time.

- pref.matrix:

  A matrix giving the preferences of the given vertex types. These
  should be probabilities, i.e. numbers between zero and one.

- directed:

  Logical constant, whether to generate directed graphs.
