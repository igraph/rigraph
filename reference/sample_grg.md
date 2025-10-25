# Geometric random graphs

Generate a random graph based on the distance of random point on a unit
square

## Usage

``` r
sample_grg(nodes, radius, torus = FALSE, coords = FALSE)

grg(...)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- radius:

  The radius within which the vertices will be connected by an edge.

- torus:

  Logical constant, whether to use a torus instead of a square.

- coords:

  Logical scalar, whether to add the positions of the vertices as vertex
  attributes called ‘`x`’ and ‘`y`’.

- ...:

  Passed to `sample_grg()`.

## Value

A graph object. If `coords` is `TRUE` then with vertex attributes ‘`x`’
and ‘`y`’.

## Details

First a number of points are dropped on a unit square, these points
correspond to the vertices of the graph to create. Two points will be
connected with an undirected edge if they are closer to each other in
Euclidean norm than a given radius. If the `torus` argument is `TRUE`
then a unit area torus is used instead of a square.

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

Gabor Csardi <csardi.gabor@gmail.com>, first version was written by
Keith Briggs (<https://keithbriggs.info/>).

## Examples

``` r
g <- sample_grg(1000, 0.05, torus = FALSE)
g2 <- sample_grg(1000, 0.05, torus = TRUE)
```
