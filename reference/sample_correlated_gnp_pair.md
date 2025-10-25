# Sample a pair of correlated \\G(n,p)\\ random graphs

Sample a new graph by perturbing the adjacency matrix of a given graph
and shuffling its vertices.

## Usage

``` r
sample_correlated_gnp_pair(n, corr, p, directed = FALSE, permutation = NULL)
```

## Arguments

- n:

  Numeric scalar, the number of vertices for the sampled graphs.

- corr:

  A scalar in the unit interval, the target Pearson correlation between
  the adjacency matrices of the original the generated graph (the
  adjacency matrix being used as a vector).

- p:

  A numeric scalar, the probability of an edge between two vertices, it
  must in the open (0,1) interval.

- directed:

  Logical scalar, whether to generate directed graphs.

- permutation:

  A numeric vector, a permutation vector that is applied on the vertices
  of the first graph, to get the second graph. If `NULL`, the vertices
  are not permuted.

## Value

A list of two igraph objects, named `graph1` and `graph2`, which are two
graphs whose adjacency matrix entries are correlated with `corr`.

## Details

Please see the reference given below.

## References

Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013). Seeded graph
matching for correlated Erdős-Rényi graphs.
<https://arxiv.org/abs/1304.7844>

## See also

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
[`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md),
[`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md),
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

## Related documentation in the C library

[`correlated_pair_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_correlated_pair_game).

## Examples

``` r
gg <- sample_correlated_gnp_pair(
  n = 10, corr = .8, p = .5,
  directed = FALSE
)
gg
#> $graph1
#> IGRAPH 0d03f45 U--- 10 25 -- 
#> + edges from 0d03f45:
#>  [1] 1-- 2 2-- 3 3-- 4 1-- 5 1-- 6 4-- 6 1-- 7 2-- 7 3-- 7 6-- 7 3-- 8 4-- 8
#> [13] 1-- 9 2-- 9 4-- 9 6-- 9 7-- 9 8-- 9 1--10 2--10 3--10 5--10 7--10 8--10
#> [25] 9--10
#> 
#> $graph2
#> IGRAPH 1f22181 U--- 10 24 -- 
#> + edges from 1f22181:
#>  [1] 1-- 2 2-- 3 3-- 4 1-- 5 1-- 6 4-- 6 1-- 7 2-- 7 3-- 7 6-- 7 3-- 8 4-- 8
#> [13] 5-- 8 1-- 9 2-- 9 4-- 9 6-- 9 7-- 9 8-- 9 2--10 3--10 5--10 7--10 9--10
#> 
cor(as.vector(gg[[1]][]), as.vector(gg[[2]][]))
#> [1] 0.8807048
```
