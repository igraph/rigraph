# Closeness centrality of vertices

Closeness centrality measures how many steps are required to access
every other vertex from a given vertex.

## Usage

``` r
closeness(
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

  The vertices for which closeness will be calculated.

- mode:

  Character string, defined the types of the paths used for measuring
  the distance in directed graphs. “in” measures the paths *to* a
  vertex, “out” measures paths *from* a vertex, *all* uses undirected
  paths. This argument is ignored for undirected graphs.

- weights:

  Optional positive weight vector for calculating weighted closeness. If
  the graph has a `weight` edge attribute, then this is used by default.
  Weights are used for calculating weighted shortest paths, so they are
  interpreted as distances.

- normalized:

  Logical scalar, whether to calculate the normalized closeness, i.e.
  the inverse average distance to all reachable vertices. The
  non-normalized closeness is the inverse of the sum of distances to all
  reachable vertices.

- cutoff:

  The maximum path length to consider when calculating the closeness. If
  zero or negative then there is no such limit.

## Value

Numeric vector with the closeness values of all the vertices in `v`.

## Details

The closeness centrality of a vertex is defined as the inverse of the
sum of distances to all the other vertices in the graph:

\$\$\frac{1}{\sum\_{i\ne v} d\_{vi}}\$\$

If there is no (directed) path between vertex `v` and `i`, then `i` is
omitted from the calculation. If no other vertices are reachable from
`v`, then its closeness is returned as NaN.

`cutoff` or smaller. This can be run for larger graphs, as the running
time is not quadratic (if `cutoff` is small). If `cutoff` is negative
(which is the default), then the function calculates the exact closeness
scores. Since igraph 1.6.0, a `cutoff` value of zero is treated
literally, i.e. path with a length greater than zero are ignored.

Closeness centrality is meaningful only for connected graphs. In
disconnected graphs, consider using the harmonic centrality with
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md)

## Related documentation in the C library

[`closeness_cutoff()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_closeness_cutoff),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Freeman, L.C. (1979). Centrality in Social Networks I: Conceptual
Clarification. *Social Networks*, 1, 215-239.

## See also

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
g2 <- make_star(10)
closeness(g)
#>  [1] 0.04 0.04 0.04 0.04 0.04 0.04 0.04 0.04 0.04 0.04
closeness(g2, mode = "in")
#>  [1] 0.1111111       NaN       NaN       NaN       NaN       NaN       NaN
#>  [8]       NaN       NaN       NaN
closeness(g2, mode = "out")
#>  [1] NaN   1   1   1   1   1   1   1   1   1
closeness(g2, mode = "all")
#>  [1] 0.11111111 0.05882353 0.05882353 0.05882353 0.05882353 0.05882353
#>  [7] 0.05882353 0.05882353 0.05882353 0.05882353
```
