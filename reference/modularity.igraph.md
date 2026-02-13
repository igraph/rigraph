# Modularity of a community structure of a graph

This function calculates how modular is a given division of a graph into
subgraphs.

## Usage

``` r
# S3 method for class 'igraph'
modularity(x, membership, weights = NULL, resolution = 1, directed = TRUE, ...)

modularity_matrix(
  graph,
  membership = lifecycle::deprecated(),
  weights = NULL,
  resolution = 1,
  directed = TRUE
)
```

## Arguments

- x, graph:

  The input graph.

- membership:

  Numeric vector, one value for each vertex, the membership vector of
  the community structure.

- weights:

  If not `NULL` then a numeric vector giving edge weights.

- resolution:

  The resolution parameter. Must be greater than or equal to 0. Set it
  to 1 to use the classical definition of modularity.

- directed:

  Whether to use the directed or undirected version of modularity.
  Ignored for undirected graphs.

- ...:

  Additional arguments, none currently.

## Value

For `modularity()` a numeric scalar, the modularity score of the given
configuration.

For `modularity_matrix()` a numeric square matrix, its order is the
number of vertices in the graph.

## Details

`modularity()` calculates the modularity of a graph with respect to the
given `membership` vector.

The modularity of a graph with respect to some division (or vertex
types) measures how good the division is, or how separated are the
different vertex types from each other. It defined as \$\$Q=\frac{1}{2m}
\sum\_{i,j} (A\_{ij}-\gamma\frac{k_i k_j}{2m})\delta(c_i,c_j),\$\$ here
\\m\\ is the number of edges, \\A\_{ij}\\ is the element of the \\A\\
adjacency matrix in row \\i\\ and column \\j\\, \\k_i\\ is the degree of
\\i\\, \\k_j\\ is the degree of \\j\\, \\c_i\\ is the type (or
component) of \\i\\, \\c_j\\ that of \\j\\, the sum goes over all \\i\\
and \\j\\ pairs of vertices, and \\\delta(x,y)\\ is 1 if \\x=y\\ and 0
otherwise. For directed graphs, it is defined as \$\$Q = \frac{1}{m}
\sum\_{i,j} (A\_{ij}-\gamma \frac{k_i^{out}
k_j^{in}}{m})\delta(c_i,c_j).\$\$

The resolution parameter \\\gamma\\ allows weighting the random null
model, which might be useful when finding partitions with a high
modularity. Maximizing modularity with higher values of the resolution
parameter typically results in more, smaller clusters when finding
partitions with a high modularity. Lower values typically results in
fewer, larger clusters. The original definition of modularity is
retrieved when setting \\\gamma\\ to 1.

If edge weights are given, then these are considered as the element of
the \\A\\ adjacency matrix, and \\k_i\\ is the sum of weights of
adjacent edges for vertex \\i\\.

`modularity_matrix()` calculates the modularity matrix. This is a dense
matrix, and it is defined as the difference of the adjacency matrix and
the configuration model null model matrix. In other words element
\\M\_{ij}\\ is given as \\A\_{ij}-d_i d_j/(2m)\\, where \\A\_{ij}\\ is
the (possibly weighted) adjacency matrix, \\d_i\\ is the degree of
vertex \\i\\, and \\m\\ is the number of edges (or the total weights in
the graph, if it is weighed).

## Related documentation in the C library

[`modularity()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_modularity),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`modularity_matrix()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_modularity_matrix)

## References

Clauset, A.; Newman, M. E. J. & Moore, C. Finding community structure in
very large networks, *Physical Review E* 2004, 70, 066111

## See also

[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
and
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)
for various community detection methods.

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
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md),
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
wtc <- cluster_walktrap(g)
modularity(wtc)
#> [1] 0.5757576
modularity(g, membership(wtc))
#> [1] 0.5757576
```
