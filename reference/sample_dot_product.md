# Generate random graphs according to the random dot product graph model

In this model, each vertex is represented by a latent position vector.
Probability of an edge between two vertices are given by the dot product
of their latent position vectors.

## Usage

``` r
sample_dot_product(vecs, directed = FALSE)

dot_product(...)
```

## Arguments

- vecs:

  A numeric matrix in which each latent position vector is a column.

- directed:

  A logical scalar, TRUE if the generated graph should be directed.

- ...:

  Passed to `sample_dot_product()`.

## Value

An igraph graph object which is the generated random dot product graph.

## Details

The dot product of the latent position vectors should be in the \[0,1\]
interval, otherwise a warning is given. For negative dot products, no
edges are added; dot products that are larger than one always add an
edge.

## References

Christine Leigh Myers Nickel: Random dot product graphs, a model for
social networks. Dissertation, Johns Hopkins University, Maryland, USA,
2006.

## See also

[`sample_dirichlet()`](https://r.igraph.org/reference/sample_dirichlet.md),
[`sample_sphere_surface()`](https://r.igraph.org/reference/sample_sphere_surface.md)
and
[`sample_sphere_volume()`](https://r.igraph.org/reference/sample_sphere_volume.md)
for sampling position vectors.

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
[`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md),
[`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md),
[`sample_correlated_gnp_pair()`](https://r.igraph.org/reference/sample_correlated_gnp_pair.md),
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md),
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

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`dot_product_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_dot_product_game).

## Examples

``` r
## A randomly generated  graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
g <- sample_dot_product(lpvs)
g
#> IGRAPH b976255 U--- 10 32 -- 
#> + edges from b976255:
#>  [1] 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 9 2-- 3 2-- 5 2-- 6 2-- 7 2-- 9 2--10
#> [13] 3-- 5 3-- 6 3-- 7 3-- 8 3--10 4-- 5 4-- 6 4-- 8 4--10 5-- 6 5-- 7 5-- 8
#> [25] 6-- 7 6-- 8 6-- 9 7-- 9 7--10 8-- 9 8--10 9--10

## Sample latent vectors from the surface of the unit sphere
lpvs2 <- sample_sphere_surface(dim = 5, n = 20)
g2 <- sample_dot_product(lpvs2)
g2
#> IGRAPH a00b745 U--- 20 136 -- 
#> + edges from a00b745:
#>  [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--10 1--11 1--14 1--16
#> [13] 1--17 1--19 1--20 2-- 3 2-- 4 2-- 5 2-- 7 2-- 8 2-- 9 2--10 2--11 2--12
#> [25] 2--13 2--14 2--15 2--16 2--17 2--19 2--20 3-- 4 3-- 5 3-- 6 3-- 8 3-- 9
#> [37] 3--13 3--14 3--15 3--16 3--18 3--19 3--20 4-- 7 4-- 9 4--12 4--13 4--14
#> [49] 4--16 4--17 4--19 5-- 6 5-- 7 5-- 8 5--10 5--11 5--15 5--17 5--20 6-- 7
#> [61] 6-- 8 6--10 6--11 6--12 6--14 6--15 6--16 6--19 6--20 7-- 9 7--10 7--12
#> [73] 7--13 7--14 7--15 7--16 7--18 7--19 8--11 8--13 8--14 8--15 8--16 8--17
#> [85] 8--18 8--19 8--20 9--10 9--11 9--12 9--13 9--14 9--16 9--17 9--18 9--19
#> [97] 9--20
#> + ... omitted several edges
```
