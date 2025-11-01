# Sample stochastic block model

Sampling from the stochastic block model of networks

## Usage

``` r
sample_sbm(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE)

sbm(...)
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

  Logical scalar, whether to generate a directed graph.

- loops:

  Logical scalar, whether self-loops are allowed in the graph.

- ...:

  Passed to `sample_sbm()`.

## Value

An igraph graph.

## Details

This function samples graphs from a stochastic block model by (doing the
equivalent of) Bernoulli trials for each potential edge with the
probabilities given by the Bernoulli rate matrix, `pref.matrix`. The
order of the vertices in the generated graph corresponds to the
`block.sizes` argument.

## References

Faust, K., & Wasserman, S. (1992a). Blockmodels: Interpretation and
evaluation. *Social Networks*, 14, 5–61.

## See also

Random graph models (games)
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

## Related documentation in the C library

[`sbm_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_sbm_game).

## Examples

``` r
## Two groups with not only few connection between groups
pm <- cbind(c(.1, .001), c(.001, .05))
g <- sample_sbm(1000, pref.matrix = pm, block.sizes = c(300, 700))
g
#> IGRAPH 080a19c U--- 1000 17060 -- Stochastic block model
#> + attr: name (g/c), loops (g/l)
#> + edges from 080a19c:
#>  [1]  3-- 4  1-- 6  4-- 9  6--10  2--11  2--12  4--14  9--15 12--15 13--15
#> [11] 14--16 10--17  9--18 15--19  1--20  2--20 11--20 19--20  1--21  4--21
#> [21] 16--21  4--22  7--22 15--22 21--22  2--23  6--23 18--23 20--23 18--24
#> [31] 10--25 11--25 16--25  7--26 15--26 19--26  7--27 14--27 17--27 20--27
#> [41] 21--28 11--29 13--29 26--29  2--30 10--30 18--30  5--31 19--31 22--31
#> [51] 28--31 29--31 25--32  4--33 19--33 27--33 28--33  1--34  8--34 11--34
#> [61]  8--35  8--36 11--36  2--37  7--37 29--37 35--37  1--38 24--38 29--38
#> [71] 33--38 35--38 37--38  8--39  9--39 31--39 14--40 38--40 27--41 33--41
#> + ... omitted several edges
```
