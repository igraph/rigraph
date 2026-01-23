# Random graph with given expected degrees

**\[experimental\]**

The Chung-Lu model is useful for generating random graphs with fixed
expected degrees. This function implements both the original model of
Chung and Lu, as well as some additional variants with useful
properties.

## Usage

``` r
sample_chung_lu(
  out.weights,
  in.weights = NULL,
  ...,
  loops = TRUE,
  variant = c("original", "maxent", "nr")
)

chung_lu(
  out.weights,
  in.weights = NULL,
  ...,
  loops = TRUE,
  variant = c("original", "maxent", "nr")
)
```

## Arguments

- out.weights:

  A vector of non-negative vertex weights (or out-weights). In sparse
  graphs, these will be approximately equal to the expected
  (out-)degrees.

- in.weights:

  A vector of non-negative in-weights, approximately equal to the
  expected in-degrees in sparse graphs. May be set to `NULL`, in which
  case undirected graphs are generated.

- ...:

  These dots are for future extensions and must be empty.

- loops:

  Logical, whether to allow the creation of self-loops. Since vertex
  pairs are connected independently, setting this to `FALSE` is
  equivalent to simply discarding self-loops from an existing loopy
  Chung-Lu graph.

- variant:

  The model variant to sample from, with different definitions of the
  connection probability between vertices \\i\\ and \\j\\. Given
  \\q\_{ij} = \frac{w_i w_j}{S}\\, the following formulations are
  available:

  “original”

  :   the original Chung-Lu model, \\p\_{ij} = \min(q\_{ij}, 1)\\.

  “maxent”

  :   maximum entropy model with fixed expected degrees, \\p\_{ij} =
      \frac{q\_{ij}}{1 + q\_{ij}}\\.

  “nr”

  :   Norros and Reittu's model, \\p\_{ij} = 1 - \exp(-q\_{ij})\\.

## Value

An igraph graph.

## Details

In the original Chung-Lu model, each pair of vertices \\i\\ and \\j\\ is
connected with independent probability \$\$p\_{ij} = \frac{w_i
w_j}{S},\$\$ where \\w_i\\ is a weight associated with vertex \\i\\ and
\$\$S = \sum_k w_k\$\$ is the sum of weights. In the directed variant,
vertices have both out-weights, \\w^\text{out}\\, and in-weights,
\\w^\text{in}\\, with equal sums, \$\$S = \sum_k w^\text{out}\_k =
\sum_k w^\text{in}\_k.\$\$ The connection probability between \\i\\ and
\\j\\ is \$\$p\_{ij} = \frac{w^\text{out}\_i w^\text{in}\_j.}{S}\$\$

This model is commonly used to create random graphs with a fixed
*expected* degree sequence. The expected degree of vertex \\i\\ is
approximately equal to the weight \\w_i\\. Specifically, if the graph is
directed and self-loops are allowed, then the expected out- and
in-degrees are precisely \\w^\text{out}\\ and \\w^\text{in}\\. If
self-loops are disallowed, then the expected out- and in-degrees are
\\\frac{w^\text{out} (S - w^\text{in})}{S}\\ and \\\frac{w^\text{in}
(S - w^\text{out})}{S}\\, respectively. If the graph is undirected, then
the expected degrees with and without self-loops are \\\frac{w (S +
w)}{S}\\ and \\\frac{w (S - w)}{S}\\, respectively.

A limitation of the original Chung-Lu model is that when some of the
weights are large, the formula for \\p\_{ij}\\ yields values larger
than 1. Chung and Lu's original paper excludes the use of such weights.
When \\p\_{ij} \> 1\\, this function simply issues a warning and creates
a connection between \\i\\ and \\j\\. However, in this case the expected
degrees will no longer relate to the weights in the manner stated above.
Thus, the original Chung-Lu model cannot produce certain (large)
expected degrees.

