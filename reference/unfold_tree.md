# Convert a general graph into a forest

Perform a breadth-first search on a graph and convert it into a tree or
forest by replicating vertices that were found more than once.

## Usage

``` r
unfold_tree(graph, mode = c("all", "out", "in", "total"), roots)
```

## Arguments

- graph:

  The input graph, it can be either directed or undirected.

- mode:

  Character string, defined the types of the paths used for the
  breadth-first search. “out” follows the outgoing, “in” the incoming
  edges, “all” and “total” both of them. This argument is ignored for
  undirected graphs.

- roots:

  A vector giving the vertices from which the breadth-first search is
  performed. Typically it contains one vertex per component.

## Value

A list with two components:

- tree:

  The result, an `igraph` object, a tree or a forest.

- vertex_index:

  A numeric vector, it gives a mapping from the vertices of the new
  graph to the vertices of the old graph.

## Details

A forest is a graph, whose components are trees.

The `roots` vector can be calculated by simply doing a topological sort
in all components of the graph, see the examples below.

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
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_tree(10) %du% make_tree(10)
V(g)$id <- seq_len(vcount(g)) - 1
roots <- sapply(decompose(g), function(x) {
  V(x)$id[topo_sort(x)[1] + 1]
})
tree <- unfold_tree(g, roots = roots)
```
