# Sample the hierarchical stochastic block model

Sampling from a hierarchical stochastic block model of networks.

## Usage

``` r
sample_hierarchical_sbm(n, m, rho, C, p)

hierarchical_sbm(n, m, rho, C, p)
```

## Arguments

- n:

  Integer scalar, the number of vertices.

- m:

  Integer scalar, the number of vertices per block. `n / m` must be
  integer. Alternatively, an integer vector of block sizes, if not all
  the blocks have equal sizes.

- rho:

  Numeric vector, the fraction of vertices per cluster, within a block.
  Must sum up to 1, and `rho * m` must be integer for all elements of
  rho. Alternatively a list of rho vectors, one for each block, if they
  are not the same for all blocks.

- C:

  A square, symmetric numeric matrix, the Bernoulli rates for the
  clusters within a block. Its size must mach the size of the `rho`
  vector. Alternatively, a list of square matrices, if the Bernoulli
  rates differ in different blocks.

- p:

  Numeric scalar, the Bernoulli rate of connections between vertices in
  different blocks.

## Value

An igraph graph.

## Details

The function generates a random graph according to the hierarchical
stochastic block model.

## Related documentation in the C library

[`hsbm_game`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_hsbm_game),
[`hsbm_list_game`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_hsbm_list_game)

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

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## Ten blocks with three clusters each
C <- matrix(c(
  1, 3 / 4, 0,
  3 / 4, 0, 3 / 4,
  0, 3 / 4, 3 / 4
), nrow = 3)
g <- sample_hierarchical_sbm(100, 10, rho = c(3, 3, 4) / 10, C = C, p = 1 / 20)
g
#> IGRAPH 258d6ae U--- 100 468 -- Hierarchical stochastic block model
#> + attr: name (g/c), m (g/n), rho (g/n), C (g/n), p (g/n)
#> + edges from 258d6ae:
#>  [1]  1-- 2  1-- 3  2-- 3  1-- 4  3-- 4  1-- 5  2-- 5  3-- 5  1-- 6  2-- 6
#> [11]  3-- 6  6-- 7  5-- 8  6-- 8  4-- 9  6-- 9  4--10  6--10  7-- 8  7--10
#> [21]  8--10  9--10 11--12 11--13 12--13 11--14 12--15 13--15 12--16 13--16
#> [31] 14--17 15--17 16--17 14--18 16--18 15--19 16--19 14--20 17--18 17--19
#> [41] 17--20 18--20 19--20 21--22 21--23 22--23 21--24 22--24 23--24 21--25
#> [51] 22--25 23--25 21--26 22--26 23--26 24--27 25--27 26--27 25--28 26--28
#> [61] 24--29 25--29 26--29 24--30 25--30 26--30 27--28 27--29 28--29 28--30
#> [71] 31--32 31--33 32--33 32--34 33--34 31--36 32--36 33--36 34--37 35--37
#> + ... omitted several edges

library("Matrix")
image(g[])
```
