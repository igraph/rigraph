# The Watts-Strogatz small-world model

This function generates networks with the small-world property based on
a variant of the Watts-Strogatz model. The network is obtained by first
creating a periodic undirected lattice, then rewiring both endpoints of
each edge with probability `p`, while avoiding the creation of
multi-edges.

## Usage

``` r
sample_smallworld(dim, size, nei, p, loops = FALSE, multiple = FALSE)

smallworld(dim, size, nei, p, loops = FALSE, multiple = FALSE)
```

## Arguments

- dim:

  Integer constant, the dimension of the starting lattice.

- size:

  Integer constant, the size of the lattice along each dimension.

- nei:

  Integer constant, the neighborhood within which the vertices of the
  lattice will be connected.

- p:

  Real constant between zero and one, the rewiring probability.

- loops:

  Logical scalar, whether loops edges are allowed in the generated
  graph.

- multiple:

  Logical scalar, whether multiple edges are allowed int the generated
  graph.

## Value

A graph object.

## Details

Note that this function might create graphs with loops and/or multiple
edges. You can use
[`simplify()`](https://r.igraph.org/reference/simplify.md) to get rid of
these.

This process differs from the original model of Watts and Strogatz (see
reference) in that it rewires **both** endpoints of edges. Thus in the
limit of `p=1`, we obtain a G(n,m) random graph with the same number of
vertices and edges as the original lattice. In comparison, the original
Watts-Strogatz model only rewires a single endpoint of each edge, thus
the network does not become fully random even for `p=1`. For appropriate
choices of `p`, both models exhibit the property of simultaneously
having short path lengths and high clustering.

## Related documentation in the C library

[`watts_strogatz_game`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_watts_strogatz_game)

## References

Duncan J Watts and Steven H Strogatz: Collective dynamics of ‘small
world’ networks, Nature 393, 440-442, 1998.

## See also

[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`rewire()`](https://r.igraph.org/reference/rewire.md)

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
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_smallworld(1, 100, 5, 0.05)
mean_distance(g)
#> [1] 2.76101
transitivity(g, type = "average")
#> [1] 0.5319964
```
