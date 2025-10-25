# Kleinberg's hub and authority centrality scores.

**\[deprecated\]**

`hub.score()` was renamed to
[`hub_score()`](https://r.igraph.org/reference/hub_score.md) to create a
more consistent API.

## Usage

``` r
hub.score(graph, scale = TRUE, weights = NULL, options = arpack_defaults())
```

## Arguments

- graph:

  The input graph.

- scale:

  Logical scalar, whether to scale the result to have a maximum score of
  one. If no scaling is used then the result vector has unit length in
  the Euclidean norm.

- weights:

  Optional positive weight vector for calculating weighted scores. If
  the graph has a `weight` edge attribute, then this is used by default.
  This function interprets edge weights as connection strengths. In the
  random surfer model, an edge with a larger weight is more likely to be
  selected by the surfer.

- options:

  A named list, to override some ARPACK options. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.
