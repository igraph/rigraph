# Finding a feedback vertex set in a graph

**\[experimental\]**

A feedback vertex set of a graph is a subset of vertices whose removal
breaks all cycles in the graph. Finding a *minimum* feedback vertex set
is an NP-complete problem, both on directed and undirected graphs.

## Usage

``` r
feedback_vertex_set(graph, weights = NULL, algo = c("exact_ip"))
```

## Arguments

- graph:

  The input graph

- weights:

  Potential vertex weights. If the graph has a vertex attribute called
  ‘`weight`’, and this argument is `NULL`, then the vertex attribute is
  used automatically. The goal of the feedback vertex set problem is to
  find a feedback vertex set with the smallest total weight.

- algo:

  Specifies the algorithm to use. Currently, “`exact_ip`”, which solves
  the feedback vertex set problem with an exact integer programming
  approach, is the only option.

## Value

A vertex sequence (by default, but see the `return.vs.es` option of
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md))
containing the feedback vertex set.

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`edge_density()`](https://r.igraph.org/reference/edge_density.md),
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
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

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

## Related documentation in the C library

[`feedback_vertex_set()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_feedback_vertex_set).

## Examples

``` r
g <- make_lattice(c(3,3))
feedback_vertex_set(g)
#> + 2/9 vertices, from 55485b8:
#> [1] 2 8
```
