# Compares community structures using various metrics

This function assesses the distance between two community structures.

## Usage

``` r
compare(
  comm1,
  comm2,
  method = c("vi", "nmi", "split.join", "rand", "adjusted.rand")
)
```

## Arguments

- comm1:

  A [`communities()`](https://r.igraph.org/reference/communities.md)
  object containing a community structure; or a numeric vector, the
  membership vector of the first community structure. The membership
  vector should contain the community id of each vertex, the numbering
  of the communities starts with one.

- comm2:

  A [`communities()`](https://r.igraph.org/reference/communities.md)
  object containing a community structure; or a numeric vector, the
  membership vector of the second community structure, in the same
  format as for the previous argument.

- method:

  Character scalar, the comparison method to use. Possible values: ‘vi’
  is the variation of information (VI) metric of Meila (2003), ‘nmi’ is
  the normalized mutual information measure proposed by Danon et al.
  (2005), ‘split.join’ is the split-join distance of can Dongen (2000),
  ‘rand’ is the Rand index of Rand (1971), ‘adjusted.rand’ is the
  adjusted Rand index by Hubert and Arabie (1985).

## Value

A real number.

## References

Meila M: Comparing clusterings by the variation of information. In:
Scholkopf B, Warmuth MK (eds.). *Learning Theory and Kernel Machines:
16th Annual Conference on Computational Learning Theory and 7th Kernel
Workshop*, COLT/Kernel 2003, Washington, DC, USA. Lecture Notes in
Computer Science, vol. 2777, Springer, 2003. ISBN: 978-3-540-40720-1.

Danon L, Diaz-Guilera A, Duch J, Arenas A: Comparing community structure
identification. *J Stat Mech* P09008, 2005.

van Dongen S: Performance criteria for graph clustering and Markov
cluster experiments. Technical Report INS-R0012, National Research
Institute for Mathematics and Computer Science in the Netherlands,
Amsterdam, May 2000.

Rand WM: Objective criteria for the evaluation of clustering methods. *J
Am Stat Assoc* 66(336):846-850, 1971.

Hubert L and Arabie P: Comparing partitions. *Journal of Classification*
2:193-218, 1985.

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
[`groups()`](https://r.igraph.org/reference/groups.md),
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
g <- make_graph("Zachary")
sg <- cluster_spinglass(g)
le <- cluster_leading_eigen(g)
compare(sg, le, method = "rand")
#> [1] 0.9500891
compare(membership(sg), membership(le))
#> [1] 0.2765712
```
