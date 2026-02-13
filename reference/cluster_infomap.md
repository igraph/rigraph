# Infomap community finding

Find community structure that minimizes the expected description length
of a random walker trajectory. If the graph is directed, edge directions
will be taken into account.

## Usage

``` r
cluster_infomap(
  graph,
  e.weights = NULL,
  v.weights = NULL,
  nb.trials = 10,
  modularity = TRUE
)
```

## Arguments

- graph:

  The input graph. Edge directions will be taken into account.

- e.weights:

  If not `NULL`, then a numeric vector of edge weights. The length must
  match the number of edges in the graph. By default the ‘`weight`’ edge
  attribute is used as weights. If it is not present, then all edges are
  considered to have the same weight. Larger edge weights correspond to
  stronger connections.

- v.weights:

  If not `NULL`, then a numeric vector of vertex weights. The length
  must match the number of vertices in the graph. By default the
  ‘`weight`’ vertex attribute is used as weights. If it is not present,
  then all vertices are considered to have the same weight. A larger
  vertex weight means a larger probability that the random surfer jumps
  to that vertex.

- nb.trials:

  The number of attempts to partition the network (can be any integer
  value equal or larger than 1).

- modularity:

  Logical scalar, whether to calculate the modularity score of the
  detected community structure.

## Value

`cluster_infomap()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

Please see the details of this method in the references given below.

## Related documentation in the C library

[`community_infomap()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_community_infomap),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

The original paper: M. Rosvall and C. T. Bergstrom, Maps of information
flow reveal community structure in complex networks, *PNAS* 105, 1118
(2008)
[doi:10.1073/pnas.0706851105](https://doi.org/10.1073/pnas.0706851105) ,
<https://arxiv.org/abs/0707.0609>

A more detailed paper: M. Rosvall, D. Axelsson, and C. T. Bergstrom, The
map equation, *Eur. Phys. J. Special Topics* 178, 13 (2009).
[doi:10.1140/epjst/e2010-01179-1](https://doi.org/10.1140/epjst/e2010-01179-1)
, <https://arxiv.org/abs/0906.1405>.

## See also

Other community finding methods and
[`communities()`](https://r.igraph.org/reference/communities.md).

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
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

Martin Rosvall wrote the original C++ code. This was ported to be more
igraph-like by Emmanuel Navarro. The R interface and some cosmetics was
done by Gabor Csardi <csardi.gabor@gmail.com>.

## Examples

``` r
## Zachary's karate club
g <- make_graph("Zachary")

imc <- cluster_infomap(g)
membership(imc)
#>  [1] 1 1 1 1 2 2 2 1 3 1 2 1 1 1 3 3 2 1 3 1 3 1 3 3 3 3 3 3 3 3 3 3 3 3
communities(imc)
#> $`1`
#>  [1]  1  2  3  4  8 10 12 13 14 18 20 22
#> 
#> $`2`
#> [1]  5  6  7 11 17
#> 
#> $`3`
#>  [1]  9 15 16 19 21 23 24 25 26 27 28 29 30 31 32 33 34
#> 
```
