# Scale-free random graphs, from vertex fitness scores

This function generates a non-growing random graph with expected
power-law degree distributions.

## Usage

``` r
sample_fitness_pl(
  no.of.nodes,
  no.of.edges,
  exponent.out,
  exponent.in = -1,
  loops = FALSE,
  multiple = FALSE,
  finite.size.correction = TRUE
)
```

## Arguments

- no.of.nodes:

  The number of vertices in the generated graph.

- no.of.edges:

  The number of edges in the generated graph.

- exponent.out:

  Numeric scalar, the power law exponent of the degree distribution. For
  directed graphs, this specifies the exponent of the out-degree
  distribution. It must be greater than or equal to 2. If you pass `Inf`
  here, you will get back an Erdős-Rényi random network.

- exponent.in:

  Numeric scalar. If negative, the generated graph will be undirected.
  If greater than or equal to 2, this argument specifies the exponent of
  the in-degree distribution. If non-negative but less than 2, an error
  will be generated.

- loops:

  Logical scalar, whether to allow loop edges in the generated graph.

- multiple:

  Logical scalar, whether to allow multiple edges in the generated
  graph.

- finite.size.correction:

  Logical scalar, whether to use the proposed finite size correction of
  Cho et al., see references below.

## Value

An igraph graph, directed or undirected.

## Details

This game generates a directed or undirected random graph where the
degrees of vertices follow power-law distributions with prescribed
exponents. For directed graphs, the exponents of the in- and out-degree
distributions may be specified separately.

The game simply uses
[`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md)
with appropriately constructed fitness vectors. In particular, the
fitness of vertex \\i\\ is \\i^{-\alpha}\\, where \\\alpha =
1/(\gamma-1)\\ and \\\gamma\\ is the exponent given in the arguments.

To remove correlations between in- and out-degrees in case of directed
graphs, the in-fitness vector will be shuffled after it has been set up
and before
[`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md)
is called.

Note that significant finite size effects may be observed for exponents
smaller than 3 in the original formulation of the game. This function
provides an argument that lets you remove the finite size effects by
assuming that the fitness of vertex \\i\\ is \\(i+i_0-1)^{-\alpha}\\
where \\i_0\\ is a constant chosen appropriately to ensure that the
maximum degree is less than the square root of the number of edges times
the average degree; see the paper of Chung and Lu, and Cho et al for
more details.

## References

Goh K-I, Kahng B, Kim D: Universal behaviour of load distribution in
scale-free networks. *Phys Rev Lett* 87(27):278701, 2001.

Chung F and Lu L: Connected components in a random graph with given
degree sequences. *Annals of Combinatorics* 6, 125-145, 2002.

Cho YS, Kim JS, Park J, Kahng B, Kim D: Percolation transitions in
scale-free networks under the Achlioptas process. *Phys Rev Lett*
103:135702, 2009.

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

## Related documentation in the C library

[`static_power_law_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_static_power_law_game).

## Examples

``` r
g <- sample_fitness_pl(10000, 30000, 2.2, 2.3)
plot(degree_distribution(g, cumulative = TRUE, mode = "out"), log = "xy")
```
