# Bipartite random graphs

Generate bipartite graphs using the Erdős-Rényi model

## Usage

``` r
bipartite_gnm(n1, n2, m, ..., directed = FALSE, mode = c("out", "in", "all"))

bipartite_gnp(n1, n2, p, ..., directed = FALSE, mode = c("out", "in", "all"))

sample_bipartite_gnm(
  n1,
  n2,
  m,
  ...,
  directed = FALSE,
  mode = c("out", "in", "all")
)

sample_bipartite_gnp(
  n1,
  n2,
  p,
  ...,
  directed = FALSE,
  mode = c("out", "in", "all")
)
```

## Arguments

- n1:

  Integer scalar, the number of bottom vertices.

- n2:

  Integer scalar, the number of top vertices.

- m:

  Integer scalar, the number of edges for \\G(n,m)\\ graphs.

- ...:

  These dots are for future extensions and must be empty.

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

- p:

  Real scalar, connection probability for \\G(n,p)\\ graphs.

## Details

Similarly to unipartite (one-mode) networks, we can define the
\\G(n,p)\\, and \\G(n,m)\\ graph classes for bipartite graphs, via their
generating process. In \\G(n,p)\\ every possible edge between top and
bottom vertices is realized with probability \\p\\, independently of the
rest of the edges. In \\G(n,m)\\, we uniformly choose \\m\\ edges to
realize.

## See also

Random graph models (games)
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
[`sample_smallworld()`](https://r.igraph.org/reference/sample_smallworld.md),
[`sample_traits_callaway()`](https://r.igraph.org/reference/sample_traits_callaway.md),
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)

## Examples

``` r
## empty graph
sample_bipartite_gnp(10, 5, p = 0)
#> IGRAPH 7075912 U--B 15 0 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from 7075912:

## full graph
sample_bipartite_gnp(10, 5, p = 1)
#> IGRAPH 99d7c4c U--B 15 50 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from 99d7c4c:
#>  [1]  1--11  1--12  1--13  1--14  1--15  2--11  2--12  2--13  2--14  2--15
#> [11]  3--11  3--12  3--13  3--14  3--15  4--11  4--12  4--13  4--14  4--15
#> [21]  5--11  5--12  5--13  5--14  5--15  6--11  6--12  6--13  6--14  6--15
#> [31]  7--11  7--12  7--13  7--14  7--15  8--11  8--12  8--13  8--14  8--15
#> [41]  9--11  9--12  9--13  9--14  9--15 10--11 10--12 10--13 10--14 10--15

## random bipartite graph
sample_bipartite_gnp(10, 5, p = .1)
#> IGRAPH 52690b6 U--B 15 2 -- Bipartite Gnp random graph
#> + attr: name (g/c), p (g/n), type (v/l)
#> + edges from 52690b6:
#> [1] 2--11 6--11

## directed bipartite graph, G(n,m)
sample_bipartite_gnm(10, 5, m = 20, directed = TRUE, mode = "all")
#> IGRAPH b3a6e69 D--B 15 20 -- Bipartite Gnm random graph
#> + attr: name (g/c), m (g/n), type (v/l)
#> + edges from b3a6e69:
#>  [1]  1->11  5->11  8->11 10->12  1->13  8->14  5->15  7->15 12-> 1 13-> 1
#> [11] 14-> 3 15-> 3 11-> 4 13-> 4 11-> 5 13-> 5 14-> 6 15-> 7 13-> 8 12->10
```
