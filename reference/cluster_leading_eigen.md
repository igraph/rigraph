# Community structure detecting based on the leading eigenvector of the community matrix

This function tries to find densely connected subgraphs in a graph by
calculating the leading non-negative eigenvector of the modularity
matrix of the graph.

## Usage

``` r
cluster_leading_eigen(
  graph,
  steps = -1,
  weights = NULL,
  start = NULL,
  options = arpack_defaults(),
  callback = NULL,
  extra = NULL,
  env = parent.frame()
)
```

## Arguments

- graph:

  The input graph. Should be undirected as the method needs a symmetric
  matrix.

- steps:

  The number of steps to take, this is actually the number of tries to
  make a step. It is not a particularly useful parameter.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- start:

  `NULL`, or a numeric membership vector, giving the start configuration
  of the algorithm.

- options:

  A named list to override some ARPACK options.

- callback:

  If not `NULL`, then it must be callback function. This is called after
  each iteration, after calculating the leading eigenvector of the
  modularity matrix. See details below.

- extra:

  Additional argument to supply to the callback function.

- env:

  The environment in which the callback function is evaluated.

## Value

`cluster_leading_eigen()` returns a named list with the following
members:

- membership:

  The membership vector at the end of the algorithm, when no more splits
  are possible.

- merges:

  The merges matrix starting from the state described by the
  `membership` member. This is a two-column matrix and each line
  describes a merge of two communities, the first line is the first
  merge and it creates community ‘`N`’, `N` is the number of initial
  communities in the graph, the second line creates community `N+1`,
  etc.

- options:

  Information about the underlying ARPACK computation, see
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.

## Details

The function documented in these section implements the ‘leading
eigenvector’ method developed by Mark Newman, see the reference below.

The heart of the method is the definition of the modularity matrix, `B`,
which is `B=A-P`, `A` being the adjacency matrix of the (undirected)
network, and `P` contains the probability that certain edges are present
according to the ‘configuration model’. In other words, a `P[i,j]`
element of `P` is the probability that there is an edge between vertices
`i` and `j` in a random network in which the degrees of all vertices are
the same as in the input graph.

The leading eigenvector method works by calculating the eigenvector of
the modularity matrix for the largest positive eigenvalue and then
separating vertices into two community based on the sign of the
corresponding element in the eigenvector. If all elements in the
eigenvector are of the same sign that means that the network has no
underlying comuunity structure. Check Newman's paper to understand why
this is a good method for detecting community structure.

## Callback functions

The `callback` argument can be used to supply a function that is called
after each eigenvector calculation. The following arguments are supplied
to this function:

- membership:

  The actual membership vector, with zero-based indexing.

- community:

  The community that the algorithm just tried to split, community
  numbering starts with zero here.

- value:

  The eigenvalue belonging to the leading eigenvector the algorithm just
  found.

- vector:

  The leading eigenvector the algorithm just found.

- multiplier:

  An R function that can be used to multiple the actual modularity
  matrix with an arbitrary vector. Supply the vector as an argument to
  perform this multiplication. This function can be used with ARPACK.

- extra:

  The `extra` argument that was passed to `cluster_leading_eigen()`.

The callback function should return a scalar number. If this number is
non-zero, then the clustering is terminated.

## References

MEJ Newman: Finding community structure using the eigenvectors of
matrices, Physical Review E 74 036104, 2006.

## See also

[`modularity()`](https://r.igraph.org/reference/modularity.igraph.md),
[`cluster_walktrap()`](https://r.igraph.org/reference/cluster_walktrap.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`as.dendrogram()`](https://rdrr.io/r/stats/dendrogram.html)

Community detection
[`as_membership()`](https://r.igraph.org/reference/as_membership.md),
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md),
[`cluster_fast_greedy()`](https://r.igraph.org/reference/cluster_fast_greedy.md),
[`cluster_fluid_communities()`](https://r.igraph.org/reference/cluster_fluid_communities.md),
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md),
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md),
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
g <- make_full_graph(5) %du% make_full_graph(5) %du% make_full_graph(5)
g <- add_edges(g, c(1, 6, 1, 11, 6, 11))
lec <- cluster_leading_eigen(g)
lec
#> IGRAPH clustering leading eigenvector, groups: 3, mod: 0.58
#> + groups:
#>   $`1`
#>   [1] 1 2 3 4 5
#>   
#>   $`2`
#>   [1]  6  7  8  9 10
#>   
#>   $`3`
#>   [1] 11 12 13 14 15
#>   

cluster_leading_eigen(g, start = membership(lec))
#> IGRAPH clustering leading eigenvector, groups: 3, mod: 0.58
#> + groups:
#>   $`1`
#>   [1] 1 2 3 4 5
#>   
#>   $`2`
#>   [1]  6  7  8  9 10
#>   
#>   $`3`
#>   [1] 11 12 13 14 15
#>   
```
