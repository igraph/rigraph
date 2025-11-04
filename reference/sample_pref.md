# Trait-based random generation

Generation of random graphs based on different vertex types.

## Usage

``` r
sample_pref(
  nodes,
  types,
  type.dist = rep(1, types),
  fixed.sizes = FALSE,
  pref.matrix = matrix(1, types, types),
  directed = FALSE,
  loops = FALSE
)

pref(...)

sample_asym_pref(
  nodes,
  types,
  type.dist.matrix = matrix(1, types, types),
  pref.matrix = matrix(1, types, types),
  loops = FALSE
)

asym_pref(...)
```

## Arguments

- nodes:

  The number of vertices in the graphs.

- types:

  The number of different vertex types.

- type.dist:

  The distribution of the vertex types, a numeric vector of length
  ‘types’ containing non-negative numbers. The vector will be normed to
  obtain probabilities.

- fixed.sizes:

  Fix the number of vertices with a given vertex type label. The
  `type.dist` argument gives the group sizes (i.e. number of vertices
  with the different labels) in this case.

- pref.matrix:

  A square matrix giving the preferences of the vertex types. The matrix
  has ‘types’ rows and columns. When generating an undirected graph, it
  must be symmetric.

- directed:

  Logical scalar, whether to create a directed graph.

- loops:

  Logical scalar, whether self-loops are allowed in the graph.

- ...:

  Passed to the constructor, `sample_pref()` or `sample_asym_pref()`.

- type.dist.matrix:

  The joint distribution of the in- and out-vertex types.

## Value

An igraph graph.

## Details

Both models generate random graphs with given vertex types. For
`sample_pref()` the probability that two vertices will be connected
depends on their type and is given by the ‘pref.matrix’ argument. This
matrix should be symmetric to make sense but this is not checked. The
distribution of the different vertex types is given by the ‘type.dist’
vector.

For `sample_asym_pref()` each vertex has an in-type and an out-type and
a directed graph is created. The probability that a directed edge is
realized from a vertex with a given out-type to a vertex with a given
in-type is given in the ‘pref.matrix’ argument, which can be asymmetric.
The joint distribution for the in- and out-types is given in the
‘type.dist.matrix’ argument.

The types of the generated vertices can be retrieved from the `type`
vertex attribute for `sample_pref()` and from the `intype` and `outtype`
vertex attribute for `sample_asym_pref()`.

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
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com> for the R interface

## Examples

``` r
pf <- matrix(c(1, 0, 0, 1), nrow = 2)
g <- sample_pref(20, 2, pref.matrix = pf)
if (FALSE) { # rlang::is_installed("tcltk") && rlang::is_interactive()
# example code

tkplot(g, layout = layout_with_fr)
}

pf <- matrix(c(0, 1, 0, 0), nrow = 2)
g <- sample_asym_pref(20, 2, pref.matrix = pf)
if (FALSE) { # rlang::is_installed("tcltk") && rlang::is_interactive()
tkplot(g, layout = layout_in_circle)
}
```
