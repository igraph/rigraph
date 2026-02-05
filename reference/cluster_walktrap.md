# Community structure via short random walks

This function tries to find densely connected subgraphs, also called
communities in a graph via random walks. The idea is that short random
walks tend to stay in the same community.

## Usage

``` r
cluster_walktrap(
  graph,
  weights = NULL,
  steps = 4,
  merges = TRUE,
  modularity = TRUE,
  membership = TRUE
)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored in directed graphs.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. Larger edge weights increase the
  probability that an edge is selected by the random walker. In other
  words, larger edge weights correspond to stronger connections.

- steps:

  The length of the random walks to perform.

- merges:

  Logical scalar, whether to include the merge matrix in the result.

- modularity:

  Logical scalar, whether to include the vector of the modularity scores
  in the result. If the `membership` argument is true, then it will
  always be calculated.

- membership:

  Logical scalar, whether to calculate the membership vector for the
  split corresponding to the highest modularity value.

## Value

`cluster_walktrap()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

This function is the implementation of the Walktrap community finding
algorithm, see Pascal Pons, Matthieu Latapy: Computing communities in
large networks using random walks, https://arxiv.org/abs/physics/0512106

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Pascal Pons, Matthieu Latapy: Computing communities in large networks
using random walks, https://arxiv.org/abs/physics/0512106

## See also

See [`communities()`](https://r.igraph.org/reference/communities.md) on
getting the actual membership vector, merge matrix, modularity score,
etc.

[`modularity()`](https://r.igraph.org/reference/modularity.igraph.md)
and
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
and
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)
for other community detection methods.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`compare()`](https://r.igraph.org/reference/compare.md),
[`groups()`](https://r.igraph.org/reference/groups.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Pascal Pons (<http://psl.pons.free.fr/>) and Gabor Csardi
<csardi.gabor@gmail.com> for the R and igraph interface

## Examples

``` r
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
cluster_walktrap(g)
#> IGRAPH clustering walktrap, groups: 3, mod: 0.58
#> + groups:
#>   $`1`
#>   [1] 11 12 13 14 15
#>   
#>   $`2`
#>   [1]  6  7  8  9 10
#>   
#>   $`3`
#>   [1] 1 2 3 4 5
#>   
```
