# Finding a feedback arc set in a graph

A feedback arc set of a graph is a subset of edges whose removal breaks
all cycles in the graph.

## Usage

``` r
feedback_arc_set(graph, weights = NULL, algo = c("approx_eades", "exact_ip"))
```

## Arguments

- graph:

  The input graph

- weights:

  Potential edge weights. If the graph has an edge attribute called
  ‘`weight`’, and this argument is `NULL`, then the edge attribute is
  used automatically. The goal of the feedback arc set problem is to
  find a feedback arc set with the smallest total weight.

- algo:

  Specifies the algorithm to use. “`exact_ip`” solves the feedback arc
  set problem with an exact integer programming algorithm that
  guarantees that the total weight of the removed edges is as small as
  possible. “`approx_eades`” uses a fast (linear-time) approximation
  algorithm from Eades, Lin and Smyth. “`exact`” is an alias to
  “`exact_ip`” while “`approx`” is an alias to “`approx_eades`”.

## Value

An edge sequence (by default, but see the `return.vs.es` option of
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md))
containing the feedback arc set.

## Details

Feedback arc sets are typically used in directed graphs. The removal of
a feedback arc set of a directed graph ensures that the remaining graph
is a directed acyclic graph (DAG). For undirected graphs, the removal of
a feedback arc set ensures that the remaining graph is a forest (i.e.
every connected component is a tree).

## References

Peter Eades, Xuemin Lin and W.F.Smyth: A fast and effective heuristic
for the feedback arc set problem. *Information Processing Letters* 47:6,
pp. 319-323, 1993

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

Graph cycles
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

## Related documentation in the C library

[`feedback_arc_set()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_feedback_arc_set).

## Examples

``` r
g <- sample_gnm(20, 40, directed = TRUE)
feedback_arc_set(g)
#> + 5/40 edges from 12afef8:
#> [1]  9-> 8 15-> 9 15->10 16-> 3 16->12
feedback_arc_set(g, algo = "approx_eades")
#> + 5/40 edges from 12afef8:
#> [1]  9-> 8 15-> 9 15->10 16-> 3 16->12
```
