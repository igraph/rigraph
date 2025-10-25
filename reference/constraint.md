# Burt's constraint

Given a graph, `constraint()` calculates Burt's constraint for each
vertex.

## Usage

``` r
constraint(graph, nodes = V(graph), weights = NULL)
```

## Arguments

- graph:

  A graph object, the input graph.

- nodes:

  The vertices for which the constraint will be calculated. Defaults to
  all vertices.

- weights:

  The weights of the edges. If this is `NULL` and there is a `weight`
  edge attribute this is used. If there is no such edge attribute all
  edges will have the same weight.

## Value

A numeric vector of constraint scores

## Details

Burt's constraint is higher if ego has less, or mutually stronger
related (i.e. more redundant) contacts. Burt's measure of constraint,
\\C_i\\, of vertex \\i\\'s ego network \\V_i\\, is defined for directed
and valued graphs, \$\$C_i=\sum\_{j \in V_i \setminus \\i\\}
(p\_{ij}+\sum\_{q \in V_i \setminus \\i,j\\} p\_{iq} p\_{qj})^2\$\$ for
a graph of order (i.e. number of vertices) \\N\\, where proportional tie
strengths are defined as \$\$p\_{ij} = \frac{a\_{ij}+a\_{ji}}{\sum\_{k
\in V_i \setminus \\i\\}(a\_{ik}+a\_{ki})},\$\$ \\a\_{ij}\\ are elements
of \\A\\ and the latter being the graph adjacency matrix. For isolated
vertices, constraint is undefined.

## References

Burt, R.S. (2004). Structural holes and good ideas. *American Journal of
Sociology* 110, 349-399.

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`edge_density()`](https://r.igraph.org/reference/edge_density.md),
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Jeroen Bruggeman
(<https://sites.google.com/site/jebrug/jeroen-bruggeman-social-science>)
and Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnp(20, 5 / 20)
constraint(g)
#>  [1] 0.5000000 0.1979167 0.4291649 0.3120890 0.2500000 0.2500000 0.3333333
#>  [8] 0.2914583 0.2244898 0.4291649 0.2882653 0.2323039 0.2396685 0.1896287
#> [15] 0.3017578 0.2273709 0.1979167 0.2500000 0.3017578 0.2021243
```
