# Trait-based random generation

**\[deprecated\]**

`preference.game()` was renamed to
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md) to
create a more consistent API.

## Usage

``` r
preference.game(
  nodes,
  types,
  type.dist = rep(1, types),
  fixed.sizes = FALSE,
  pref.matrix = matrix(1, types, types),
  directed = FALSE,
  loops = FALSE
)
```

## Arguments

- nodes:

  The number of vertices in the graphs.

- types:

  The number of different vertex types.

- type.dist:

  The distribution of the vertex types, a numeric vector of length
  ‘types’ containing non-negative numbers. The vector will be normed to
  obtain probabilities.

- fixed.sizes:

  Fix the number of vertices with a given vertex type label. The
  `type.dist` argument gives the group sizes (i.e. number of vertices
  with the different labels) in this case.

- pref.matrix:

  A square matrix giving the preferences of the vertex types. The matrix
  has ‘types’ rows and columns. When generating an undirected graph, it
  must be symmetric.

- directed:

  Logical scalar, whether to create a directed graph.

- loops:

  Logical scalar, whether self-loops are allowed in the graph.
