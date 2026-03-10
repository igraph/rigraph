# Graph generation based on different vertex types

**\[deprecated\]**

`callaway.traits.game()` was renamed to
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md)
to create a more consistent API.

## Usage

``` r
callaway.traits.game(
  nodes,
  types,
  edge.per.step = 1,
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

- edge.per.step:

  The number of edges to add to the graph per time step.

- type.dist:

  The distribution of the vertex types. This is assumed to be stationary
  in time.

- pref.matrix:

  A matrix giving the preferences of the given vertex types. These
  should be probabilities, i.e. numbers between zero and one.

- directed:

  Logical constant, whether to generate directed graphs.

## Related documentation in the C library

[`callaway_traits_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_callaway_traits_game)
