# Creates a communities object.

This is useful to integrate the results of community finding algorithms
that are not included in igraph.

## Usage

``` r
make_clusters(
  graph,
  membership = NULL,
  algorithm = NULL,
  merges = NULL,
  modularity = TRUE
)
```

## Arguments

- graph:

  The graph of the community structure.

- membership:

  The membership vector of the community structure, a numeric vector
  denoting the id of the community for each vertex. It might be `NULL`
  for hierarchical community structures.

- algorithm:

  Character string, the algorithm that generated the community
  structure, it can be arbitrary.

- merges:

  A merge matrix, for hierarchical community structures (or `NULL`
  otherwise.

- modularity:

  Modularity value of the community structure. If this is `TRUE` and the
  membership vector is available, then it the modularity values is
  calculated automatically.

## Value

A `communities` object.

- membership:

  A numeric vector giving the community id for each vertex.

- modularity:

  The modularity score of the partition.

- algorithm:

  If known, the algorithm used to obtain the communities.

- vcount:

  Number of vertices in the graph.

## See also

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
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`compare()`](https://r.igraph.org/reference/compare.md),
[`groups()`](https://r.igraph.org/reference/groups.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)
