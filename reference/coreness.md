# K-core decomposition of graphs

The k-core of graph is a maximal subgraph in which each vertex has at
least degree k. The coreness of a vertex is k if it belongs to the
k-core but not to the (k+1)-core.

## Usage

``` r
coreness(graph, mode = c("all", "out", "in"))
```

## Arguments

- graph:

  The input graph, it can be directed or undirected

- mode:

  The type of the core in directed graphs. Character constant, possible
  values: `in`: in-cores are computed, `out`: out-cores are computed,
  `all`: the corresponding undirected graph is considered. This argument
  is ignored for undirected graphs.

## Value

Numeric vector of integer numbers giving the coreness of each vertex.

## Details

The k-core of a graph is the maximal subgraph in which every vertex has
at least degree k. The cores of a graph form layers: the (k+1)-core is
always a subgraph of the k-core.

This function calculates the coreness for each vertex.

## Related documentation in the C library

[`coreness()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_coreness),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## References

Vladimir Batagelj, Matjaz Zaversnik: An O(m) Algorithm for Cores
Decomposition of Networks, 2002

Seidman S. B. (1983) Network structure and minimum degree, *Social
Networks*, 5, 269–287.

## See also

[`degree()`](https://r.igraph.org/reference/degree.md)

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
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

## Examples

``` r
g <- make_ring(10)
g <- add_edges(g, c(1, 2, 2, 3, 1, 3))
coreness(g) # small core triangle in a ring
#>  [1] 3 3 3 2 2 2 2 2 2 2
```
