# Find mutual edges in a directed graph

This function checks the reciprocal pair of the supplied edges.

## Usage

``` r
which_mutual(graph, eids = E(graph), loops = TRUE)
```

## Arguments

- graph:

  The input graph.

- eids:

  Edge sequence, the edges that will be probed. By default is includes
  all edges in the order of their ids.

- loops:

  Logical, whether to consider directed self-loops to be mutual.

## Value

A logical vector of the same length as the number of edges supplied.

## Details

In a directed graph an (A,B) edge is mutual if the graph also includes a
(B,A) directed edge.

Note that multi-graphs are not handled properly, i.e. if the graph
contains two copies of (A,B) and one copy of (B,A), then these three
edges are considered to be mutual.

Undirected graphs contain only mutual edges by definition.

## Related documentation in the C library

[`is_mutual()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_mutual),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`dyad_census()`](https://r.igraph.org/reference/dyad_census.md) if you
just want some statistics about mutual edges.

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
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_gnm(10, 50, directed = TRUE)
reciprocity(g)
#> [1] 0.56
dyad_census(g)
#> $mut
#> [1] 14
#> 
#> $asym
#> [1] 22
#> 
#> $null
#> [1] 9
#> 
which_mutual(g)
#>  [1] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE
#> [13] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE
#> [25]  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
#> [37]  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
#> [49] FALSE  TRUE
sum(which_mutual(g)) / 2 == dyad_census(g)$mut
#> [1] TRUE
```
