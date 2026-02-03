# Random citation graphs

`sample_last_cit()` creates a graph, where vertices age, and gain new
connections based on how long ago their last citation happened.

## Usage

``` r
sample_last_cit(
  n,
  edges = 1,
  agebins = n/7100,
  pref = (1:(agebins + 1))^-3,
  directed = TRUE
)

last_cit(
  n,
  edges = 1,
  agebins = n/7100,
  pref = (1:(agebins + 1))^-3,
  directed = TRUE
)

sample_cit_types(
  n,
  edges = 1,
  types = rep(0, n),
  pref = rep(1, length(types)),
  directed = TRUE,
  attr = TRUE
)

cit_types(
  n,
  edges = 1,
  types = rep(0, n),
  pref = rep(1, length(types)),
  directed = TRUE,
  attr = TRUE
)

sample_cit_cit_types(
  n,
  edges = 1,
  types = rep(0, n),
  pref = matrix(1, nrow = length(types), ncol = length(types)),
  directed = TRUE,
  attr = TRUE
)

cit_cit_types(
  n,
  edges = 1,
  types = rep(0, n),
  pref = matrix(1, nrow = length(types), ncol = length(types)),
  directed = TRUE,
  attr = TRUE
)
```

## Arguments

- n:

  Number of vertices.

- edges:

  Number of edges per step.

- agebins:

  Number of aging bins.

- pref:

  Vector (`sample_last_cit()` and `sample_cit_types()` or matrix
  (`sample_cit_cit_types()`) giving the (unnormalized) citation
  probabilities for the different vertex types.

- directed:

  Logical scalar, whether to generate directed networks.

- types:

  Vector of length ‘`n`’, the types of the vertices. Types are numbered
  from zero.

- attr:

  Logical scalar, whether to add the vertex types to the generated graph
  as a vertex attribute called ‘`type`’.

## Value

A new graph.

## Details

`sample_cit_cit_types()` is a stochastic block model where the graph is
growing.

`sample_cit_types()` is similarly a growing stochastic block model, but
the probability of an edge depends on the (potentially) cited vertex
only.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

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
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md),
[`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md),
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md),
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
