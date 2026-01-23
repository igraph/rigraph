# Vertex and edge betweenness centrality

The vertex and edge betweenness are (roughly) defined by the number of
geodesics (shortest paths) going through a vertex or an edge.

## Usage

``` r
betweenness(
  graph,
  v = V(graph),
  directed = TRUE,
  weights = NULL,
  normalized = FALSE,
  cutoff = -1
)

edge_betweenness(
  graph,
  e = E(graph),
  directed = TRUE,
  weights = NULL,
  cutoff = -1
)
```

## Arguments

- graph:

  The graph to analyze.

- v:

  The vertices for which the vertex betweenness will be calculated.

- directed:

  Logical, whether directed paths should be considered while determining
  the shortest paths.

- weights:

  Optional positive weight vector for calculating weighted betweenness.
  If the graph has a `weight` edge attribute, then this is used by
  default. Weights are used to calculate weighted shortest paths, so
  they are interpreted as distances.

- normalized:

  Logical scalar, whether to normalize the betweenness scores. If
  `TRUE`, then the results are normalized by the number of ordered or
  unordered vertex pairs in directed and undirected graphs,
  respectively. In an undirected graph,
  \$\$B^n=\frac{2B}{(n-1)(n-2)},\$\$ where \\B^n\\ is the normalized,
  \\B\\ the raw betweenness, and \\n\\ is the number of vertices in the
  graph. Note that the same normalization factor is used even when
  setting a `cutoff` on the considered shortest path lengths, even
  though the number of vertex pairs reachable from each other may be
  less than \\(n-1)(n-2)/2\\.

- cutoff:

  The maximum shortest path length to consider when calculating
  betweenness. If negative, then there is no such limit.

- e:

  The edges for which the edge betweenness will be calculated.

## Value

A numeric vector with the betweenness score for each vertex in `v` for
`betweenness()`.

A numeric vector with the edge betweenness score for each edge in `e`
for `edge_betweenness()`.

## Details

The vertex betweenness of vertex `v` is defined by

\$\$\sum\_{i\ne j, i\ne v, j\ne v} g\_{ivj}/g\_{ij}\$\$

The edge betweenness of edge `e` is defined by

\$\$\sum\_{i\ne j} g\_{iej}/g\_{ij}.\$\$

`betweenness()` calculates vertex betweenness, `edge_betweenness()`
calculates edge betweenness.

Here \\g\_{ij}\\ is the total number of shortest paths between vertices
\\i\\ and \\j\\ while \\g\_{ivj}\\ is the number of those shortest paths
which pass though vertex \\v\\.

Both functions allow you to consider only paths of length `cutoff` or
smaller; this can be run for larger graphs, as the running time is not
quadratic (if `cutoff` is small). If `cutoff` is negative (the default),
then the function calculates the exact betweenness scores. Since igraph
1.6.0, a `cutoff` value of zero is treated literally, i.e. paths of
length larger than zero are ignored.

For calculating the betweenness a similar algorithm to the one proposed
by Brandes (see References) is used.

## Note

`edge_betweenness()` might give false values for graphs with multiple
edges.

## References

Freeman, L.C. (1979). Centrality in Social Networks I: Conceptual
Clarification. *Social Networks*, 1, 215-239.
[doi:10.1016/0378-8733(78)90021-7](https://doi.org/10.1016/0378-8733%2878%2990021-7)

Ulrik Brandes, A Faster Algorithm for Betweenness Centrality. *Journal
of Mathematical Sociology* 25(2):163-177, 2001.
[doi:10.1080/0022250X.2001.9990249](https://doi.org/10.1080/0022250X.2001.9990249)

## See also

[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md)

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
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

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnp(10, 3 / 10)
betweenness(g)
#>  [1] 13 10  0  0  6  1  0  6  0  0
edge_betweenness(g)
#> [1] 15  5  9  4  2  3 12  7  7
```
