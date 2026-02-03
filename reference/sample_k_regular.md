# Create a random regular graph

Generate a random graph where each vertex has the same degree.

## Usage

``` r
sample_k_regular(no.of.nodes, k, directed = FALSE, multiple = FALSE)
```

## Arguments

- no.of.nodes:

  Integer scalar, the number of vertices in the generated graph.

- k:

  Integer scalar, the degree of each vertex in the graph, or the
  out-degree and in-degree in a directed graph.

- directed:

  Logical scalar, whether to create a directed graph.

- multiple:

  Logical scalar, whether multiple edges are allowed.

## Value

An igraph graph.

## Details

This game generates a directed or undirected random graph where the
degrees of vertices are equal to a predefined constant k. For undirected
graphs, at least one of k and the number of vertices must be even.

The game simply uses
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
with appropriately constructed degree sequences.

## Related documentation in the C library

[`k_regular_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_k_regular_game)

## See also

[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md) for
a generator with prescribed degree sequence.

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
[`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md),
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md),
[`sample_pa_age()`](https://r.igraph.org/reference/sample_pa_age.md),
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md),
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
## A simple ring
ring <- sample_k_regular(10, 2)
plot(ring)


## k-regular graphs on 10 vertices, with k=1:9
k10 <- lapply(1:9, sample_k_regular, no.of.nodes = 10)

layout(matrix(1:9, nrow = 3, byrow = TRUE))
sapply(k10, plot, vertex.label = NA)

#> [[1]]
#> NULL
#> 
#> [[2]]
#> NULL
#> 
#> [[3]]
#> NULL
#> 
#> [[4]]
#> NULL
#> 
#> [[5]]
#> NULL
#> 
#> [[6]]
#> NULL
#> 
#> [[7]]
#> NULL
#> 
#> [[8]]
#> NULL
#> 
#> [[9]]
#> NULL
#> 
```
