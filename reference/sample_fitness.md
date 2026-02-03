# Random graphs from vertex fitness scores

This function generates a non-growing random graph with edge
probabilities proportional to node fitness scores.

## Usage

``` r
sample_fitness(
  no.of.edges,
  fitness.out,
  fitness.in = NULL,
  loops = FALSE,
  multiple = FALSE
)
```

## Arguments

- no.of.edges:

  The number of edges in the generated graph.

- fitness.out:

  A numeric vector containing the fitness of each vertex. For directed
  graphs, this specifies the out-fitness of each vertex.

- fitness.in:

  If `NULL` (the default), the generated graph will be undirected. If
  not `NULL`, then it should be a numeric vector and it specifies the
  in-fitness of each vertex.

  If this argument is not `NULL`, then a directed graph is generated,
  otherwise an undirected one.

- loops:

  Logical scalar, whether to allow loop edges in the graph.

- multiple:

  Logical scalar, whether to allow multiple edges in the graph.

## Value

An igraph graph, directed or undirected.

## Details

This game generates a directed or undirected random graph where the
probability of an edge between vertices \\i\\ and \\j\\ depends on the
fitness scores of the two vertices involved. For undirected graphs, each
vertex has a single fitness score. For directed graphs, each vertex has
an out- and an in-fitness, and the probability of an edge from \\i\\ to
\\j\\ depends on the out-fitness of vertex \\i\\ and the in-fitness of
vertex \\j\\.

The generation process goes as follows. We start from \\N\\ disconnected
nodes (where \\N\\ is given by the length of the fitness vector). Then
we randomly select two vertices \\i\\ and \\j\\, with probabilities
proportional to their fitnesses. (When the generated graph is directed,
\\i\\ is selected according to the out-fitnesses and \\j\\ is selected
according to the in-fitnesses). If the vertices are not connected yet
(or if multiple edges are allowed), we connect them; otherwise we select
a new pair. This is repeated until the desired number of links are
created.

It can be shown that the *expected* degree of each vertex will be
proportional to its fitness, although the actual, observed degree will
not be. If you need to generate a graph with an exact degree sequence,
consider
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
instead.

This model is commonly used to generate static scale-free networks. To
achieve this, you have to draw the fitness scores from the desired
power-law distribution. Alternatively, you may use
[`sample_fitness_pl()`](https://r.igraph.org/reference/sample_fitness_pl.md)
which generates the fitnesses for you with a given exponent.

## Related documentation in the C library

[`static_fitness_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_static_fitness_game)

## References

Goh K-I, Kahng B, Kim D: Universal behaviour of load distribution in
scale-free networks. *Phys Rev Lett* 87(27):278701, 2001.

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

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
N <- 10000
g <- sample_fitness(5 * N, sample((1:50)^-2, N, replace = TRUE))
degree_distribution(g)
#>   [1] 0.4818 0.2028 0.0742 0.0434 0.0251 0.0173 0.0114 0.0094 0.0087 0.0084
#>  [11] 0.0063 0.0061 0.0045 0.0033 0.0028 0.0036 0.0033 0.0034 0.0026 0.0015
#>  [21] 0.0018 0.0015 0.0022 0.0024 0.0019 0.0021 0.0018 0.0008 0.0010 0.0013
#>  [31] 0.0009 0.0013 0.0009 0.0008 0.0008 0.0008 0.0017 0.0017 0.0011 0.0012
#>  [41] 0.0015 0.0016 0.0010 0.0010 0.0012 0.0005 0.0004 0.0005 0.0005 0.0005
#>  [51] 0.0004 0.0001 0.0002 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0001
#>  [61] 0.0000 0.0000 0.0000 0.0001 0.0001 0.0000 0.0000 0.0001 0.0004 0.0000
#>  [71] 0.0001 0.0006 0.0002 0.0004 0.0005 0.0009 0.0006 0.0008 0.0014 0.0009
#>  [81] 0.0011 0.0011 0.0012 0.0009 0.0007 0.0011 0.0015 0.0013 0.0004 0.0008
#>  [91] 0.0002 0.0009 0.0005 0.0003 0.0006 0.0003 0.0002 0.0001 0.0004 0.0001
#> [101] 0.0000 0.0001 0.0001 0.0002 0.0000 0.0001 0.0000 0.0001 0.0000 0.0000
#> [111] 0.0000 0.0000 0.0000 0.0001 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [121] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [131] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [141] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [151] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [161] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [171] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [181] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [191] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [201] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [211] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [221] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000 0.0000
#> [231] 0.0000 0.0000 0.0000 0.0000 0.0000 0.0001 0.0000 0.0001 0.0003 0.0001
#> [241] 0.0000 0.0001 0.0001 0.0002 0.0001 0.0004 0.0001 0.0003 0.0003 0.0002
#> [251] 0.0003 0.0003 0.0008 0.0005 0.0005 0.0005 0.0009 0.0010 0.0004 0.0005
#> [261] 0.0010 0.0005 0.0006 0.0005 0.0003 0.0007 0.0009 0.0004 0.0005 0.0008
#> [271] 0.0006 0.0001 0.0010 0.0009 0.0004 0.0003 0.0001 0.0004 0.0006 0.0001
#> [281] 0.0003 0.0003 0.0001 0.0003 0.0001 0.0002 0.0002 0.0002 0.0001 0.0001
#> [291] 0.0000 0.0000 0.0001 0.0001 0.0000 0.0001
plot(degree_distribution(g, cumulative = TRUE), log = "xy")
```
