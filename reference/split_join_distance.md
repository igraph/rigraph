# Split-join distance of two community structures

The split-join distance between partitions A and B is the sum of the
projection distance of A from B and the projection distance of B from A.
The projection distance is an asymmetric measure and it is defined as
follows:

## Usage

``` r
split_join_distance(comm1, comm2)
```

## Arguments

- comm1:

  The first community structure.

- comm2:

  The second community structure.

## Value

Two integer numbers, see details below.

## Details

First, each set in partition A is evaluated against all sets in
partition B. For each set in partition A, the best matching set in
partition B is found and the overlap size is calculated. (Matching is
quantified by the size of the overlap between the two sets). Then, the
maximal overlap sizes for each set in A are summed together and
subtracted from the number of elements in A.

The split-join distance will be returned as two numbers, the first is
the projection distance of the first partition from the second, while
the second number is the projection distance of the second partition
from the first. This makes it easier to detect whether a partition is a
subpartition of the other, since in this case, the corresponding
distance will be zero.

## Related documentation in the C library

[`split_join_distance()`](https://igraph.org/c/html/latest/igraph-Community.html#igraph_split_join_distance)

## References

van Dongen S: Performance criteria for graph clustering and Markov
cluster experiments. Technical Report INS-R0012, National Research
Institute for Mathematics and Computer Science in the Netherlands,
Amsterdam, May 2000.

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
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md),
[`membership()`](https://r.igraph.org/reference/communities.md),
[`modularity.igraph()`](https://r.igraph.org/reference/modularity.igraph.md),
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)
