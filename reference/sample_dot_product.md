# Generate random graphs according to the random dot product graph model

In this model, each vertex is represented by a latent position vector.
Probability of an edge between two vertices are given by the dot product
of their latent position vectors.

## Usage

``` r
sample_dot_product(vecs, directed = FALSE)

dot_product(vecs, directed = FALSE)
```

## Arguments

- vecs:

  A numeric matrix in which each latent position vector is a column.

- directed:

  A logical scalar, TRUE if the generated graph should be directed.

## Value

An igraph graph object which is the generated random dot product graph.

## Details

The dot product of the latent position vectors should be in the \[0,1\]
interval, otherwise a warning is given. For negative dot products, no
edges are added; dot products that are larger than one always add an
edge.

## Related documentation in the C library

[`dot_product_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_dot_product_game)

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

## Examples

``` r
## A randomly generated  graph
lpvs <- matrix(rnorm(200), 20, 10)
lpvs <- apply(lpvs, 2, function(x) {
  return(abs(x) / sqrt(sum(x^2)))
})
g <- sample_dot_product(lpvs)
g
#> IGRAPH 59bded8 U--- 10 22 -- 
#> + edges from 59bded8:
#>  [1] 1-- 2 1-- 3 1-- 5 2-- 3 2-- 5 2-- 7 2--10 3-- 4 3-- 6 3-- 9 3--10 4-- 5
#> [13] 4-- 6 4-- 7 4-- 8 5-- 6 5-- 7 5-- 8 5-- 9 6--10 7-- 8 7--10

## Sample latent vectors from the surface of the unit sphere
lpvs2 <- sample_sphere_surface(dim = 5, n = 20)
g2 <- sample_dot_product(lpvs2)
g2
#> IGRAPH 073ea0c U--- 20 135 -- 
#> + edges from 073ea0c:
#>  [1]  1-- 2  1-- 4  1-- 5  1-- 6  1-- 8  1-- 9  1--10  1--11  1--12  1--13
#> [11]  1--15  1--16  1--17  1--18  1--19  1--20  2-- 3  2-- 4  2-- 5  2--11
#> [21]  2--12  2--13  2--14  2--15  2--17  2--19  2--20  3-- 5  3-- 7  3-- 8
#> [31]  3-- 9  3--12  3--13  3--14  3--16  3--17  4-- 5  4-- 9  4--10  4--12
#> [41]  4--14  4--15  4--19  4--20  5-- 6  5-- 9  5--10  5--11  5--12  5--13
#> [51]  5--14  5--15  5--16  5--17  5--18  5--19  5--20  6-- 9  6--10  6--11
#> [61]  6--12  6--13  6--15  6--16  6--17  6--19  6--20  7-- 8  7-- 9  7--10
#> [71]  7--12  7--14  7--18  7--19  8-- 9  8--11  8--12  8--13  8--14  8--17
#> [81]  8--18  8--19  8--20  9--10  9--11  9--12  9--13  9--14  9--15  9--16
#> + ... omitted several edges
```
