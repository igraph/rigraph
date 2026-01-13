# In- or out- component of a vertex

Finds all vertices reachable from a given vertex, or the opposite: all
vertices from which a given vertex is reachable via a directed path.

## Usage

``` r
subcomponent(graph, v, mode = c("all", "out", "in"))
```

## Arguments

- graph:

  The graph to analyze.

- v:

  The vertex to start the search from.

- mode:

  Character string, either “in”, “out” or “all”. If “in” all vertices
  from which `v` is reachable are listed. If “out” all vertices
  reachable from `v` are returned. If “all” returns the union of these.
  It is ignored for undirected graphs.

## Value

Numeric vector, the ids of the vertices in the same component as `v`.

## Details

A breadth-first search is conducted starting from vertex `v`.

## See also

[`components()`](https://r.igraph.org/reference/components.md)

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
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnp(100, 1 / 200)
subcomponent(g, 1, "in")
#> + 1/100 vertex, from b6695d5:
#> [1] 1
subcomponent(g, 1, "out")
#> + 1/100 vertex, from b6695d5:
#> [1] 1
subcomponent(g, 1, "all")
#> + 1/100 vertex, from b6695d5:
#> [1] 1
```
