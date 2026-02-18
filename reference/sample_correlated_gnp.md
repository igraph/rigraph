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

[`correlated_game`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_correlated_game),
[`density`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_density)

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
#> [1] 0.5044107
g
#> IGRAPH ccff044 U--- 1000 49832 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from ccff044:
#>  [1]  1-- 6  3-- 7  3--11  7--11  8--11 10--11  7--13  6--14 10--14 12--14
#> [11]  7--15 13--15 11--16  4--17  9--18 12--18  7--19 14--19  1--20  7--20
#> [21]  8--22 11--22  6--23  9--23 19--23 11--24 16--24 19--24  7--25  8--25
#> [31] 13--25 18--25 15--26 19--26  6--27 24--27 25--27  6--28  9--28 16--28
#> [41] 26--28 17--29 18--29  2--30  4--30 10--30 18--30 19--30  3--31  7--31
#> [51] 15--31 21--31 22--31 26--31  2--32  5--32  8--32 26--32  3--33 27--33
#> [61] 29--33 32--33  4--34  5--34 10--34 12--34 25--34  6--35 16--35 18--35
#> [71] 22--35 26--35  2--36  3--36 11--36 22--36  9--37 27--37 13--38 19--38
#> + ... omitted several edges
g2
#> IGRAPH e4708ac U--- 1000 49888 -- Correlated random graph
#> + attr: name (g/c), corr (g/n), p (g/n)
#> + edges from e4708ac:
#>  [1]  1-- 4  1-- 6  3-- 6  3-- 8  1-- 9  2--10  7--11  8--11 10--11 10--14
#> [11] 12--14  5--16  2--17 11--17 12--18  7--19 14--19 17--19  3--20  7--20
#> [21]  8--22  6--23 13--23 19--23 11--24 15--24 16--24 19--24  4--25  7--25
#> [31]  8--25  9--25 13--25 18--25  1--26  5--26 13--26 19--26  6--27 24--27
#> [41]  6--28  1--29  4--29  8--29 18--29 19--29  2--30  4--30 18--30 19--30
#> [51] 27--30  1--31  3--31  7--31 15--31 20--31 22--31 26--31  5--32  8--32
#> [61] 26--32 25--33 26--33 29--33 32--33  1--34  4--34 19--34 26--34  6--35
#> [71] 14--35 18--35  3--36 33--36  3--37  9--37 27--37 13--38 19--38  3--39
#> + ... omitted several edges
```
