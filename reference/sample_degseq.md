# Generate random graphs with a given degree sequence

It is often useful to create a graph with given vertex degrees. This
function creates such a graph in a randomized manner.

## Usage

``` r
sample_degseq(
  out.deg,
  in.deg = NULL,
  method = c("configuration", "vl", "fast.heur.simple", "configuration.simple",
    "edge.switching.simple")
)

degseq(..., deterministic = FALSE)
```

## Arguments

- out.deg:

  Numeric vector, the sequence of degrees (for undirected graphs) or
  out-degrees (for directed graphs). For undirected graphs its sum
  should be even. For directed graphs its sum should be the same as the
  sum of `in.deg`.

- in.deg:

  For directed graph, the in-degree sequence. By default this is `NULL`
  and an undirected graph is created.

- method:

  Character, the method for generating the graph. See Details.

- ...:

  Passed to
  [`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
  if ‘deterministic’ is true, or to `sample_degseq()` otherwise.

- deterministic:

  Whether the construction should be deterministic

## Value

The new graph object.

## Details

The “configuration” method (formerly called "simple") implements the
configuration model. For undirected graphs, it puts all vertex IDs in a
bag such that the multiplicity of a vertex in the bag is the same as its
degree. Then it draws pairs from the bag until the bag becomes empty.
This method may generate both loop (self) edges and multiple edges. For
directed graphs, the algorithm is basically the same, but two separate
bags are used for the in- and out-degrees. Undirected graphs are
generated with probability proportional to \\(\prod\_{i\<j} A\_{ij} !
\prod_i A\_{ii} !!)^{-1}\\, where A denotes the adjacency matrix and !!
denotes the double factorial. Here A is assumed to have twice the number
of self-loops on its diagonal. The corresponding expression for directed
graphs is \\(\prod\_{i,j} A\_{ij}!)^{-1}\\. Thus the probability of all
simple graphs (which only have 0s and 1s in the adjacency matrix) is the
same, while that of non-simple ones depends on their edge and self-loop
multiplicities.

The “fast.heur.simple” method (formerly called "simple.no.multiple")
generates simple graphs. It is similar to “configuration” but tries to
avoid multiple and loop edges and restarts the generation from scratch
if it gets stuck. It can generate all simple realizations of a degree
sequence, but it is not guaranteed to sample them uniformly. This method
is relatively fast and it will eventually succeed if the provided degree
sequence is graphical, but there is no upper bound on the number of
iterations.

The “configuration.simple” method (formerly called
"simple.no.multiple.uniform") is identical to “configuration”, but if
the generated graph is not simple, it rejects it and re-starts the
generation. It generates all simple graphs with the same probability.

The “vl” method samples undirected connected graphs approximately
uniformly. It is a Monte Carlo method based on degree-preserving edge
switches. This generator should be favoured if undirected and connected
graphs are to be generated and execution time is not a concern. igraph
uses the original implementation of Fabien Viger; for the algorithm, see
<https://www-complexnetworks.lip6.fr/~latapy/FV/generation.html> and the
paper <https://arxiv.org/abs/cs/0502085>.

The “edge.switching.simple” is an MCMC sampler based on
degree-preserving edge switches. It generates simple undirected or
directed graphs.

## See also

[`simplify()`](https://r.igraph.org/reference/simplify.md) to get rid of
the multiple and/or loops edges,
[`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
for a deterministic variant.

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md),
[`sample_chung_lu()`](https://r.igraph.org/reference/sample_chung_lu.md),
[`sample_correlated_gnp()`](https://r.igraph.org/reference/sample_correlated_gnp.md),
[`sample_correlated_gnp_pair()`](https://r.igraph.org/reference/sample_correlated_gnp_pair.md),
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

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## The simple generator
undirected_graph <- sample_degseq(rep(2, 100))
degree(undirected_graph)
#>   [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [38] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
is_simple(undirected_graph) # sometimes TRUE, but can be FALSE
#> [1] TRUE


directed_graph <- sample_degseq(1:10, 10:1)
degree(directed_graph, mode = "out")
#>  [1]  1  2  3  4  5  6  7  8  9 10
degree(directed_graph, mode = "in")
#>  [1] 10  9  8  7  6  5  4  3  2  1

## The vl generator
vl_graph <- sample_degseq(rep(2, 100), method = "vl")
degree(vl_graph)
#>   [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [38] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
is_simple(vl_graph) # always TRUE
#> [1] TRUE

## Exponential degree distribution
## We fix the seed as there's no guarantee
##  that randomly picked integers will form a graphical degree sequence
## (i.e. that there's a graph with these degrees)
## withr::with_seed(42, {
## exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
## })
exponential_degrees <- c(
  5L, 6L, 1L, 4L, 3L, 2L, 3L, 1L, 3L, 3L, 2L, 3L, 6L, 1L, 2L,
  6L, 8L, 1L, 2L, 2L, 5L, 1L, 10L, 6L, 1L, 2L, 1L, 5L, 2L, 4L,
  3L, 4L, 1L, 3L, 1L, 4L, 1L, 1L, 5L, 2L, 1L, 2L, 1L, 8L, 2L, 7L,
  5L, 3L, 8L, 2L, 1L, 1L, 2L, 4L, 1L, 3L, 3L, 1L, 1L, 2L, 3L, 9L,
  3L, 2L, 4L, 1L, 1L, 4L, 3L, 1L, 1L, 1L, 1L, 2L, 1L, 3L, 1L, 1L,
  2L, 1L, 2L, 1L, 1L, 3L, 3L, 2L, 1L, 1L, 1L, 1L, 3L, 1L, 1L, 6L,
  6L, 3L, 1L, 2L, 3L, 2L
)
## Note, that we'd have to correct the degree sequence if its sum is odd
is_exponential_degrees_sum_odd <- (sum(exponential_degrees) %% 2 != 0)
if (is_exponential_degrees_sum_odd) {
  exponential_degrees[1] <- exponential_degrees[1] + 1
}
exp_vl_graph <- sample_degseq(exponential_degrees, method = "vl")
all(degree(exp_vl_graph) == exponential_degrees)
#> [1] TRUE

## An example that does not work
if (FALSE) { # rlang::is_interactive()
## withr::with_seed(11, {
## exponential_degrees <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
## })
exponential_degrees <- c(
  1L, 1L, 2L, 1L, 1L, 7L, 1L, 1L, 5L, 1L, 1L, 2L, 5L, 4L, 3L,
  2L, 2L, 1L, 1L, 2L, 1L, 3L, 1L, 1L, 1L, 2L, 2L, 1L, 1L, 2L, 2L,
  1L, 2L, 1L, 4L, 3L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 3L, 1L, 4L, 3L,
  1L, 2L, 4L, 2L, 2L, 2L, 1L, 1L, 2L, 2L, 4L, 1L, 2L, 1L, 3L, 1L,
  2L, 3L, 1L, 1L, 2L, 1L, 2L, 3L, 2L, 2L, 1L, 6L, 2L, 1L, 1L, 1L,
  1L, 1L, 2L, 2L, 1L, 4L, 2L, 1L, 3L, 4L, 1L, 1L, 3L, 1L, 2L, 4L,
  1L, 3L, 1L, 2L, 1L
)
## Note, that we'd have to correct the degree sequence if its sum is odd
is_exponential_degrees_sum_odd <- (sum(exponential_degrees) %% 2 != 0)
if (is_exponential_degrees_sum_odd) {
  exponential_degrees[1] <- exponential_degrees[1] + 1
}
exp_vl_graph <- sample_degseq(exponential_degrees, method = "vl")
}
## Power-law degree distribution
## We fix the seed as there's no guarantee
##  that randomly picked integers will form a graphical degree sequence
## (i.e. that there's a graph with these degrees)
## withr::with_seed(1, {
##  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
## })
powerlaw_degrees <- c(
  1L, 1L, 1L, 6L, 1L, 6L, 10L, 2L, 2L, 1L, 1L, 1L, 2L, 1L, 3L,
  1L, 2L, 43L, 1L, 3L, 9L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 4L, 1L,
  1L, 1L, 1L, 1L, 3L, 2L, 3L, 1L, 2L, 1L, 3L, 2L, 3L, 1L, 1L, 3L,
  1L, 1L, 2L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 1L, 7L, 1L,
  1L, 1L, 2L, 1L, 1L, 3L, 1L, 5L, 1L, 4L, 1L, 1L, 1L, 5L, 4L, 1L,
  3L, 13L, 1L, 2L, 1L, 1L, 2L, 1L, 2L, 1L, 1L, 1L, 1L, 1L, 2L,
  5L, 3L, 3L, 1L, 1L, 3L, 1L
)
## Note, that we correct the degree sequence if its sum is odd
is_exponential_degrees_sum_odd <- (sum(powerlaw_degrees) %% 2 != 0)
if (is_exponential_degrees_sum_odd) {
  powerlaw_degrees[1] <- powerlaw_degrees[1] + 1
}
powerlaw_vl_graph <- sample_degseq(powerlaw_degrees, method = "vl")
all(degree(powerlaw_vl_graph) == powerlaw_degrees)
#> [1] TRUE

## An example that does not work
if (FALSE) { # rlang::is_interactive()
## withr::with_seed(2, {
##  powerlaw_degrees <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
## })
powerlaw_degrees <- c(
  1L, 2L, 1L, 1L, 10L, 10L, 1L, 4L, 1L, 1L, 1L, 1L, 2L, 1L, 1L,
  4L, 21L, 1L, 1L, 1L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 14L, 1L,
  1L, 1L, 3L, 4L, 1L, 2L, 4L, 1L, 2L, 1L, 25L, 1L, 1L, 1L, 10L,
  3L, 19L, 1L, 1L, 3L, 1L, 1L, 2L, 8L, 1L, 3L, 3L, 36L, 2L, 2L,
  3L, 5L, 2L, 1L, 4L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L,
  1L, 4L, 1L, 1L, 1L, 2L, 1L, 1L, 1L, 4L, 18L, 1L, 2L, 1L, 21L,
  1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L
)
## Note, that we correct the degree sequence if its sum is odd
is_exponential_degrees_sum_odd <- (sum(powerlaw_degrees) %% 2 != 0)
if (is_exponential_degrees_sum_odd) {
  powerlaw_degrees[1] <- powerlaw_degrees[1] + 1
}
powerlaw_vl_graph <- sample_degseq(powerlaw_degrees, method = "vl")
all(degree(powerlaw_vl_graph) == powerlaw_degrees)
}
```
