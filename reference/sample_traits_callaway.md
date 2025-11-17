# Graph generation based on different vertex types

These functions implement evolving network models based on different
vertex types.

## Usage

``` r
sample_traits_callaway(
  nodes,
  types,
  edge.per.step = 1,
  type.dist = rep(1, types),
  pref.matrix = matrix(1, types, types),
  directed = FALSE
)

traits_callaway(
  nodes,
  types,
  edge.per.step = 1,
  type.dist = rep(1, types),
  pref.matrix = matrix(1, types, types),
  directed = FALSE
)

sample_traits(
  nodes,
  types,
  k = 1,
  type.dist = rep(1, types),
  pref.matrix = matrix(1, types, types),
  directed = FALSE
)

traits(
  nodes,
  types,
  k = 1,
  type.dist = rep(1, types),
  pref.matrix = matrix(1, types, types),
  directed = FALSE
)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- types:

  The number of different vertex types.

- edge.per.step:

  The number of edges to add to the graph per time step.

- type.dist:

  The distribution of the vertex types. This is assumed to be stationary
  in time.

- pref.matrix:

  A matrix giving the preferences of the given vertex types. These
  should be probabilities, i.e. numbers between zero and one.

- directed:

  Logical constant, whether to generate directed graphs.

- k:

  The number of trials per time step, see details below.

## Value

A new graph object.

## Details

For `sample_traits_callaway()` the simulation goes like this: in each
discrete time step a new vertex is added to the graph. The type of this
vertex is generated based on `type.dist`. Then two vertices are selected
uniformly randomly from the graph. The probability that they will be
connected depends on the types of these vertices and is taken from
`pref.matrix`. Then another two vertices are selected and this is
repeated `edges.per.step` times in each time step.

For `sample_traits()` the simulation goes like this: a single vertex is
added at each time step. This new vertex tries to connect to `k`
vertices in the graph. The probability that such a connection is
realized depends on the types of the vertices involved and is taken from
`pref.matrix`.

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
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md),
[`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md),
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md),
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# two types of vertices, they like only themselves
g1 <- sample_traits_callaway(1000, 2, pref.matrix = matrix(c(1, 0, 0, 1), ncol = 2))
g2 <- sample_traits(1000, 2, k = 2, pref.matrix = matrix(c(1, 0, 0, 1), ncol = 2))
```
