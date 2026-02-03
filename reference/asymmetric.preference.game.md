# Trait-based random generation

**\[deprecated\]**

`asymmetric.preference.game()` was renamed to
[`sample_asym_pref()`](https://r.igraph.org/reference/sample_pref.md) to
create a more consistent API.

## Usage

``` r
asymmetric.preference.game(
  nodes,
  types,
  type.dist.matrix = matrix(1, types, types),
  pref.matrix = matrix(1, types, types),
  loops = FALSE
)
```

## Arguments

- nodes:

  The number of vertices in the graphs.

- types:

  The number of different vertex types.

- type.dist.matrix:

  The joint distribution of the in- and out-vertex types.

- pref.matrix:

  A square matrix giving the preferences of the vertex types. The matrix
  has ‘types’ rows and columns. When generating an undirected graph, it
  must be symmetric.

- loops:

  Logical scalar, whether self-loops are allowed in the graph.

## Related documentation in the C library

[`asymmetric_preference_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_asymmetric_preference_game),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
