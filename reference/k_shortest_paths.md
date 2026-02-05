# Find the \\k\\ shortest paths between two vertices

Finds the \\k\\ shortest paths between the given source and target
vertex in order of increasing length. Currently this function uses Yen's
algorithm.

## Usage

``` r
k_shortest_paths(
  graph,
  from,
  to,
  k,
  ...,
  weights = NULL,
  mode = c("out", "in", "all", "total")
)
```

## Arguments

- graph:

  The input graph.

- from:

  The source vertex of the shortest paths.

- to:

  The target vertex of the shortest paths.

- k:

  The number of paths to find. They will be returned in order of
  increasing length.

- ...:

  These dots are for future extensions and must be empty.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the graph is treated as
  undirected, i.e. edge directions are not taken into account. This
  argument is ignored for undirected graphs.

## Value

A named list with two components is returned:

- vpaths:

  The list of \\k\\ shortest paths in terms of vertices

- epaths:

  The list of \\k\\ shortest paths in terms of edges

## Related documentation in the C library

[`get_k_shortest_paths()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_k_shortest_paths),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Yen, Jin Y.: An algorithm for finding shortest routes from all source
nodes to a given destination in general networks. Quarterly of Applied
Mathematics. 27 (4): 526–530. (1970)
[doi:10.1090/qam/253822](https://doi.org/10.1090/qam/253822)

## See also

[`shortest_paths()`](https://r.igraph.org/reference/distances.md),
[`all_shortest_paths()`](https://r.igraph.org/reference/distances.md)

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
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)
