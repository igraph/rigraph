# Reciprocity of graphs

Calculates the reciprocity of a directed graph.

## Usage

``` r
reciprocity(graph, ignore.loops = TRUE, mode = c("default", "ratio"))
```

## Arguments

- graph:

  The graph object.

- ignore.loops:

  Logical constant, whether to ignore loop edges.

- mode:

  See below.

## Value

A numeric scalar between zero and one.

## Details

The measure of reciprocity defines the proportion of mutual connections,
in a directed graph. It is most commonly defined as the probability that
the opposite counterpart of a directed edge is also included in the
graph. Or in adjacency matrix notation: \\1 - \left(\sum\_{i,j}
\|A\_{ij} - A\_{ji}\|\right) / \left(2\sum\_{i,j} A\_{ij}\right)\\. This
measure is calculated if the `mode` argument is `default`.

Prior to igraph version 0.6, another measure was implemented, defined as
the probability of mutual connection between a vertex pair, if we know
that there is a (possibly non-mutual) connection between them. In other
words, (unordered) vertex pairs are classified into three groups: (1)
not-connected, (2) non-reciprocally connected, (3) reciprocally
connected. The result is the size of group (3), divided by the sum of
group sizes (2)+(3). This measure is calculated if `mode` is `ratio`.

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
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Related documentation in the C library

[`reciprocity()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_reciprocity).

## Examples

``` r
g <- sample_gnp(20, 5 / 20, directed = TRUE)
reciprocity(g)
#> [1] 0.2531646
```
