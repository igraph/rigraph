# Finding communities in graphs based on statistical meachanics

This function tries to find communities in graphs via a spin-glass model
and simulated annealing.

## Usage

``` r
cluster_spinglass(
  graph,
  weights = NULL,
  vertex = NULL,
  spins = 25,
  parupdate = FALSE,
  start.temp = 1,
  stop.temp = 0.01,
  cool.fact = 0.99,
  update.rule = c("config", "random", "simple"),
  gamma = 1,
  implementation = c("orig", "neg"),
  gamma.minus = 1
)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored in directed graphs.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- vertex:

  This parameter can be used to calculate the community of a given
  vertex without calculating all communities. Note that if this argument
  is present then some other arguments are ignored.

- spins:

  Integer constant, the number of spins to use. This is the upper limit
  for the number of communities. It is not a problem to supply a
  (reasonably) big number here, in which case some spin states will be
  unpopulated.

- parupdate:

  Logical constant, whether to update the spins of the vertices in
  parallel (synchronously) or not. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present). It is also not implemented in the “neg” implementation.

- start.temp:

  Real constant, the start temperature. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present).

- stop.temp:

  Real constant, the stop temperature. The simulation terminates if the
  temperature lowers below this level. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present).

- cool.fact:

  Cooling factor for the simulated annealing. This argument is ignored
  if the second form of the function is used (i.e. the ‘`vertex`’
  argument is present).

- update.rule:

  Character constant giving the ‘null-model’ of the simulation. Possible
  values: “simple” and “config”. “simple” uses a random graph with the
  same number of edges as the baseline probability and “config” uses a
  random graph with the same vertex degrees as the input graph.

- gamma:

  Real constant, the gamma argument of the algorithm. This specifies the
  balance between the importance of present and non-present edges in a
  community. Roughly, a comunity is a set of vertices having many edges
  inside the community and few edges outside the community. The default
  1.0 value makes existing and non-existing links equally important.
  Smaller values make the existing links, greater values the missing
  links more important.

- implementation:

  Character scalar. Currently igraph contains two implementations for
  the Spin-glass community finding algorithm. The faster original
  implementation is the default. The other implementation, that takes
  into account negative weights, can be chosen by supplying ‘neg’ here.

- gamma.minus:

  Real constant, the gamma.minus parameter of the algorithm. This
  specifies the balance between the importance of present and
  non-present negative weighted edges in a community. Smaller values of
  gamma.minus, leads to communities with lesser negative
  intra-connectivity. If this argument is set to zero, the algorithm
  reduces to a graph coloring algorithm, using the number of spins as
  the number of colors. This argument is ignored if the ‘orig’
  implementation is chosen.

## Value

If the `vertex` argument is not given, i.e. the first form is used then
a `cluster_spinglass()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object.

If the `vertex` argument is present, i.e. the second form is used then a
named list is returned with the following components:

- community:

  Numeric vector giving the ids of the vertices in the same community as
  `vertex`.

- cohesion:

  The cohesion score of the result, see references.

- adhesion:

  The adhesion score of the result, see references.

- inner.links:

  The number of edges within the community of `vertex`.

- outer.links:

  The number of edges between the community of `vertex` and the rest of
  the graph.

## Details

This function tries to find communities in a graph. A community is a set
of nodes with many edges inside the community and few edges between
outside it (i.e. between the community itself and the rest of the
graph.)

This idea is reversed for edges having a negative weight, i.e. few
negative edges inside a community and many negative edges between
communities. Note that only the ‘neg’ implementation supports negative
edge weights.

The `spinglass.cummunity` function can solve two problems related to
community detection. If the `vertex` argument is not given (or it is
`NULL`), then the regular community detection problem is solved
(approximately), i.e. partitioning the vertices into communities, by
optimizing the an energy function.

If the `vertex` argument is given and it is not `NULL`, then it must be
a vertex id, and the same energy function is used to find the community
of the the given vertex. See also the examples below.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## References

J. Reichardt and S. Bornholdt: Statistical Mechanics of Community
Detection, *Phys. Rev. E*, 74, 016110 (2006),
<https://arxiv.org/abs/cond-mat/0603718>

M. E. J. Newman and M. Girvan: Finding and evaluating community
structure in networks, *Phys. Rev. E* 69, 026113 (2004)

V.A. Traag and Jeroen Bruggeman: Community detection in networks with
positive and negative links, <https://arxiv.org/abs/0811.2329> (2008).

## See also

[`communities()`](https://r.igraph.org/reference/communities.md),
[`components()`](https://r.igraph.org/reference/components.md)

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

Jorg Reichardt for the original code and Gabor Csardi
<csardi.gabor@gmail.com> for the igraph glue code.

Changes to the original function for including the possibility of
negative ties were implemented by Vincent Traag
(<https://www.traag.net/>).

## Examples

``` r
g <- sample_gnp(10, 5 / 10) %du% sample_gnp(9, 5 / 9)
g <- add_edges(g, c(1, 12))
g <- induced_subgraph(g, subcomponent(g, 1))
cluster_spinglass(g, spins = 2)
#> IGRAPH clustering spinglass, groups: 2, mod: 0.47
#> + groups:
#>   $`1`
#>   [1] 11 12 13 14 15 16 17 18 19
#>   
#>   $`2`
#>    [1]  1  2  3  4  5  6  7  8  9 10
#>   
cluster_spinglass(g, vertex = 1)
#> $community
#>  [1]  1  2  4 10  8  5  9  3  6  7
#> 
#> $cohesion
#> [1] 9.72561
#> 
#> $adhesion
#> [1] -19.45122
#> 
#> $inner.links
#> [1] 21
#> 
#> $outer.links
#> [1] 1
#> 
```
