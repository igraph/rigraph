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

[`correlated_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_correlated_game).

## Examples

``` r
g <- sample_gnp(1000, .1)
g2 <- sample_correlated_gnp(g, corr = 0.5)
cor(as.vector(g[]), as.vector(g2[]))
#> [1] 0.5001182
g
#> IGRAPH dc260ec U--- 1000 49997 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from dc260ec:
#>  [1]  4-- 7  1-- 9  5--10 11--13 15--16  7--17 12--18  6--19 10--19 12--20
#> [11] 18--20  4--21  9--21 15--21 20--21  4--22  6--22  8--23 13--23 20--23
#> [21] 22--23  2--25 15--25 24--25  3--26  5--26  7--26 15--26  8--27 18--28
#> [31] 11--29 18--29 10--30 16--30  4--31 13--31 18--31 19--31 23--31 24--31
#> [41]  2--32  4--32 18--33 24--33  7--34 17--35  8--36  9--36 13--36 27--36
#> [51] 31--36  9--37 20--37 22--37 24--37 28--37 31--37 15--38 34--38 19--39
#> [61] 27--39 28--39  4--40  8--40  9--40 16--40  8--41 15--41 16--41  5--42
#> [71] 29--42 32--42 38--42 39--42 18--43 20--43 27--43 38--43  2--44 17--44
#> + ... omitted several edges
g2
#> IGRAPH 1019188 U--- 1000 49616 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from 1019188:
#>  [1]  2-- 5  5-- 6  1-- 9  5--10  7--10  2--12  1--13  4--16 15--16  3--17
#> [11]  7--17 12--18 13--18  6--19 16--19 10--20 12--20 18--20  6--21  9--21
#> [21] 15--21 13--23 19--23  7--24 15--25 19--25 24--25  3--26  7--26 15--26
#> [31] 21--26  8--27 13--27 18--28 24--28  7--30 16--30  4--31 18--31 19--31
#> [41] 23--31 24--31  3--32  4--32  5--32 19--32 18--33  7--34  9--34  8--35
#> [51] 17--35  8--36  9--36 13--36 31--36 14--37 15--37 20--37 22--37 36--37
#> [61] 15--38 34--38 20--39 27--39 28--39 32--39  4--40 18--40  8--41 16--41
#> [71] 40--41  3--42  5--42 27--42 31--42 38--42 41--42 14--43 39--44 43--44
#> + ... omitted several edges
```
