# Generate random graphs according to the random dot product graph model

In this model, each vertex is represented by a latent position vector.
Probability of an edge between two vertices are given by the dot product
of their latent position vectors.

## Usage

``` r
sample_dot_product(vecs, ..., directed = FALSE)

dot_product(vecs, ..., directed = FALSE)
```

## Arguments

- vecs:

  A numeric matrix in which each latent position vector is a column.

- ...:

  These dots are for future extensions and must be empty.

- directed:

  A Logical, TRUE if the generated graph should be directed.

## Value

An igraph graph object which is the generated random dot product graph.

## Details

The dot product of the latent position vectors should be in the \[0,1\]
interval, otherwise a warning is given. For negative dot products, no
edges are added; dot products that are larger than one always add an
edge.

## Related documentation in the C library

[`dot_product_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_dot_product_game)

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

Random graph models (games):
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
#> ── <igraph> ───────────────────────────────────────────────────────── ac182f5 ──
#> ℹ undirected
#> ℹ 10 vertices · 20 edges
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 3   1 ─ 4   1 ─ 7   1 ─ 10  2 ─ 7   2 ─ 8   2 ─ 9   2 ─ 10  3 ─ 4  
#> [10] 3 ─ 5   3 ─ 8   3 ─ 10  4 ─ 7   5 ─ 7   5 ─ 8   5 ─ 10  6 ─ 7   6 ─ 10 
#> [19] 7 ─ 9   8 ─ 10 

## Sample latent vectors from the surface of the unit sphere
lpvs2 <- sample_sphere_surface(dim = 5, n = 20)
g2 <- sample_dot_product(lpvs2)
g2
#> ── <igraph> ───────────────────────────────────────────────────────── 09abaa9 ──
#> ℹ undirected
#> ℹ 20 vertices · 141 edges
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>   [1] 1 ─ 2    1 ─ 3    1 ─ 5    1 ─ 6    1 ─ 7    1 ─ 8    1 ─ 9    1 ─ 10  
#>   [9] 1 ─ 11   1 ─ 12   1 ─ 13   1 ─ 14   1 ─ 15   1 ─ 16   1 ─ 17   1 ─ 19  
#>  [17] 1 ─ 20   2 ─ 3    2 ─ 5    2 ─ 6    2 ─ 7    2 ─ 8    2 ─ 9    2 ─ 10  
#>  [25] 2 ─ 11   2 ─ 12   2 ─ 13   2 ─ 15   2 ─ 17   2 ─ 18   3 ─ 5    3 ─ 6   
#>  [33] 3 ─ 7    3 ─ 8    3 ─ 10   3 ─ 11   3 ─ 12   3 ─ 13   3 ─ 16   3 ─ 17  
#>  [41] 3 ─ 19   3 ─ 20   4 ─ 5    4 ─ 7    4 ─ 9    4 ─ 10   4 ─ 11   4 ─ 13  
#>  [49] 4 ─ 18   4 ─ 19   4 ─ 20   5 ─ 6    5 ─ 7    5 ─ 10   5 ─ 11   5 ─ 12  
#>  [57] 5 ─ 13   5 ─ 14   5 ─ 17   5 ─ 18   5 ─ 19   5 ─ 20   6 ─ 7    6 ─ 8   
#>  [65] 6 ─ 9    6 ─ 10   6 ─ 11   6 ─ 12   6 ─ 14   6 ─ 15   6 ─ 16   6 ─ 17  
#>  [73] 6 ─ 18   6 ─ 19   6 ─ 20   7 ─ 8    7 ─ 10   7 ─ 11   7 ─ 12   7 ─ 13  
#> + ... omitted several edges
```