To overcome this limitation, this function implements additional
variants of the model, with modified expressions for the connection
probability \\p\_{ij}\\ between vertices \\i\\ and \\j\\. Let \\q\_{ij}
= \frac{w_i w_j}{S}\\, or \\q\_{ij} = \frac{w^\text{out}\_i
w^\text{in}\_j}{S}\\ in the directed case. All model variants become
equivalent in the limit of sparse graphs where \\q\_{ij}\\ approaches
zero. In the original Chung-Lu model, selectable by setting `variant` to
“original”, \\p\_{ij} = \min(q\_{ij}, 1)\\. The “maxent” variant,
sometimes referred to as the generalized random graph, uses \\p\_{ij} =
\frac{q\_{ij}}{1 + q\_{ij}}\\, and is equivalent to a maximum entropy
model (i.e., exponential random graph model) with a constraint on
expected degrees; see Park and Newman (2004), Section B, setting
\\\exp(-\Theta\_{ij}) = \frac{w_i w_j}{S}\\. This model is also
discussed by Britton, Deijfen, and Martin-Löf (2006). By virtue of being
a degree-constrained maximum entropy model, it generates graphs with the
same degree sequence with the same probability. A third variant can be
requested with “nr”, and uses \\p\_{ij} = 1 - \exp(-q\_{ij})\\. This is
the underlying simple graph of a multigraph model introduced by Norros
and Reittu (2006). For a discussion of these three model variants, see
Section 16.4 of Bollobás, Janson, Riordan (2007), as well as Van Der
Hofstad (2013).

## References

Chung, F., and Lu, L. (2002). Connected components in a random graph
with given degree sequences. Annals of Combinatorics, 6, 125-145.
[doi:10.1007/PL00012580](https://doi.org/10.1007/PL00012580)

Miller, J. C., and Hagberg, A. (2011). Efficient Generation of Networks
with Given Expected Degrees.
[doi:10.1007/978-3-642-21286-4_10](https://doi.org/10.1007/978-3-642-21286-4_10)

Park, J., and Newman, M. E. J. (2004). Statistical mechanics of
networks. Physical Review E, 70, 066117.
[doi:10.1103/PhysRevE.70.066117](https://doi.org/10.1103/PhysRevE.70.066117)

Britton, T., Deijfen, M., and Martin-Löf, A. (2006). Generating Simple
Random Graphs with Prescribed Degree Distribution. Journal of
Statistical Physics, 124, 1377-1397.
[doi:10.1007/s10955-006-9168-x](https://doi.org/10.1007/s10955-006-9168-x)

Norros, I., and Reittu, H. (2006). On a conditionally Poissonian graph
process. Advances in Applied Probability, 38, 59-75.
[doi:10.1239/aap/1143936140](https://doi.org/10.1239/aap/1143936140)

Bollobás, B., Janson, S., and Riordan, O. (2007). The phase transition
in inhomogeneous random graphs. Random Structures & Algorithms, 31,
3-122. [doi:10.1002/rsa.20168](https://doi.org/10.1002/rsa.20168)

Van Der Hofstad, R. (2013). Critical behavior in inhomogeneous random
graphs. Random Structures & Algorithms, 42, 480-508.
[doi:10.1002/rsa.20450](https://doi.org/10.1002/rsa.20450)

## See also

[`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md)
implements a similar model with a sharp constraint on the number of
edges.
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)
samples random graphs with sharply specified degrees.
[`sample_gnp()`](https://r.igraph.org/reference/sample_gnp.md) creates
random graphs with a fixed connection probability \\p\\ between all
vertex pairs.

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
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
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Related documentation in the C library

[`chung_lu_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_chung_lu_game).

## Examples

``` r
g <- sample_chung_lu(c(3, 3, 2, 2, 2, 1, 1))

rowMeans(replicate(
  100,
  degree(sample_chung_lu(c(1, 3, 2, 1), c(2, 1, 2, 2)), mode = "out")
))
#> [1] 1.18 3.08 1.98 1.04

rowMeans(replicate(
  100,
  degree(sample_chung_lu(c(1, 3, 2, 1), c(2, 1, 2, 2), variant = "maxent"), mode = "out")
))
#> [1] 0.75 1.71 1.14 0.74
```
