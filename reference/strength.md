# Strength or weighted vertex degree

Summing up the edge weights of the adjacent edges for each vertex.

## Usage

``` r
strength(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  weights = NULL
)
```

## Arguments

- graph:

  The input graph.

- vids:

  The vertices for which the strength will be calculated.

- mode:

  Character string, “out” for out-degree, “in” for in-degree or “all”
  for the sum of the two. For undirected graphs this argument is
  ignored.

- loops:

  Logical; whether the loop edges are also counted.

- weights:

  Weight vector. If the graph has a `weight` edge attribute, then this
  is used by default. If the graph does not have a `weight` edge
  attribute and this argument is `NULL`, then a
  [`degree()`](https://r.igraph.org/reference/degree.md) is called. If
  this is `NA`, then no edge weights are used (even if the graph has a
  `weight` edge attribute).

## Value

A numeric vector giving the strength of the vertices.

## References

Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras, Alessandro
Vespignani: The architecture of complex weighted networks, Proc. Natl.
Acad. Sci. USA 101, 3747 (2004)

## See also

[`degree()`](https://r.igraph.org/reference/degree.md) for the
unweighted version.

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`strength()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_strength).

## Examples

``` r
g <- make_star(10)
E(g)$weight <- seq(ecount(g))
strength(g)
#>  [1] 45  1  2  3  4  5  6  7  8  9
strength(g, mode = "out")
#>  [1] 0 1 2 3 4 5 6 7 8 9
strength(g, mode = "in")
#>  [1] 45  0  0  0  0  0  0  0  0  0

# No weights
g <- make_ring(10)
strength(g)
#>  [1] 2 2 2 2 2 2 2 2 2 2
```
