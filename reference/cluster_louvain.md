# Finding community structure by multi-level optimization of modularity

This function implements the multi-level modularity optimization
algorithm for finding community structure, see references below. It is
based on the modularity measure and a hierarchical approach.

## Usage

``` r
cluster_louvain(graph, weights = NULL, resolution = 1)
```

## Arguments

- graph:

  The input graph. It must be undirected.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- resolution:

  Optional resolution parameter that allows the user to adjust the
  resolution parameter of the modularity function that the algorithm
  uses internally. Lower values typically yield fewer, larger clusters.
  The original definition of modularity is recovered when the resolution
  parameter is set to 1.

## Value

`cluster_louvain()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

This function implements the multi-level modularity optimization
algorithm for finding community structure, see VD Blondel, J-L
Guillaume, R Lambiotte and E Lefebvre: Fast unfolding of community
hierarchies in large networks, <https://arxiv.org/abs/0803.0476> for the
details.

It is based on the modularity measure and a hierarchical approach.
Initially, each vertex is assigned to a community on its own. In every
step, vertices are re-assigned to communities in a local, greedy way:
each vertex is moved to the community with which it achieves the highest
contribution to modularity. When no vertices can be reassigned, each
community is considered a vertex on its own, and the process starts
again with the merged communities. The process stops when there is only
a single vertex left or when the modularity cannot be increased any more
in a step. Since igraph 1.3, vertices are processed in a random order.

This function was contributed by Tom Gregorovic.

## Related documentation in the C library

[`community_multilevel`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_community_multilevel),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Vincent D. Blondel, Jean-Loup Guillaume, Renaud Lambiotte, Etienne
Lefebvre: Fast unfolding of communities in large networks. J. Stat.
Mech. (2008) P10008

## See also

See [`communities()`](https://r.igraph.org/reference/communities.md) for
extracting the membership, modularity scores, etc. from the results.

Other community detection algorithms:
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md),
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`compare()`](https://r.igraph.org/reference/compare.md),
[`groups()`](https://r.igraph.org/reference/groups.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Tom Gregorovic, Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
# This is so simple that we will have only one level
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
cluster_louvain(g)
#> IGRAPH clustering multi level, groups: 3, mod: 0.58
#> + groups:
#>   $`1`
#>   [1] 1 2 3 4 5
#>   
#>   $`2`
#>   [1]  6  7  8  9 10
#>   
#>   $`3`
#>   [1] 11 12 13 14 15
#>   
```
