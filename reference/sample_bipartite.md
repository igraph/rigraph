# Bipartite random graphs

**\[deprecated\]** Generate bipartite graphs using the Erdős-Rényi
model. Use
[`sample_bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
and
[`sample_bipartite_gnp()`](https://r.igraph.org/reference/sample_bipartite_gnm.md)
instead.

## Usage

``` r
sample_bipartite(
  n1,
  n2,
  type = c("gnp", "gnm"),
  p,
  m,
  directed = FALSE,
  mode = c("out", "in", "all")
)

bipartite(..., type = NULL)
```

## Arguments

- n1:

  Integer scalar, the number of bottom vertices.

- n2:

  Integer scalar, the number of top vertices.

- type:

  Character scalar, the type of the graph, ‘gnp’ creates a \\G(n,p)\\
  graph, ‘gnm’ creates a \\G(n,m)\\ graph. See details below.

- p:

  Real scalar, connection probability for \\G(n,p)\\ graphs. Should not
  be given for \\G(n,m)\\ graphs.

- m:

  Integer scalar, the number of edges for \\G(n,m)\\ graphs. Should not
  be given for \\G(n,p)\\ graphs.

- directed:

  Logical scalar, whether to create a directed graph. See also the
  `mode` argument.

- mode:

  Character scalar, specifies how to direct the edges in directed
  graphs. If it is ‘out’, then directed edges point from bottom vertices
  to top vertices. If it is ‘in’, edges point from top vertices to
  bottom vertices. ‘out’ and ‘in’ do not generate mutual edges. If this
  argument is ‘all’, then each edge direction is considered
  independently and mutual edges might be generated. This argument is
  ignored for undirected graphs.

- ...:

  Passed to `sample_bipartite()`.

## Value

A bipartite igraph graph.

## See also

Random graph models (games)
[`bipartite_gnm()`](https://r.igraph.org/reference/sample_bipartite_gnm.md),
[`erdos.renyi.game()`](https://r.igraph.org/reference/erdos.renyi.game.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
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
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## empty graph
sample_bipartite(10, 5, p = 0)
#> Warning: `sample_bipartite()` was deprecated in igraph 2.2.0.
#> ℹ Please use `sample_bipartite_gnp()` instead.
#> IGRAPH 38c05b4 U--B 15 0 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from 38c05b4:

## full graph
sample_bipartite(10, 5, p = 1)
#> IGRAPH 53b3fcc U--B 15 50 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from 53b3fcc:
#>  [1]  1--11  1--12  1--13  1--14  1--15  2--11  2--12  2--13  2--14  2--15
#> [11]  3--11  3--12  3--13  3--14  3--15  4--11  4--12  4--13  4--14  4--15
#> [21]  5--11  5--12  5--13  5--14  5--15  6--11  6--12  6--13  6--14  6--15
#> [31]  7--11  7--12  7--13  7--14  7--15  8--11  8--12  8--13  8--14  8--15
#> [41]  9--11  9--12  9--13  9--14  9--15 10--11 10--12 10--13 10--14 10--15

## random bipartite graph
sample_bipartite(10, 5, p = .1)
#> IGRAPH d9ee264 U--B 15 8 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from d9ee264:
#> [1] 4--12 5--12 1--13 2--13 7--13 2--14 3--14 5--15

## directed bipartite graph, G(n,m)
sample_bipartite(10, 5, type = "Gnm", m = 20, directed = TRUE, mode = "all")
#> Warning: `sample_bipartite()` was deprecated in igraph 2.2.0.
#> ℹ Please use `sample_bipartite_gnm()` instead.
#> IGRAPH 7f2c7d0 D--B 15 20 -- Bipartite Gnm random graph
#> + attr: name (g/c), m (g/n), type (v/l)
#> + edges from 7f2c7d0:
#>  [1]  1->11  3->11  5->11  6->11  1->13  4->13  7->13  8->13  4->14  3->15
#> [11]  4->15 10->15 12-> 1 13-> 3 11-> 4 12-> 6 13-> 6 14-> 6 15-> 8 14->10
```
