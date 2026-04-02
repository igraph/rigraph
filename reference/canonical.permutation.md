# Canonical permutation of a graph

**\[deprecated\]**

`canonical.permutation()` was renamed to
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
to create a more consistent API.

## Usage

``` r
canonical.permutation(
  graph,
  colors = NULL,
  sh = c("fm", "f", "fs", "fl", "flm", "fsm")
)
```

## Arguments

- graph:

  The input graph, treated as undirected.

- colors:

  The colors of the individual vertices of the graph; only vertices
  having the same color are allowed to match each other in an
  automorphism. When omitted, igraph uses the `color` attribute of the
  vertices, or, if there is no such vertex attribute, it simply assumes
  that all vertices have the same color. Pass NULL explicitly if the
  graph has a `color` vertex attribute but you do not want to use it.

- sh:

  Type of the heuristics to use for the BLISS algorithm. See details for
  possible values.
