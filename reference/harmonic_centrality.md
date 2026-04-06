# Harmonic centrality of vertices

The harmonic centrality of a vertex is the mean inverse distance to all
other vertices. The inverse distance to an unreachable vertex is
considered to be zero.

## Usage

``` r
harmonic_centrality(
  graph,
  vids = V(graph),
  mode = c("out", "in", "all", "total"),
  weights = NULL,
  normalized = FALSE,
  cutoff = -1
)
```

## Arguments

- graph:

  The graph to analyze.

- vids:

  The vertices for which harmonic centrality will be calculated.

- mode:

  Character string, defining the types of the paths used for measuring
  the distance in directed graphs. “out” follows paths along the edge
  directions only, “in” traverses the edges in reverse, while “all”
  ignores edge directions. This argument is ignored for undirected
  graphs.

- weights:

  Optional positive weight vector for calculating weighted harmonic
  centrality. If the graph has a `weight` edge attribute, then this is
  used by default. Weights are used for calculating weighted shortest
  paths, so they are interpreted as distances.

- normalized:

  Logical scalar, whether to calculate the normalized harmonic
  centrality. If true, the result is the mean inverse path length to
  other vertices, i.e. it is normalized by the number of vertices minus
  one. If false, the result is the sum of inverse path lengths to other
  vertices.

- cutoff:

  The maximum path length to consider when calculating the harmonic
  centrality. There is no such limit when the cutoff is negative. Note
  that zero cutoff means that only paths of at most length 0 are
  considered.

## Value

Numeric vector with the harmonic centrality scores of all the vertices
in `v`.

## Details

The `cutoff` argument can be used to restrict the calculation to paths
of length `cutoff` or smaller only; this can be used for larger graphs
to speed up the calculation. If `cutoff` is negative (which is the
default), then the function calculates the exact harmonic centrality
scores.

## References

M. Marchiori and V. Latora, Harmony in the small-world, *Physica A* 285,
pp. 539-546 (2000).

## See also

[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md)

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Related documentation in the C library

[`harmonic_centrality_cutoff()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_harmonic_centrality_cutoff).

## Examples

``` r
g <- make_ring(10)
g2 <- make_star(10)
harmonic_centrality(g)
#>  [1] 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667
#>  [9] 4.366667 4.366667
harmonic_centrality(g2, mode = "in")
#>  [1] 9 0 0 0 0 0 0 0 0 0
harmonic_centrality(g2, mode = "out")
#>  [1] 0 1 1 1 1 1 1 1 1 1
harmonic_centrality(g %du% make_full_graph(5), mode = "all")
#>  [1] 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667 4.366667
#>  [9] 4.366667 4.366667 4.000000 4.000000 4.000000 4.000000 4.000000
```
