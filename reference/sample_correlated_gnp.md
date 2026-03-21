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

[`correlated_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_correlated_game),
[`density()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_density)

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
#> [1] 0.5027749
g
#> IGRAPH 25216b3 U--- 1000 49901 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from 25216b3:
#>  [1]  1-- 3  3-- 5  2-- 7  4-- 8  9--10  6--11 11--12  6--15 11--15 14--15
#> [11]  1--17  3--17 10--17  4--18  9--18 10--18 16--18  9--19  9--21 15--21
#> [21]  2--22  8--22 18--22 17--23 21--23 22--23  3--24  8--25 21--25  2--26
#> [31]  6--27 11--27  5--28 14--28 18--29 21--29 24--29 27--29  7--30 11--30
#> [41] 21--30  6--31 10--31 17--31 27--31  6--32 10--32 18--32 21--32 22--32
#> [51]  4--33  6--33  9--33 12--33 13--33 18--33 27--33  9--34 10--34 24--34
#> [61] 29--34  4--35  5--35  6--35  7--35 27--35 31--35 32--35  5--36  7--36
#> [71] 12--36 13--36 14--36 23--36 24--36 33--36  7--37 13--37 17--37 18--37
#> + ... omitted several edges
g2
#> IGRAPH 0a5e2e1 U--- 1000 50083 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from 0a5e2e1:
#>  [1]  2-- 7  4-- 8  9--10  4--15  6--15  9--15 13--15 14--15 14--16  1--17
#> [11]  9--18  6--20  5--21  8--22 13--22 15--22 18--22  3--24 15--26 18--26
#> [21] 21--27  5--28 14--28 16--28 27--28 14--29 18--29 24--29  7--30  3--31
#> [31] 27--31  6--32  9--32 13--32 22--32 25--32 26--32  3--33  4--33  6--33
#> [41] 12--33 18--33 27--33  9--34 10--34 15--34 29--34  4--35  5--35  6--35
#> [51] 17--35 27--35 31--35 32--35 34--35  5--36 13--36 15--36 21--36 24--36
#> [61] 33--36  3--37 10--37 17--37 31--37 32--37  2--38 20--38 27--38 32--38
#> [71]  5--39  7--39 10--39 24--39  5--40 16--40 21--40 29--40  1--41  9--41
#> + ... omitted several edges
```
