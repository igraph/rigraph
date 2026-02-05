# Community structure via greedy optimization of modularity

This function tries to find dense subgraph, also called communities in
graphs via directly optimizing a modularity score.

## Usage

``` r
cluster_fast_greedy(
  graph,
  merges = TRUE,
  modularity = TRUE,
  membership = TRUE,
  weights = NULL
)
```

## Arguments

- graph:

  The input graph. It must be undirected and must not have multi-edges.

- merges:

  Logical scalar, whether to return the merge matrix.

- modularity:

  Logical scalar, whether to return a vector containing the modularity
  after each merge.

- membership:

  Logical scalar, whether to calculate the membership vector
  corresponding to the maximum modularity score, considering all
  possible community structures along the merges.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

## Value

`cluster_fast_greedy()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

This function implements the fast greedy modularity optimization
algorithm for finding community structure, see A Clauset, MEJ Newman, C
Moore: Finding community structure in very large networks,
http://www.arxiv.org/abs/cond-mat/0408187 for the details.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

A Clauset, MEJ Newman, C Moore: Finding community structure in very
large networks, http://www.arxiv.org/abs/cond-mat/0408187

## See also

[`communities()`](https://r.igraph.org/reference/communities.md) for
extracting the results.

See also
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md)
and
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)
for other methods.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
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

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com> for the R interface.

## Examples

``` r
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
fc <- cluster_fast_greedy(g)
membership(fc)
#>  [1] 3 3 3 3 3 1 1 1 1 1 2 2 2 2 2
sizes(fc)
#> Community sizes
#> 1 2 3 
#> 5 5 5 
```
