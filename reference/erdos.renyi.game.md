# Generate random graphs according to the Erdős-Rényi model

**\[deprecated\]**

Since igraph version 0.8.0, both `erdos.renyi.game()` and
`random.graph.game()` are deprecated, and
[`sample_gnp()`](https://r.igraph.org/reference/sample_gnp.md) and
[`sample_gnm()`](https://r.igraph.org/reference/sample_gnm.md) should be
used instead. See these for more details.

`random.graph.game()` is an (also deprecated) alias to this function.

## Usage

``` r
erdos.renyi.game(
  n,
  p.or.m,
  type = c("gnp", "gnm"),
  directed = FALSE,
  loops = FALSE
)
```

## Arguments

- n:

  The number of vertices in the graph.

- p.or.m:

  Either the probability for drawing an edge between two arbitrary
  vertices (\\G(n,p)\\ graph), or the number of edges in the graph (for
  \\G(n,m)\\ graphs).

- type:

  The type of the random graph to create, either
  [`gnp()`](https://r.igraph.org/reference/sample_gnp.md) (\\G(n,p)\\
  graph) or [`gnm()`](https://r.igraph.org/reference/sample_gnm.md)
  (\\G(n,m)\\ graph).

- directed:

  Logical, whether the graph will be directed, defaults to `FALSE`.

- loops:

  Logical, whether to add loop edges, defaults to `FALSE`.

## Value

A graph object.

## Related documentation in the C library

[`erdos_renyi_game_gnp()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_erdos_renyi_game_gnp),
[`erdos_renyi_game_gnm()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_erdos_renyi_game_gnm)

## References

Erdős, P. and Rényi, A., On random graphs, *Publicationes Mathematicae*
6, 290–297 (1959).

## See also

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
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
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- erdos.renyi.game(1000, 1 / 1000)
#> Warning: `erdos.renyi.game()` was deprecated in igraph 0.8.0.
#> ℹ Please use `sample_gnp()` instead.
degree_distribution(g)
#> [1] 0.394 0.348 0.169 0.075 0.013 0.001
```
