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
#> [1] 0.504556
g
#> IGRAPH 4ae2a61 U--- 1000 49828 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from 4ae2a61:
#>  [1]  2-- 4  3-- 4  4-- 5  2-- 8  3-- 8  6-- 8  7-- 8  5-- 9  6-- 9  7-- 9
#> [11]  1--11  2--11 13--14  5--15  8--16 11--16  2--17 12--17 13--17 14--17
#> [21] 15--17  1--18 11--20 18--21 14--22 19--22 14--23 17--23 21--23  9--24
#> [31] 12--24 10--25 20--25 13--27 17--27 18--27 24--27  6--28 11--29 16--29
#> [41] 21--29 26--29  4--30 25--30 28--30  6--32  7--32 24--32 19--33 26--33
#> [51] 32--33  4--34 18--34 11--35 17--35 18--35 20--35 30--35 31--35  9--36
#> [61] 17--36  6--37  1--38 16--38 21--38 16--39 20--39 30--39  5--40  6--40
#> [71] 11--40 14--40 17--40 31--40 35--40 36--40 16--41 29--41 40--41  3--42
#> + ... omitted several edges
g2
#> IGRAPH d003870 U--- 1000 49877 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from d003870:
#>  [1]  2-- 4  3-- 4  4-- 5  3-- 6  3-- 8  6-- 8  7-- 8  6-- 9  7-- 9  7--10
#> [11]  2--11  8--11  2--12  8--13 13--14  5--15  8--16 12--17 14--17 15--17
#> [21]  1--18  6--18  2--19 11--19 18--21 14--23 21--23  2--24  9--24 12--24
#> [31]  8--25 14--25  1--26 18--27 19--27 22--27  4--28  6--28 17--28  9--29
#> [41] 11--29 20--29 24--29  4--30  6--30 13--30  6--31 10--31 11--31 13--31
#> [51] 21--31  6--32  3--33 26--33 32--33 10--34 18--34  8--35 18--35 20--35
#> [61] 30--35 31--35 17--36 18--36  7--37  9--37 21--37 14--38 20--39 25--39
#> [71] 28--39 30--39 32--39  6--40 17--40 31--40 33--40 36--40 11--41 28--41
#> + ... omitted several edges
```
