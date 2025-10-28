# Forest Fire Network Model

This is a growing network model, which resembles of how the forest fire
spreads by igniting trees close by.

## Usage

``` r
sample_forestfire(nodes, fw.prob, bw.factor = 1, ambs = 1, directed = TRUE)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- fw.prob:

  The forward burning probability, see details below.

- bw.factor:

  The backward burning ratio. The backward burning probability is
  calculated as `bw.factor*fw.prob`.

- ambs:

  The number of ambassador vertices.

- directed:

  Logical scalar, whether to create a directed graph.

## Value

A simple graph, possibly directed if the `directed` argument is `TRUE`.

## Details

The forest fire model intends to reproduce the following network
characteristics, observed in real networks:

- Heavy-tailed in-degree distribution.

- Heavy-tailed out-degree distribution.

- Communities.

- Densification power-law. The network is densifying in time, according
  to a power-law rule.

- Shrinking diameter. The diameter of the network decreases in time.

The network is generated in the following way. One vertex is added at a
time. This vertex connects to (cites) `ambs` vertices already present in
the network, chosen uniformly random. Now, for each cited vertex \\v\\
we do the following procedure:

1.  We generate two random number, \\x\\ and \\y\\, that are
    geometrically distributed with means \\p/(1-p)\\ and \\rp(1-rp)\\.
    (\\p\\ is `fw.prob`, \\r\\ is `bw.factor`.) The new vertex cites
    \\x\\ outgoing neighbors and \\y\\ incoming neighbors of \\v\\, from
    those which are not yet cited by the new vertex. If there are less
    than \\x\\ or \\y\\ such vertices available then we cite all of
    them.

2.  The same procedure is applied to all the newly cited vertices.

## Note

The version of the model in the published paper is incorrect in the
sense that it cannot generate the kind of graphs the authors claim. A
corrected version is available from
<https://www.cs.cmu.edu/~jure/pubs/powergrowth-tkdd.pdf>, our
implementation is based on this.

## References

Jure Leskovec, Jon Kleinberg and Christos Faloutsos. Graphs over time:
densification laws, shrinking diameters and possible explanations. *KDD
'05: Proceeding of the eleventh ACM SIGKDD international conference on
Knowledge discovery in data mining*, 177–187, 2005.

## See also

[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md) for the
basic preferential attachment model.

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

[`forest_fire_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_forest_fire_game).

## Examples

``` r
fire <- sample_forestfire(50, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
plot(fire)


g <- sample_forestfire(10000, fw.prob = 0.37, bw.factor = 0.32 / 0.37)
dd1 <- degree_distribution(g, mode = "in")
dd2 <- degree_distribution(g, mode = "out")
# The forest fire model produces graphs with a heavy tail degree distribution.
# Note that some in- or out-degrees are zero which will be excluded from the logarithmic plot.
plot(seq(along.with = dd1) - 1, dd1, log = "xy")
#> Warning: 1 x value <= 0 omitted from logarithmic plot
#> Warning: 479 y values <= 0 omitted from logarithmic plot
points(seq(along.with = dd2) - 1, dd2, col = 2, pch = 2)
```
