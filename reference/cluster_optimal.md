# Optimal community structure

This function calculates the optimal community structure of a graph, by
maximizing the modularity measure over all possible partitions.

## Usage

``` r
cluster_optimal(graph, weights = NULL)
```

## Arguments

- graph:

  The input graph. It may be undirected or directed.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

## Value

`cluster_optimal()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

This function calculates the optimal community structure for a graph, in
terms of maximal modularity score.

The calculation is done by transforming the modularity maximization into
an integer programming problem, and then calling the GLPK library to
solve that. Please the reference below for details.

Note that modularity optimization is an NP-complete problem, and all
known algorithms for it have exponential time complexity. This means
that you probably don't want to run this function on larger graphs.
Graphs with up to fifty vertices should be fine, graphs with a couple of
hundred vertices might be possible.

## Examples


    ## Zachary's karate club
    g <- make_graph("Zachary")

    ## We put everything into a big 'try' block, in case
    ## igraph was compiled without GLPK support

    ## The calculation only takes a couple of seconds
    oc <- cluster_optimal(g)

    ## Double check the result
    print(modularity(oc))
    print(modularity(g, membership(oc)))

    ## Compare to the greedy optimizer
    fc <- cluster_fast_greedy(g)
    print(modularity(fc))

## Related documentation in the C library

[`community_optimal_modularity()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_community_optimal_modularity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Ulrik Brandes, Daniel Delling, Marco Gaertler, Robert Gorke, Martin
Hoefer, Zoran Nikoloski, Dorothea Wagner: On Modularity Clustering,
*IEEE Transactions on Knowledge and Data Engineering* 20(2):172-188,
2008.

## See also

[`communities()`](https://r.igraph.org/reference/communities.md) for the
documentation of the result,
[`modularity()`](https://r.igraph.org/reference/modularity.igraph.md).
See also
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md)
for a fast greedy optimizer.

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
