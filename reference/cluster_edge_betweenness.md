# Community structure detection based on edge betweenness

Community structure detection based on the betweenness of the edges in
the network. This method is also known as the Girvan-Newman algorithm.

## Usage

``` r
cluster_edge_betweenness(
  graph,
  weights = NULL,
  directed = TRUE,
  edge.betweenness = TRUE,
  merges = TRUE,
  bridges = TRUE,
  modularity = TRUE,
  membership = TRUE
)
```

## Arguments

- graph:

  The graph to analyze.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. Edge weights are used to calculate
  weighted edge betweenness. This means that edges are interpreted as
  distances, not as connection strengths.

- directed:

  Logical constant, whether to calculate directed edge betweenness for
  directed graphs. It is ignored for undirected graphs.

- edge.betweenness:

  Logical constant, whether to return the edge betweenness of the edges
  at the time of their removal.

- merges:

  Logical constant, whether to return the merge matrix representing the
  hierarchical community structure of the network. This argument is
  called `merges`, even if the community structure algorithm itself is
  divisive and not agglomerative: it builds the tree from top to bottom.
  There is one line for each merge (i.e. split) in matrix, the first
  line is the first merge (last split). The communities are identified
  by integer number starting from one. Community ids smaller than or
  equal to \\N\\, the number of vertices in the graph, belong to
  singleton communities, i.e. individual vertices. Before the first
  merge we have \\N\\ communities numbered from one to \\N\\. The first
  merge, the first line of the matrix creates community \\N+1\\, the
  second merge creates community \\N+2\\, etc.

- bridges:

  Logical constant, whether to return a list the edge removals which
  actually splitted a component of the graph.

- modularity:

  Logical constant, whether to calculate the maximum modularity score,
  considering all possibly community structures along the
  edge-betweenness based edge removals.

- membership:

  Logical constant, whether to calculate the membership vector
  corresponding to the highest possible modularity score.

## Value

`cluster_edge_betweenness()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

The idea behind this method is that the betweenness of the edges
connecting two communities is typically high, as many of the shortest
paths between vertices in separate communities pass through them. The
algorithm successively removes edges with the highest betweenness,
recalculating betweenness values after each removal. This way eventually
the network splits into two components, then one of these components
splits again, and so on, until all edges are removed. The resulting
hierarhical partitioning of the vertices can be encoded as a dendrogram.

`cluster_edge_betweenness()` returns various information collected
through the run of the algorithm. Specifically, `removed.edges` contains
the edge IDs in order of the edges' removal; `edge.betweenness` contains
the betweenness of each of these at the time of their removal; and
`bridges` contains the IDs of edges whose removal caused a split.

## References

M Newman and M Girvan: Finding and evaluating community structure in
networks, *Physical Review E* 69, 026113 (2004)

## See also

[`edge_betweenness()`](https://r.igraph.org/reference/betweenness.md)
for the definition and calculation of the edge betweenness,
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)
for other community detection methods.

See [`communities()`](https://r.igraph.org/reference/communities.md) for
extracting the results of the community detection.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
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
[`split_join_distance()`](https://r.igraph.org/reference/split_join_distance.md),
[`voronoi_cells()`](https://r.igraph.org/reference/voronoi_cells.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_pa(100, m = 2, directed = FALSE)
eb <- cluster_edge_betweenness(g)

g <- make_full_graph(10) %du% make_full_graph(10)
g <- add_edges(g, c(1, 11))
eb <- cluster_edge_betweenness(g)
eb
#> IGRAPH clustering edge betweenness, groups: 2, mod: 0.49
#> + groups:
#>   $`1`
#>    [1]  1  2  3  4  5  6  7  8  9 10
#>   
#>   $`2`
#>    [1] 11 12 13 14 15 16 17 18 19 20
#>   
```
