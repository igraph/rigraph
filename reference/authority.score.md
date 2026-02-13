# Kleinberg's hub and authority centrality scores.

**\[deprecated\]**

`authority.score()` was renamed to
[`authority_score()`](https://r.igraph.org/reference/hub_score.md) to
create a more consistent API.

## Usage

``` r
authority.score(
  graph,
  scale = TRUE,
  weights = NULL,
  options = arpack_defaults()
)
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

## Related documentation in the C library

[`hub_and_authority_scores()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_hub_and_authority_scores),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
