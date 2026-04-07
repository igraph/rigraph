# Graph diversity

Calculates a measure of diversity for all vertices.

## Usage

``` r
diversity(graph, weights = NULL, vids = V(graph))
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

- weights:

  `NULL`, or the vector of edge weights to use for the computation. If
  `NULL`, then the ‘weight’ attibute is used. Note that this measure is
  not defined for unweighted graphs.

- vids:

  The vertex ids for which to calculate the measure.

## Value

A numeric vector, its length is the number of vertices.

## Details

The diversity of a vertex is defined as the (scaled) Shannon entropy of
the weights of its incident edges: \$\$D(i)=\frac{H(i)}{\log k_i}\$\$
and \$\$H(i)=-\sum\_{j=1}^{k_i} p\_{ij}\log p\_{ij},\$\$ where
\$\$p\_{ij}=\frac{w\_{ij}}{\sum\_{l=1}^{k_i}}V\_{il},\$\$ and \\k_i\\ is
the (total) degree of vertex \\i\\, \\w\_{ij}\\ is the weight of the
edge(s) between vertices \\i\\ and \\j\\.

For vertices with degree less than two the function returns `NaN`.

## Related documentation in the C library

[`diversity()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_diversity),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Nathan Eagle, Michael Macy and Rob Claxton: Network Diversity and
Economic Development, *Science* **328**, 1029–1031, 2010.

## See also

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
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
g1 <- sample_gnp(20, 2 / 20)
g2 <- sample_gnp(20, 2 / 20)
g3 <- sample_gnp(20, 5 / 20)
E(g1)$weight <- 1
E(g2)$weight <- runif(ecount(g2))
E(g3)$weight <- runif(ecount(g3))
diversity(g1)
#>  [1]   1   0   1   1   0   0   1   1 NaN   0 NaN   1   1   1   1   0   1   1   0
#> [20]   1
diversity(g2)
#>  [1] 0.0000000 0.0000000 0.9912105 0.1954131 0.2786455       NaN 0.9285801
#>  [8]       NaN 0.9562562 0.8678366 0.9145202 0.0000000 0.9606785       NaN
#> [15] 0.0000000 0.9837941 0.0000000 0.0000000 0.0000000 0.8888561
diversity(g3)
#>  [1] 0.9153007 0.9963839 0.7610137 0.9986502 0.7908580 0.6775001 0.9359162
#>  [8] 0.9681371 0.6402843 0.9446303 0.8001961 0.9568925 0.8956848 0.2837485
#> [15] 0.8343112 0.8661485 0.8991006 0.5628532 0.8944529 0.9736941
```
