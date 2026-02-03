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

## Related documentation in the C library

[`correlated_game()`](https://igraph.org/c/html/latest/igraph-Games.html#igraph_correlated_game),
[[`density()`](https://rdrr.io/r/stats/density.html)](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_density)

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

## Examples

``` r
g <- sample_gnp(1000, .1)
g2 <- sample_correlated_gnp(g, corr = 0.5)
cor(as.vector(g[]), as.vector(g2[]))
#> [1] 0.5044262
g
#> IGRAPH b4d7dea U--- 1000 49836 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from b4d7dea:
#>  [1]  3-- 5  3-- 6  3-- 7  6-- 7  3-- 8  6-- 9  9--10  1--13  6--13 11--13
#> [11]  8--14  1--15  2--15 10--15  5--16 11--16 12--17 14--18  8--19 12--19
#> [21] 14--19  4--20 10--20  3--21 11--21 12--22 15--22  6--23 13--23 18--23
#> [31]  2--24 19--25 22--25 14--26 17--26  2--27 16--27 21--27 24--27  9--28
#> [41] 10--28 15--28 20--28 14--29 18--29  2--30 20--30 21--30 28--30  2--31
#> [51]  9--31 19--31  7--32  8--32 20--32 22--32 28--32  5--33  6--33 19--33
#> [61] 23--33 31--33  5--34  6--34 10--34 16--34 19--34 22--34  7--35 15--35
#> [71]  5--36  7--36 10--36 14--36 15--36 20--36 22--36 35--36 14--37 24--37
#> + ... omitted several edges
g2
#> IGRAPH b5f9842 U--- 1000 49885 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from b5f9842:
#>  [1]  1-- 6  3-- 6  6-- 7  3-- 8  7-- 8  6-- 9  1--13  6--13  1--14  8--14
#> [11]  2--15 11--16 14--16 12--17 12--19  3--20  5--20 10--20  3--21 11--21
#> [21]  6--23 11--23 13--23  9--24 18--24 17--26  2--27 13--27 16--27 24--27
#> [31]  1--28  9--28 11--28 15--28 14--29 18--29 23--29 26--29  2--30 20--30
#> [41] 21--30 28--30  2--31  9--31  7--32  8--32 13--32 20--32 28--32  9--33
#> [51] 20--33 24--33 31--33  5--34  6--34  9--34 14--34 16--34 19--34 22--34
#> [61] 25--34  7--35 15--35  7--36 10--36 15--36 20--36 22--36 24--36 27--36
#> [71] 31--36  6--37 24--37 26--37 30--37  6--38 11--38 28--38 29--38 31--39
#> + ... omitted several edges
```
