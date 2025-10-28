# Generate random graphs using preferential attachment

Preferential attachment is a family of simple stochastic algorithms for
building a graph. Variants include the Barabási-Abert model and the
Price model.

## Usage

``` r
sample_pa(
  n,
  power = 1,
  m = NULL,
  out.dist = NULL,
  out.seq = NULL,
  out.pref = FALSE,
  zero.appeal = 1,
  directed = TRUE,
  algorithm = c("psumtree", "psumtree-multiple", "bag"),
  start.graph = NULL
)

pa(...)
```

## Arguments

- n:

  Number of vertices.

- power:

  The power of the preferential attachment, the default is one, i.e.
  linear preferential attachment.

- m:

  Numeric constant, the number of edges to add in each time step This
  argument is only used if both `out.dist` and `out.seq` are omitted or
  NULL.

- out.dist:

  Numeric vector, the distribution of the number of edges to add in each
  time step. This argument is only used if the `out.seq` argument is
  omitted or NULL.

- out.seq:

  Numeric vector giving the number of edges to add in each time step.
  Its first element is ignored as no edges are added in the first time
  step.

- out.pref:

  Logical, if true the total degree is used for calculating the citation
  probability, otherwise the in-degree is used.

- zero.appeal:

  The ‘attractiveness’ of the vertices with no adjacent edges. See
  details below.

- directed:

  Whether to create a directed graph.

- algorithm:

  The algorithm to use for the graph generation. `psumtree` uses a
  partial prefix-sum tree to generate the graph, this algorithm can
  handle any `power` and `zero.appeal` values and never generates
  multiple edges. `psumtree-multiple` also uses a partial prefix-sum
  tree, but the generation of multiple edges is allowed. Before the 0.6
  version igraph used this algorithm if `power` was not one, or
  `zero.appeal` was not one. `bag` is the algorithm that was previously
  (before version 0.6) used if `power` was one and `zero.appeal` was one
  as well. It works by putting the ids of the vertices into a bag
  (multiset, really), exactly as many times as their (in-)degree, plus
  once more. Then the required number of cited vertices are drawn from
  the bag, with replacement. This method might generate multiple edges.
  It only works if `power` and `zero.appeal` are equal one.

- start.graph:

  `NULL` or an igraph graph. If a graph, then the supplied graph is used
  as a starting graph for the preferential attachment algorithm. The
  graph should have at least one vertex. If a graph is supplied here and
  the `out.seq` argument is not `NULL`, then it should contain the out
  degrees of the new vertices only, not the ones in the `start.graph`.

- ...:

  Passed to `sample_pa()`.

## Value

A graph object.

## Details

This is a simple stochastic algorithm to generate a graph. It is a
discrete time step model and in each time step a single vertex is added.

We start with a single vertex and no edges in the first time step. Then
we add one vertex in each time step and the new vertex initiates some
edges to old vertices. The probability that an old vertex is chosen is
given by \$\$P\[i\] \sim k_i^\alpha+a\$\$ where \\k_i\\ is the in-degree
of vertex \\i\\ in the current time step (more precisely the number of
adjacent edges of \\i\\ which were not initiated by \\i\\ itself) and
\\\alpha\\ and \\a\\ are parameters given by the `power` and
`zero.appeal` arguments.

The number of edges initiated in a time step is given by the `m`,
`out.dist` and `out.seq` arguments. If `out.seq` is given and not NULL
then it gives the number of edges to add in a vector, the first element
is ignored, the second is the number of edges to add in the second time
step and so on. If `out.seq` is not given or null and `out.dist` is
given and not NULL then it is used as a discrete distribution to
generate the number of edges in each time step. Its first element is the
probability that no edges will be added, the second is the probability
that one edge is added, etc. (`out.dist` does not need to sum up to one,
it normalized automatically.) `out.dist` should contain non-negative
numbers and at east one element should be positive.

If both `out.seq` and `out.dist` are omitted or NULL then `m` will be
used, it should be a positive integer constant and `m` edges will be
added in each time step.

`sample_pa()` generates a directed graph by default, set `directed` to
`FALSE` to generate an undirected graph. Note that even if an undirected
graph is generated \\k_i\\ denotes the number of adjacent edges not
initiated by the vertex itself and not the total (in- + out-) degree of
the vertex, unless the `out.pref` argument is set to `TRUE`.

## References

Barabási, A.-L. and Albert R. 1999. Emergence of scaling in random
networks *Science*, 286 509–512.

de Solla Price, D. J. 1965. Networks of Scientific Papers *Science*, 149
510–515.

## See also

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
[`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md),
[`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md),
[`sample_correlated_gnp_pair()`](https://r.igraph.org/reference/sample_correlated_gnp_pair.md),
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md),
[`sample_dot_product()`](https://r.igraph.org/reference/sample_dot_product.md),
[`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md),
[`sample_fitness_pl()`](https://r.igraph.org/reference/sample_fitness_pl.md),
[`sample_forestfire()`](https://r.igraph.org/reference/sample_forestfire.md),
[`sample_gnm()`](https://r.igraph.org/reference/sample_gnm.md),
[`sample_gnp()`](https://r.igraph.org/reference/sample_gnp.md),
[`sample_grg()`](https://r.igraph.org/reference/sample_grg.md),
[`sample_growing()`](https://r.igraph.org/reference/sample_growing.md),
[`sample_hierarchical_sbm()`](https://r.igraph.org/reference/sample_hierarchical_sbm.md),
[`sample_islands()`](https://r.igraph.org/reference/sample_islands.md),
[`sample_k_regular()`](https://r.igraph.org/reference/sample_k_regular.md),
[`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md),
[`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md),
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md),
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_pa(10000)
degree_distribution(g)
#>   [1] 0.0000 0.6627 0.1724 0.0648 0.0352 0.0180 0.0107 0.0093 0.0052 0.0038
#>  [11] 0.0020 0.0025 0.0021 0.0014 0.0014 0.0007 0.0011 0.0008 0.0004 0.0010
#>  [21] 0.0003 0.0002 0.0004 0.0002 0.0005 0.0002 0.0000 0.0003 0.0000 0.0002
#>  [31] 0.0000 0.0000 0.0000 0.0001 0.0001 0.0002 0.0003 0.0001 0.0001 0.0002
#>  [41] 0.0002 0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000
#>  [51] 0.0000 0.0000 0.0001 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
#>  [61] 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#>  [71] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#>  [81] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#>  [91] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [101] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [111] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [121] 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000
#> [131] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [141] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [151] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [161] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [171] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000
#> [181] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [191] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [201] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [211] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001
```
