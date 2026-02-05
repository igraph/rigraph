# Finding community structure of a graph using the Leiden algorithm of Traag, van Eck & Waltman.

The Leiden algorithm is similar to the Louvain algorithm,
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md),
but it is faster and yields higher quality solutions. It can optimize
both modularity and the Constant Potts Model, which does not suffer from
the resolution-limit (see preprint <https://arxiv.org/abs/1104.3083>).

## Usage

``` r
cluster_leiden(
  graph,
  objective_function = c("CPM", "modularity"),
  ...,
  weights = NULL,
  resolution = 1,
  resolution_parameter = deprecated(),
  beta = 0.01,
  initial_membership = NULL,
  n_iterations = 2,
  vertex_weights = NULL
)
```

## Arguments

- graph:

  The input graph. It must be undirected.

- objective_function:

  Whether to use the Constant Potts Model (CPM) or modularity. Must be
  either `"CPM"` or `"modularity"`.

- ...:

  These dots are for future extensions and must be empty.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- resolution:

  The resolution parameter to use. Higher resolutions lead to more
  smaller communities, while lower resolutions lead to fewer larger
  communities.

- resolution_parameter:

  **\[superseded\]** Use `resolution` instead.

- beta:

  Parameter affecting the randomness in the Leiden algorithm. This
  affects only the refinement step of the algorithm.

- initial_membership:

  If provided, the Leiden algorithm will try to improve this provided
  membership. If no argument is provided, the aglorithm simply starts
  from the singleton partition.

- n_iterations:

  the number of iterations to iterate the Leiden algorithm. Each
  iteration may improve the partition further.

- vertex_weights:

  the vertex weights used in the Leiden algorithm. If this is not
  provided, it will be automatically determined on the basis of the
  `objective_function`. Please see the details of this function how to
  interpret the vertex weights.

## Value

`cluster_leiden()` returns a
[`communities()`](https://r.igraph.org/reference/communities.md) object,
please see the
[`communities()`](https://r.igraph.org/reference/communities.md) manual
page for details.

## Details

The Leiden algorithm consists of three phases: (1) local moving of
nodes, (2) refinement of the partition and (3) aggregation of the
network based on the refined partition, using the non-refined partition
to create an initial partition for the aggregate network. In the local
move procedure in the Leiden algorithm, only nodes whose neighborhood
has changed are visited. The refinement is done by restarting from a
singleton partition within each cluster and gradually merging the
subclusters. When aggregating, a single cluster may then be represented
by several nodes (which are the subclusters identified in the
refinement).

The Leiden algorithm provides several guarantees. The Leiden algorithm
is typically iterated: the output of one iteration is used as the input
for the next iteration. At each iteration all clusters are guaranteed to
be connected and well-separated. After an iteration in which nothing has
changed, all nodes and some parts are guaranteed to be locally optimally
assigned. Finally, asymptotically, all subsets of all clusters are
guaranteed to be locally optimally assigned. For more details, please
see Traag, Waltman & van Eck (2019).

The objective function being optimized is

\$\$\frac{1}{2m} \sum\_{ij} (A\_{ij} - \gamma n_i n_j)\delta(\sigma_i,
\sigma_j)\$\$

where \\m\\ is the total edge weight, \\A\_{ij}\\ is the weight of edge
\\(i, j)\\, \\\gamma\\ is the so-called resolution parameter, \\n_i\\ is
the node weight of node \\i\\, \\\sigma_i\\ is the cluster of node \\i\\
and \\\delta(x, y) = 1\\ if and only if \\x = y\\ and \\0\\ otherwise.
By setting \\n_i = k_i\\, the degree of node \\i\\, and dividing
\\\gamma\\ by \\2m\\, you effectively obtain an expression for
modularity.

Hence, the standard modularity will be optimized when you supply the
degrees as `vertex_weights` and by supplying as a resolution parameter
\\\frac{1}{2m}\\, with \\m\\ the number of edges. If you do not specify
any `vertex_weights`, the correct vertex weights and scaling of
\\\gamma\\ is determined automatically by the `objective_function`
argument.

## Related documentation in the C library

[`community_leiden()`](https://igraph.org/c/html/0.10.17/igraph-Community.html#igraph_community_leiden),
[[`strength()`](https://r.igraph.org/reference/strength.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_strength),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Traag, V. A., Waltman, L., & van Eck, N. J. (2019). From Louvain to
Leiden: guaranteeing well-connected communities. Scientific reports,
9(1), 5233. doi: 10.1038/s41598-019-41695-z, arXiv:1810.08473v3
\[cs.SI\]

## See also

See [`communities()`](https://r.igraph.org/reference/communities.md) for
extracting the membership, modularity scores, etc. from the results.

Other community detection algorithms:
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
[`cluster_louvain()`](https://r.igraph.org/reference/cluster_louvain.md)
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md)
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md)
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md)
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md)

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
[`cluster_leading_eigen()`](https://r.igraph.org/reference/cluster_leading_eigen.md),
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

Vincent Traag

## Examples

``` r
g <- make_graph("Zachary")
# By default CPM is used
r <- quantile(strength(g))[2] / (gorder(g) - 1)
# Set seed for sake of reproducibility
set.seed(1)
ldc <- cluster_leiden(g, resolution = r)
print(ldc)
#> IGRAPH clustering leiden, groups: 2, mod: NA
#> + groups:
#>   $`1`
#>    [1]  1  2  3  4  5  6  7  8 10 11 12 13 14 17 18 20 22
#>   
#>   $`2`
#>    [1]  9 15 16 19 21 23 24 25 26 27 28 29 30 31 32 33 34
#>   
plot(ldc, g)
```
