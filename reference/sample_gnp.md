# Generate random graphs according to the \\G(n,p)\\ Erdős-Rényi model

Every possible edge is created independently with the same probability
`p`. This model is also referred to as a Bernoulli random graph since
the connectivity status of vertex pairs follows a Bernoulli
distribution.

## Usage

``` r
sample_gnp(n, p, directed = FALSE, loops = FALSE)

gnp(...)
```

## Arguments

- n:

  The number of vertices in the graph.

- p:

  The probability for drawing an edge between two arbitrary vertices
  (\\G(n,p)\\ graph).

- directed:

  Logical, whether the graph will be directed, defaults to `FALSE`.

- loops:

  Logical, whether to add loop edges, defaults to `FALSE`.

- ...:

  Passed to `sample_gnp()`.

## Value

A graph object.

## Details

The graph has `n` vertices and each pair of vertices is connected with
the same probability `p`. The `loops` parameter controls whether
self-connections are also considered. This model effectively constrains
the average number of edges, \\p m\_\text{max}\\, where
\\m\_\text{max}\\ is the largest possible number of edges, which depends
on whether the graph is directed or undirected and whether self-loops
are allowed.

## References

Erdős, P. and Rényi, A., On random graphs, *Publicationes Mathematicae*
6, 290–297 (1959).

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
# Random graph with expected mean degree of 2
g <- sample_gnp(1000, 2 / 1000)
mean(degree(g))
#> [1] 2.056
degree_distribution(g)
#>  [1] 0.119 0.274 0.279 0.173 0.099 0.037 0.013 0.004 0.000 0.002

# Pick a simple graph on 6 vertices uniformly at random
plot(sample_gnp(6, 0.5))
```
