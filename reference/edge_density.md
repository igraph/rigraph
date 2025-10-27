# Graph density

The density of a graph is the ratio of the actual number of edges and
the largest possible number of edges in the graph, assuming that no
multi-edges are present.

## Usage

``` r
edge_density(graph, loops = FALSE)
```

## Arguments

- graph:

  The input graph.

- loops:

  Logical constant, whether loop edges may exist in the graph. This
  affects the calculation of the largest possible number of edges in the
  graph. If this parameter is set to FALSE yet the graph contains
  self-loops, the result will not be meaningful.

## Value

A real constant. This function returns `NaN` (=0.0/0.0) for an empty
graph with zero vertices.

## Details

The concept of density is ill-defined for multigraphs. Note that this
function does not check whether the graph has multi-edges and will
return meaningless results for such graphs.

## References

Wasserman, S., and Faust, K. (1994). Social Network Analysis: Methods
and Applications. Cambridge: Cambridge University Press.

## See also

[`vcount()`](https://r.igraph.org/reference/gorder.md),
[`ecount()`](https://r.igraph.org/reference/gsize.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md) to get rid of
the multiple and/or loop edges.

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
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

[[`density()`](https://rdrr.io/r/stats/density.html)](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_density).

## Examples

``` r
edge_density(make_empty_graph(n = 10)) # empty graphs have density 0
#> [1] 0
edge_density(make_full_graph(n = 10)) # complete graphs have density 1
#> [1] 1
edge_density(sample_gnp(n = 100, p = 0.4)) # density will be close to p
#> [1] 0.3935354

# loop edges
g <- make_graph(c(1, 2, 2, 2, 2, 3)) # graph with a self-loop
edge_density(g, loops = FALSE) # this is wrong!!!
#> [1] 0.5
edge_density(g, loops = TRUE) # this is right!!!
#> [1] 0.3333333
edge_density(simplify(g), loops = FALSE) # this is also right, but different
#> [1] 0.3333333
```
