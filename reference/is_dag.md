# Directed acyclic graphs

This function tests whether the given graph is a DAG, a directed acyclic
graph.

## Usage

``` r
is_dag(graph)
```

## Arguments

- graph:

  The input graph. It may be undirected, in which case `FALSE` is
  reported.

## Value

A logical vector of length one.

## Details

`is_dag()` checks whether there is a directed cycle in the graph. If
not, the graph is a DAG.

## Related documentation in the C library

[`is_dag()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_dag)

## See also

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

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
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
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

Tamas Nepusz <ntamas@gmail.com> for the C code, Gabor Csardi
<csardi.gabor@gmail.com> for the R interface.

## Examples

``` r
g <- make_tree(10)
is_dag(g)
#> [1] TRUE
g2 <- g + edge(5, 1)
is_dag(g2)
#> [1] FALSE
```
