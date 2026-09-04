# Generate a new random graph from a given graph by randomly adding/removing edges

Sample a new graph by perturbing the adjacency matrix of a given graph
and shuffling its vertices.

## Usage

``` r
sample_correlated_gnp(old.graph, corr, ..., p = NULL, permutation = NULL)
```

## Arguments

- old.graph:

  The original graph.

- corr:

  A scalar in the unit interval, the target Pearson correlation between
  the adjacency matrices of the original and the generated graph (the
  adjacency matrix being used as a vector).

- ...:

  These dots are for future extensions and must be empty.

- p:

  A numeric scalar, the probability of an edge between two vertices, it
  must in the open (0,1) interval. The default `NULL` uses the empirical
  edge density of the graph. If you are resampling an Erdős-Rényi graph
  and you know the original edge probability of the Erdős-Rényi model,
  you should supply that explicitly.

- permutation:

  A numeric vector, a permutation vector that is applied on the vertices
  of the first graph, to get the second graph. If `NULL`, the vertices
  are not permuted.

## Value

An unweighted graph of the same size as `old.graph` such that the
correlation coefficient between the entries of the two adjacency
matrices is `corr`. Note each pair of corresponding matrix entries is a
pair of correlated Bernoulli random variables.

## Details

Please see the reference given below.

## Related documentation in the C library

[`correlated_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_correlated_game),
[`density()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_density)

## References

Lyzinski, V., Fishkind, D. E., Priebe, C. E. (2013). Seeded graph
matching for correlated Erdős-Rényi graphs.
<https://arxiv.org/abs/1304.7844>

## See also

Random graph models (games):
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
[`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md),
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

## Examples

``` r
g <- sample_gnp(1000, 0.1)
g2 <- sample_correlated_gnp(g, corr = 0.5)
cor(as.vector(g[]), as.vector(g2[]))
#> [1] 0.5028799
g
#> ── <igraph> Erdos-Renyi (gnp) graph ───────────────────────────────── cd41663 ──
#> ℹ undirected
#> ℹ 1000 vertices · 49890 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, type <chr>, loops <lgl>, p <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>     [1] 5 ─ 7       6 ─ 7       6 ─ 8       3 ─ 9       6 ─ 10      1 ─ 12     
#>     [7] 1 ─ 13      4 ─ 13      7 ─ 13      8 ─ 13      8 ─ 14      9 ─ 14     
#>    [13] 3 ─ 15      4 ─ 16      13 ─ 16     3 ─ 18      5 ─ 18      7 ─ 18     
#>    [19] 9 ─ 18      10 ─ 18     17 ─ 18     7 ─ 19      11 ─ 19     7 ─ 21     
#>    [25] 16 ─ 21     6 ─ 22      16 ─ 22     18 ─ 22     4 ─ 23      8 ─ 23     
#>    [31] 16 ─ 23     1 ─ 24      7 ─ 24      4 ─ 25      5 ─ 26      10 ─ 26    
#>    [37] 11 ─ 26     5 ─ 27      11 ─ 27     14 ─ 27     15 ─ 27     2 ─ 28     
#>    [43] 4 ─ 28      10 ─ 28     15 ─ 28     16 ─ 29     25 ─ 29     9 ─ 30     
#>    [49] 11 ─ 30     14 ─ 30     23 ─ 30     28 ─ 30     1 ─ 31      20 ─ 31    
#>    [55] 23 ─ 31     2 ─ 32      4 ─ 32      9 ─ 32      12 ─ 32     15 ─ 32    
#> + ... omitted several edges
g2
#> ── <igraph> Correlated random graph ───────────────────────────────── 4c8fea1 ──
#> ℹ undirected
#> ℹ 1000 vertices · 50075 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, corr <dbl>, p <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>     [1] 2 ─ 4       3 ─ 5       6 ─ 7       6 ─ 8       6 ─ 10      7 ─ 12     
#>     [7] 7 ─ 13      8 ─ 13      10 ─ 13     8 ─ 14      9 ─ 14      3 ─ 15     
#>    [13] 4 ─ 16      13 ─ 16     7 ─ 18      9 ─ 18      10 ─ 18     17 ─ 18    
#>    [19] 3 ─ 20      7 ─ 20      17 ─ 20     7 ─ 21      15 ─ 21     8 ─ 22     
#>    [25] 16 ─ 22     18 ─ 22     19 ─ 22     4 ─ 23      22 ─ 23     1 ─ 24     
#>    [31] 7 ─ 24      23 ─ 24     4 ─ 25      1 ─ 26      11 ─ 26     5 ─ 27     
#>    [37] 11 ─ 27     14 ─ 27     2 ─ 28      4 ─ 28      15 ─ 28     24 ─ 28    
#>    [43] 4 ─ 29      13 ─ 29     23 ─ 29     25 ─ 29     11 ─ 30     18 ─ 30    
#>    [49] 23 ─ 30     28 ─ 30     1 ─ 31      10 ─ 31     15 ─ 31     27 ─ 31    
#>    [55] 7 ─ 32      9 ─ 32      12 ─ 32     16 ─ 32     18 ─ 32     23 ─ 32    
#> + ... omitted several edges
```
