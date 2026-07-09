# Chordality of a graph

**\[deprecated\]**

`is.chordal()` was renamed to
[`is_chordal()`](https://r.igraph.org/reference/is_chordal.md) to create
a more consistent API.

## Usage

``` r
is.chordal(
  graph,
  alpha = NULL,
  alpham1 = NULL,
  fillin = FALSE,
  newgraph = FALSE
)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored,
  as the algorithm is defined for undirected graphs.

- alpha:

  Numeric vector, the maximal chardinality ordering of the vertices. If
  it is `NULL`, then it is automatically calculated by calling
  [`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md),
  or from `alpham1` if that is given..

- alpham1:

  Numeric vector, the inverse of `alpha`. If it is `NULL`, then it is
  automatically calculated by calling
  [`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md),
  or from `alpha`.

- fillin:

  Logical scalar, whether to calculate the fill-in edges.

- newgraph:

  Logical scalar, whether to calculate the triangulated graph.
