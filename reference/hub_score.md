# Kleinberg's authority centrality scores.

Kleinberg's authority centrality scores.

Kleinberg's hub centrality scores.

## Usage

``` r
authority_score(
  graph,
  scale = TRUE,
  weights = NULL,
  options = arpack_defaults()
)

hub_score(graph, scale = TRUE, weights = NULL, options = arpack_defaults())
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

[`hub_and_authority_scores()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_hub_and_authority_scores),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)
