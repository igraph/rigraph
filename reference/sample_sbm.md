# Sample stochastic block model

Sampling from the stochastic block model of networks

## Usage

``` r
sample_sbm(n, pref.matrix, block.sizes, ..., directed = FALSE, loops = FALSE)

sbm(n, pref.matrix, block.sizes, ..., directed = FALSE, loops = FALSE)
```

## Arguments

- n:

  Number of vertices in the graph.

- pref.matrix:

  The matrix giving the Bernoulli rates. This is a \\K\times K\\ matrix,
  where \\K\\ is the number of groups. The probability of creating an
  edge between vertices from groups \\i\\ and \\j\\ is given by element
  \\(i,j)\\. For undirected graphs, this matrix must be symmetric.

- block.sizes:

  Numeric vector giving the number of vertices in each group. The sum of
  the vector must match the number of vertices.

- ...:

  These dots are for future extensions and must be empty.

- directed:

  Logical, whether to create a directed graph.

- loops:

  Logical, whether self-loops are allowed in the graph.

## Value

An igraph graph.

## Details

This function samples graphs from a stochastic block model by (doing the
equivalent of) Bernoulli trials for each potential edge with the
probabilities given by the Bernoulli rate matrix, `pref.matrix`. The
order of the vertices in the generated graph corresponds to the
`block.sizes` argument.

## Related documentation in the C library

[`sbm_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_sbm_game)

## References

Faust, K., & Wasserman, S. (1992a). Blockmodels: Interpretation and
evaluation. *Social Networks*, 14, 5–61.

## See also

Random graph models (games):
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
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r

## Two groups with not only few connection between groups
pm <- cbind(c(0.1, 0.001), c(0.001, 0.05))
g <- sample_sbm(1000, pref.matrix = pm, block.sizes = c(300, 700))
g
#> ── <igraph> Stochastic block model ────────────────────────────────── 0548397 ──
#> ℹ undirected
#> ℹ 1000 vertices · 16827 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, loops <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>     [1] 2 ─ 9       6 ─ 10      6 ─ 12      7 ─ 12      8 ─ 12      6 ─ 13     
#>     [7] 7 ─ 14      12 ─ 14     13 ─ 15     2 ─ 16      9 ─ 16      8 ─ 17     
#>    [13] 13 ─ 17     14 ─ 17     3 ─ 18      16 ─ 19     2 ─ 20      7 ─ 20     
#>    [19] 10 ─ 20     13 ─ 20     2 ─ 21      5 ─ 21      7 ─ 21      13 ─ 21    
#>    [25] 18 ─ 21     8 ─ 22      11 ─ 23     13 ─ 23     2 ─ 24      20 ─ 24    
#>    [31] 23 ─ 24     1 ─ 25      4 ─ 25      13 ─ 25     7 ─ 26      13 ─ 26    
#>    [37] 18 ─ 26     19 ─ 26     21 ─ 27     1 ─ 28      5 ─ 28      15 ─ 28    
#>    [43] 25 ─ 28     1 ─ 29      20 ─ 29     4 ─ 30      1 ─ 31      10 ─ 31    
#>    [49] 17 ─ 31     27 ─ 31     14 ─ 32     18 ─ 32     21 ─ 32     24 ─ 32    
#>    [55] 5 ─ 33      27 ─ 33     5 ─ 34      15 ─ 34     24 ─ 34     26 ─ 34    
#> + ... omitted several edges
```
