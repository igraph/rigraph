# Community detection algorithm based on interacting fluids

The algorithm detects communities based on the simple idea of several
fluids interacting in a non-homogeneous environment (the graph
topology), expanding and contracting based on their interaction and
density.

## Usage

``` r
cluster_fluid_communities(graph, no.of.communities)
```

## Arguments

- graph:

  The input graph. The graph must be simple and connected. Empty graphs
  are not supported as well as single vertex graphs. Edge directions are
  ignored. Weights are not considered.

- no.of.communities:

  The number of communities to be found. Must be greater than 0 and
  fewer than number of vertices in the graph.

## Value

`cluster_fluid_communities()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## References

Parés F, Gasulla DG, et. al. (2018) Fluid Communities: A Competitive,
Scalable and Diverse Community Detection Algorithm. In: Complex Networks
& Their Applications VI: Proceedings of Complex Networks 2017 (The Sixth
International Conference on Complex Networks and Their Applications),
Springer, vol 689, p 229, doi: 10.1007/978-3-319-72150-7_19

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
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
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

Ferran Parés

## Examples

``` r
g <- make_graph("Zachary")
comms <- cluster_fluid_communities(g, 2)
```
