# Number of automorphisms

**\[deprecated\]**

`automorphisms()` was renamed to
[`count_automorphisms()`](https://r.igraph.org/reference/count_automorphisms.md)
to create a more consistent API.

## Usage

``` r
automorphisms(
  graph,
  colors = NULL,
  sh = c("fm", "f", "fs", "fl", "flm", "fsm")
)
```

## Arguments

- graph:

  The input graph, it is treated as undirected.

- colors:

  The colors of the individual vertices of the graph; only vertices
  having the same color are allowed to match each other in an
  automorphism. When omitted, igraph uses the `color` attribute of the
  vertices, or, if there is no such vertex attribute, it simply assumes
  that all vertices have the same color. Pass NULL explicitly if the
  graph has a `color` vertex attribute but you do not want to use it.

- sh:

  The splitting heuristics for the BLISS algorithm. Possible values are:
  ‘`f`’: first non-singleton cell, ‘`fl`’: first largest non-singleton
  cell, ‘`fs`’: first smallest non-singleton cell, ‘`fm`’: first
  maximally non-trivially connected non-singleton cell, ‘`flm`’: first
  largest maximally non-trivially connected non-singleton cell, ‘`fsm`’:
  first smallest maximally non-trivially connected non-singleton cell.
