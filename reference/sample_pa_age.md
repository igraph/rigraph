# Generate an evolving random graph with preferential attachment and aging

This function creates a random graph by simulating its evolution. Each
time a new vertex is added it creates a number of links to old vertices
and the probability that an old vertex is cited depends on its in-degree
(preferential attachment) and age.

## Usage

``` r
sample_pa_age(
  n,
  pa.exp,
  aging.exp,
  m = NULL,
  aging.bin = 300,
  out.dist = NULL,
  out.seq = NULL,
  out.pref = FALSE,
  directed = TRUE,
  zero.deg.appeal = 1,
  zero.age.appeal = 0,
  deg.coef = 1,
  age.coef = 1,
  time.window = NULL
)

pa_age(
  n,
  pa.exp,
  aging.exp,
  m = NULL,
  aging.bin = 300,
  out.dist = NULL,
  out.seq = NULL,
  out.pref = FALSE,
  directed = TRUE,
  zero.deg.appeal = 1,
  zero.age.appeal = 0,
  deg.coef = 1,
  age.coef = 1,
  time.window = NULL
)
```

## Arguments

- n:

  The number of vertices in the graph.

- pa.exp:

  The preferential attachment exponent, see the details below.

- aging.exp:

  The exponent of the aging, usually a non-positive number, see details
  below.

- m:

  The number of edges each new vertex creates (except the very first
  vertex). This argument is used only if both the `out.dist` and
  `out.seq` arguments are NULL.

- aging.bin:

  The number of bins to use for measuring the age of vertices, see
  details below.

- out.dist:

  The discrete distribution to generate the number of edges to add in
  each time step if `out.seq` is NULL. See details below.

- out.seq:

  The number of edges to add in each time step, a vector containing as
  many elements as the number of vertices. See details below.

- out.pref:

  Logical constant, whether to include edges not initiated by the vertex
  as a basis of preferential attachment. See details below.

- directed:

  Logical constant, whether to generate a directed graph. See details
  below.

- zero.deg.appeal:

  The degree-dependent part of the ‘attractiveness’ of the vertices with
  no adjacent edges. See also details below.

- zero.age.appeal:

  The age-dependent part of the ‘attrativeness’ of the vertices with age
  zero. It is usually zero, see details below.

- deg.coef:

  The coefficient of the degree-dependent ‘attractiveness’. See details
  below.

- age.coef:

  The coefficient of the age-dependent part of the ‘attractiveness’. See
  details below.

- time.window:

  Integer constant, if NULL only adjacent added in the last
  `time.windows` time steps are counted as a basis of the preferential
  attachment. See also details below.

## Value

A new graph.

## Details

This is a discrete time step model of a growing graph. We start with a
network containing a single vertex (and no edges) in the first time
step. Then in each time step (starting with the second) a new vertex is
added and it initiates a number of edges to the old vertices in the
network. The probability that an old vertex is connected to is
proportional to \$\$P\[i\] \sim (c\cdot k_i^\alpha+a)(d\cdot
l_i^\beta+b)\$\$.

Here \\k_i\\ is the in-degree of vertex \\i\\ in the current time step
and \\l_i\\ is the age of vertex \\i\\. The age is simply defined as the
number of time steps passed since the vertex is added, with the
extension that vertex age is divided to be in `aging.bin` bins.

\\c\\, \\\alpha\\, \\a\\, \\d\\, \\\beta\\ and \\b\\ are parameters and
they can be set via the following arguments: `pa.exp` (\\\alpha\\,
mandatory argument), `aging.exp` (\\\beta\\, mandatory argument),
`zero.deg.appeal` (\\a\\, optional, the default value is 1),
`zero.age.appeal` (\\b\\, optional, the default is 0), `deg.coef`
(\\c\\, optional, the default is 1), and `age.coef` (\\d\\, optional,
the default is 1).

The number of edges initiated in each time step is governed by the `m`,
`out.seq` and `out.pref` parameters. If `out.seq` is given then it is
interpreted as a vector giving the number of edges to be added in each
time step. It should be of length `n` (the number of vertices), and its
first element will be ignored. If `out.seq` is not given (or NULL) and
`out.dist` is given then it will be used as a discrete probability
distribution to generate the number of edges. Its first element gives
the probability that zero edges are added at a time step, the second
element is the probability that one edge is added, etc. (`out.seq`
should contain non-negative numbers, but if they don't sum up to 1, they
will be normalized to sum up to 1. This behavior is similar to the
`prob` argument of the `sample` command.)

By default a directed graph is generated, but it `directed` is set to
`FALSE` then an undirected is created. Even if an undirected graph is
generated \\k_i\\ denotes only the adjacent edges not initiated by the
vertex itself except if `out.pref` is set to `TRUE`.

If the `time.window` argument is given (and not NULL) then \\k_i\\ means
only the adjacent edges added in the previous `time.window` time steps.

This function might generate graphs with multiple edges.

## Related documentation in the C library

[`barabasi_aging_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_barabasi_aging_game),
[`recent_degree_aging_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_recent_degree_aging_game)

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
[`sample_grg()`](https://r.igraph.org/reference/sample_grg.md),
[`sample_growing()`](https://r.igraph.org/reference/sample_growing.md),
[`sample_hierarchical_sbm()`](https://r.igraph.org/reference/sample_hierarchical_sbm.md),
[`sample_islands()`](https://r.igraph.org/reference/sample_islands.md),
[`sample_k_regular()`](https://r.igraph.org/reference/sample_k_regular.md),
[`sample_last_cit()`](https://r.igraph.org/reference/sample_last_cit.md),
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md),
[`sample_pref()`](https://r.igraph.org/reference/sample_pref.md),
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md),
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# The maximum degree for graph with different aging exponents
g1 <- sample_pa_age(10000, pa.exp = 1, aging.exp = 0, aging.bin = 1000)
g2 <- sample_pa_age(10000, pa.exp = 1, aging.exp = -1, aging.bin = 1000)
g3 <- sample_pa_age(10000, pa.exp = 1, aging.exp = -3, aging.bin = 1000)
max(degree(g1))
#> [1] 148
max(degree(g2))
#> [1] 39
max(degree(g3))
#> [1] 11
```
