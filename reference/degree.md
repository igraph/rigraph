# Degree and degree distribution of the vertices

The degree of a vertex is its most basic structural property, the number
of its adjacent edges.

## Usage

``` r
degree(
  graph,
  v = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  normalized = FALSE
)

max_degree(
  graph,
  ...,
  v = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = TRUE
)

mean_degree(graph, loops = TRUE)

degree_distribution(graph, cumulative = FALSE, ...)
```

## Arguments

- graph:

  The graph to analyze.

- v:

  The ids of vertices of which the degree will be calculated.

- mode:

  Character string, “out” for out-degree, “in” for in-degree or “total”
  for the sum of the two. For undirected graphs this argument is
  ignored. “all” is a synonym of “total”.

- loops:

  Logical; whether the loop edges are also counted.

- normalized:

  Logical scalar, whether to normalize the degree. If `TRUE` then the
  result is divided by \\n-1\\, where \\n\\ is the number of vertices in
  the graph.

- ...:

  These dots are for future extensions and must be empty.

- cumulative:

  Logical; whether the cumulative degree distribution is to be
  calculated.

## Value

For `degree()` a numeric vector of the same length as argument `v`.

For `degree_distribution()` a numeric vector of the same length as the
maximum degree plus one. The first element is the relative frequency
zero degree vertices, the second vertices with degree one, etc.

For `max_degree()`, the largest degree in the graph. When no vertices
are selected, or when the input is the null graph, zero is returned as
this is the smallest possible degree.

For `mean_degree()`, the average degree in the graph as a single number.
For graphs with no vertices, `NaN` is returned. **\[experimental\]**

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
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

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`maxdegree()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_maxdegree),
[`mean_degree()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_mean_degree).

## Examples

``` r
g <- make_ring(10)
degree(g)
#>  [1] 2 2 2 2 2 2 2 2 2 2
g2 <- sample_gnp(1000, 10 / 1000)
max_degree(g2)
#> [1] 21
mean_degree(g2)
#> [1] 9.906
degree_distribution(g2)
#>  [1] 0.000 0.002 0.003 0.008 0.014 0.038 0.076 0.081 0.114 0.120 0.137 0.119
#> [13] 0.096 0.069 0.047 0.036 0.016 0.013 0.002 0.007 0.001 0.001
```
