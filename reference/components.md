# Connected components of a graph

Calculate the maximal (weakly or strongly) connected components of a
graph

## Usage

``` r
component_distribution(graph, cumulative = FALSE, mul.size = FALSE, ...)

largest_component(graph, mode = c("weak", "strong"))

components(graph, mode = c("weak", "strong"))

is_connected(graph, mode = c("weak", "strong"))

count_components(graph, mode = c("weak", "strong"))
```

## Arguments

- graph:

  The graph to analyze.

- cumulative:

  Logical, if TRUE the cumulative distirubution (relative frequency) is
  calculated.

- mul.size:

  Logical. If TRUE the relative frequencies will be multiplied by the
  cluster sizes.

- ...:

  Additional attributes to pass to `cluster`, right now only `mode`
  makes sense.

- mode:

  Character string, either “weak” or “strong”. For directed graphs
  “weak” implies weakly, “strong” strongly connected components to
  search. It is ignored for undirected graphs.

## Value

For `is_connected()` a logical constant.

For `components()` a named list with three components:

- membership:

  numeric vector giving the cluster id to which each vertex belongs.

- csize:

  numeric vector giving the sizes of the clusters.

- no:

  numeric constant, the number of clusters.

For `count_components()` an integer constant is returned.

For `component_distribution()` a numeric vector with the relative
frequencies. The length of the vector is the size of the largest
component plus one. Note that (for currently unknown reasons) the first
element of the vector is the number of clusters of size zero, so this is
always zero.

For `largest_component()` the largest connected component of the graph.

## Details

`is_connected()` decides whether the graph is weakly or strongly
connected. The null graph is considered disconnected.

`components()` finds the maximal (weakly or strongly) connected
components of a graph.

`count_components()` does almost the same as `components()` but returns
only the number of clusters found instead of returning the actual
clusters.

`component_distribution()` creates a histogram for the maximal connected
component sizes.

`largest_component()` returns the largest connected component of a
graph. For directed graphs, optionally the largest weakly or strongly
connected component. In case of a tie, the first component by vertex ID
order is returned. Vertex IDs from the original graph are not retained
in the returned graph.

The weakly connected components are found by a simple breadth-first
search. The strongly connected components are implemented by two
consecutive depth-first searches.

## See also

[`decompose()`](https://r.igraph.org/reference/decompose.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`groups()`](https://r.igraph.org/reference/groups.md)

Connected components
[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`count_reachable()`](https://r.igraph.org/reference/count_reachable.md),
[`decompose()`](https://r.igraph.org/reference/decompose.md),
[`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
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
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`is_connected()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_connected).

## Examples

``` r
g <- sample_gnp(20, 1 / 20)
clu <- components(g)
groups(clu)
#> $`1`
#>  [1]  1  3  4  5  6  7  8  9 10 12 13 14 18 19
#> 
#> $`2`
#> [1] 2
#> 
#> $`3`
#> [1] 11
#> 
#> $`4`
#> [1] 15
#> 
#> $`5`
#> [1] 16
#> 
#> $`6`
#> [1] 17
#> 
#> $`7`
#> [1] 20
#> 
largest_component(g)
#> IGRAPH 8bbfae4 U--- 14 14 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from 8bbfae4:
#>  [1]  2-- 4  4-- 5  2-- 6  2-- 7  1-- 8  2-- 8  2--10  3--12  7--12  9--12
#> [11] 11--12  9--13 10--13  4--14
```
