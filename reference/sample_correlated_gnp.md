# Generate a new random graph from a given graph by randomly adding/removing edges

Sample a new graph by perturbing the adjacency matrix of a given graph
and shuffling its vertices.

## Usage

``` r
sample_correlated_gnp(
  old.graph,
  corr,
  p = edge_density(old.graph),
  permutation = NULL
)
```

## Arguments

- old.graph:

  The original graph.

- corr:

  A scalar in the unit interval, the target Pearson correlation between
  the adjacency matrices of the original and the generated graph (the
  adjacency matrix being used as a vector).

- p:

  A numeric scalar, the probability of an edge between two vertices, it
  must in the open (0,1) interval. The default is the empirical edge
  density of the graph. If you are resampling an Erdős-Rényi graph and
  you know the original edge probability of the Erdős-Rényi model, you
  should supply that explicitly.

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

## Related documentation in the C library

[`correlated_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_correlated_game).

## Examples

``` r
g <- sample_gnp(1000, .1)
g2 <- sample_correlated_gnp(g, corr = 0.5)
cor(as.vector(g[]), as.vector(g2[]))
#> [1] 0.5002114
g
#> IGRAPH d04adcb U--- 1000 49769 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from d04adcb:
#>  [1]  1-- 7  4-- 7  1-- 8  2--10  9--11 10--12  6--13  6--14 12--14  1--15
#> [11]  7--16  7--17 12--17 13--17 16--17 12--18  5--21  6--21 13--22  4--23
#> [21]  8--23 15--23  6--24 19--24 20--24 21--24  2--25 18--25  2--26  4--26
#> [31]  7--26  4--27  8--27 24--27  1--28 13--28 18--28  1--29 17--29  5--30
#> [41] 13--30 26--30  5--31 12--31 21--31  9--32 17--33 18--33  6--34 18--34
#> [51] 25--34 32--34 11--35 33--35  1--36 10--36 21--36  6--37 11--37 13--37
#> [61] 15--37 17--37  7--38 13--38 24--38 30--38  2--39  3--39 21--39 35--39
#> [71]  4--40  4--41  8--41  9--41 36--41 37--41  1--42 19--42 23--42 29--42
#> + ... omitted several edges
g2
#> IGRAPH fd5df16 U--- 1000 49866 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from fd5df16:
#>  [1]  2-- 4  4-- 5  1-- 7  4-- 7  2--10  6--14  7--16 13--17 16--17 13--20
#> [11] 17--20  6--21  4--23  8--23 15--23 20--24 10--25 15--25 18--25 24--26
#> [21]  4--27 24--27 25--27 13--28 18--28 13--29 28--29  5--30 13--30  5--31
#> [31] 12--31 13--31 21--31 22--31 16--33 24--33 26--33  5--34  6--34 25--34
#> [41] 18--35 31--35  1--36  9--36 10--36 27--36  6--37  7--37 11--37 13--37
#> [51] 15--37 17--37 13--38 21--38 24--38 29--38  2--39 21--39 35--39  4--40
#> [61]  8--41  9--41 32--41 11--42 12--42 23--42 29--42 32--42 39--42  3--43
#> [71]  5--43  6--43 11--43 27--43 39--43  7--44 10--44 15--44 39--44 23--45
#> + ... omitted several edges
```
