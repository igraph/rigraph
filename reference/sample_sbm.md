# Sample stochastic block model

Sampling from the stochastic block model of networks

## Usage

``` r
sample_sbm(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE)

sbm(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE)
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
#> ── <igraph> Stochastic block model ────────────────────────────────── 0b65af0 ──
#> ℹ undirected
#> ℹ 1000 vertices · 16856 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, loops <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>     [1] 2 ─ 7       2 ─ 8       7 ─ 8       6 ─ 10      8 ─ 10      8 ─ 12     
#>     [7] 9 ─ 12      7 ─ 13      4 ─ 14      8 ─ 14      9 ─ 15      4 ─ 20     
#>    [13] 5 ─ 20      7 ─ 20      19 ─ 21     20 ─ 21     21 ─ 22     2 ─ 23     
#>    [19] 6 ─ 23      18 ─ 24     18 ─ 25     17 ─ 26     24 ─ 26     3 ─ 27     
#>    [25] 23 ─ 27     18 ─ 28     19 ─ 28     23 ─ 29     13 ─ 30     21 ─ 30    
#>    [31] 8 ─ 31      12 ─ 31     14 ─ 31     2 ─ 32      5 ─ 32      10 ─ 32    
#>    [37] 13 ─ 32     21 ─ 32     24 ─ 32     29 ─ 32     5 ─ 33      10 ─ 33    
#>    [43] 18 ─ 33     21 ─ 33     29 ─ 33     4 ─ 34      12 ─ 34     27 ─ 34    
#>    [49] 17 ─ 35     22 ─ 35     5 ─ 36      10 ─ 36     12 ─ 36     26 ─ 36    
#>    [55] 6 ─ 37      7 ─ 37      15 ─ 37     16 ─ 37     19 ─ 37     2 ─ 38     
#> + ... omitted several edges
```
