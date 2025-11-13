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
#> [1] 0.5044138
g
#> IGRAPH a5137bc U--- 1000 49821 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from a5137bc:
#>  [1]  4-- 6  3-- 8  5-- 8  2-- 9  6-- 9  8--10  9--10  8--11  9--12  8--14
#> [11] 13--15  6--17 12--17  6--19 11--19 12--19 13--19  6--20  7--20 12--22
#> [21] 17--22 13--23 16--23 22--23 10--24 11--24 12--24 13--24 15--24 13--26
#> [31] 14--27  4--28  9--28 25--28  1--29  5--29 15--29 18--29 11--30 21--30
#> [41]  4--32  8--32  9--32 15--32 23--32 24--33 29--33  2--34  7--34 13--34
#> [51]  1--35  4--35  7--36  8--36 25--36 16--37 23--37 29--37 33--37 11--38
#> [61] 37--38  6--39  7--39  9--39 19--39 20--39 32--39  2--40 26--40 18--41
#> [71] 33--41 38--41 30--42 34--42  3--43 16--43 17--43 22--43 25--43 28--43
#> + ... omitted several edges
g2
#> IGRAPH cfe91db U--- 1000 49872 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from cfe91db:
#>  [1]  1-- 5  4-- 6  3-- 8  7-- 8  6-- 9  8--10  8--11  1--12 12--14 14--16
#> [11]  3--17  6--17  9--17 15--17  8--18 10--19 12--19 13--19 14--19  7--20
#> [21]  8--20 13--21 12--22 16--22 17--22 13--23 15--23 22--23 11--24 13--24
#> [31] 11--26 13--26 25--26  9--27 14--27  4--28 25--28  1--29  5--29 18--29
#> [41] 11--30 22--30 20--31 25--31  4--32  6--32  8--32  9--32 15--32 19--33
#> [51] 22--33 29--33 31--33  7--34 13--34 14--34 33--34  1--35 11--35 14--35
#> [61] 22--35 29--35  7--36 17--36 21--36 22--36 24--36 33--36 16--37 29--37
#> [71] 33--37  6--38 11--38  8--39 19--39 32--39  2--40  5--40  3--41 27--41
#> + ... omitted several edges
```
