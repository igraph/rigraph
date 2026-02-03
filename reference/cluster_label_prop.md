# Finding communities based on propagating labels

This is a fast, nearly linear time algorithm for detecting community
structure in networks. In works by labeling the vertices with unique
labels and then updating the labels by majority voting in the
neighborhood of the vertex.

## Usage

``` r
cluster_label_prop(
  graph,
  weights = NULL,
  ...,
  mode = c("out", "in", "all"),
  initial = NULL,
  fixed = NULL
)
```

## Arguments

- graph:

  The input graph. Note that the algorithm was originally defined for
  undirected graphs. You are advised to set ‘mode’ to `all` if you pass
  a directed graph here to treat it as undirected.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- ...:

  These dots are for future extensions and must be empty.

- mode:

  Logical, whether to consider edge directions for the label
  propagation, and if so, in which direction the labels should
  propagate. Ignored for undirected graphs. "all" means to ignore edge
  directions (even in directed graphs). "out" means to propagate labels
  along the natural direction of the edges. "in" means to propagate
  labels backwards (i.e. from head to tail).

- initial:

  The initial state. If `NULL`, every vertex will have a different label
  at the beginning. Otherwise it must be a vector with an entry for each
  vertex. Non-negative values denote different labels, negative entries
  denote vertices without labels.

- fixed:

  Logical vector denoting which labels are fixed. Of course this makes
  sense only if you provided an initial state, otherwise this element
  will be ignored. Also note that vertices without labels cannot be
  fixed.

## Value

`cluster_label_prop()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

This function implements the community detection method described in:
Raghavan, U.N. and Albert, R. and Kumara, S.: Near linear time algorithm
to detect community structures in large-scale networks. Phys Rev E 76,
036106. (2007). This version extends the original method by the ability
to take edge weights into consideration and also by allowing some labels
to be fixed.

From the abstract of the paper: “In our algorithm every node is
initialized with a unique label and at every step each node adopts the
label that most of its neighbors currently have. In this iterative
process densely connected groups of nodes form a consensus on a unique
label to form communities.”

## Related documentation in the C library

[`community_label_propagation()`](https://igraph.org/c/html/latest/igraph-Community.html#igraph_community_label_propagation),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## References

Raghavan, U.N. and Albert, R. and Kumara, S.: Near linear time algorithm
to detect community structures in large-scale networks. *Phys Rev E* 76,
036106. (2007)

## See also

[`communities()`](https://r.igraph.org/reference/communities.md) for
extracting the actual results.

[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
and
[`cluster_leiden()`](https://r.igraph.org/reference/cluster_leiden.md)
for other community detection methods.

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
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

Tamas Nepusz <ntamas@gmail.com> for the C implementation, Gabor Csardi
<csardi.gabor@gmail.com> for this manual page.

## Examples

``` r
g <- sample_gnp(10, 5 / 10) %du% sample_gnp(9, 5 / 9)
g <- add_edges(g, c(1, 12))
cluster_label_prop(g)
#> IGRAPH clustering label propagation, groups: 2, mod: 0.45
#> + groups:
#>   $`1`
#>    [1]  1  2  3  4  5  6  7  8  9 10
#>   
#>   $`2`
#>   [1] 11 12 13 14 15 16 17 18 19
#>   
```
