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

  Logical scalar, whether to create a directed graph.

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
#> IGRAPH 37bf966 U--- 1000 16911 -- Stochastic block model
#> + attr: name (g/c), loops (g/l)
#> + edges from 37bf966:
#>  [1]  3-- 4  1-- 6  3-- 7  4-- 8  6-- 8  7-- 8  5--10  8--11  2--12  3--12
#> [11]  5--12  7--12  7--14  4--15 10--15  1--17  8--17 10--17 15--17  1--18
#> [21] 15--18  7--19 10--19 12--19 17--19  1--20  4--20  9--20  9--21 15--21
#> [31] 19--21 20--21  1--22 13--22 15--22  9--23 10--23 11--23 15--23 16--23
#> [41]  3--24  6--24  8--24 14--25 20--25 23--25 17--26 20--26 11--27 15--27
#> [51] 21--27 14--28 24--28 27--28 11--29 21--29  8--30  9--30 11--30 19--30
#> [61] 22--30 26--30  2--31 19--31 25--31 29--31  5--32 19--32 25--32 26--32
#> [71] 31--32 18--33 22--33 24--33  3--34 16--34 19--34  4--35 12--35 23--35
#> + ... omitted several edges
```
