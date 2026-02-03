# Sample from a random graph model

Generic function for sampling from network models.

## Usage

``` r
sample_(...)
```

## Arguments

- ...:

  Parameters, see details below.

## Details

`sample_()` is a generic function for creating graphs. For every graph
constructor in igraph that has a `sample_` prefix, there is a
corresponding function without the prefix: e.g. for
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md) there is
also [`pa()`](https://r.igraph.org/reference/sample_pa.md), etc.

The same is true for the deterministic graph samplers, i.e. for each
constructor with a `make_` prefix, there is a corresponding function
without that prefix.

These shorter forms can be used together with `sample_()`. The advantage
of this form is that the user can specify constructor modifiers which
work with all constructors. E.g. the
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md)
modifier adds vertex attributes to the newly created graphs.

See the examples and the various constructor modifiers below.

## Related documentation in the C library

[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/latest/igraph-Operators.html#igraph_simplify),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
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
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
pref_matrix <- cbind(c(0.8, 0.1), c(0.1, 0.7))
blocky <- sample_(sbm(
  n = 20, pref.matrix = pref_matrix,
  block.sizes = c(10, 10)
))

blocky2 <- pref_matrix %>%
  sample_sbm(n = 20, block.sizes = c(10, 10))
```
