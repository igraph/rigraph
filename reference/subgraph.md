# Subgraph of a graph

`subgraph()` creates a subgraph of a graph, containing only the
specified vertices and all the edges among them.

## Usage

``` r
subgraph(graph, vids)

induced_subgraph(
  graph,
  vids,
  impl = c("auto", "copy_and_delete", "create_from_scratch")
)

subgraph_from_edges(graph, eids, delete.vertices = TRUE)
```

## Arguments

- graph:

  The original graph.

- vids:

  Numeric vector, the vertices of the original graph which will form the
  subgraph.

- impl:

  Character scalar, to choose between two implementation of the subgraph
  calculation. ‘`copy_and_delete`’ copies the graph first, and then
  deletes the vertices and edges that are not included in the result
  graph. ‘`create_from_scratch`’ searches for all vertices and edges
  that must be kept and then uses them to create the graph from scratch.
  ‘`auto`’ chooses between the two implementations automatically, using
  heuristics based on the size of the original and the result graph.

- eids:

  The edge ids of the edges that will be kept in the result graph.

- delete.vertices:

  Logical scalar, whether to remove vertices that do not have any
  adjacent edges in `eids`.

## Value

A new graph object.

## Details

`induced_subgraph()` calculates the induced subgraph of a set of
vertices in a graph. This means that exactly the specified vertices and
all the edges between them will be kept in the result graph.

`subgraph_from_edges()` calculates the subgraph of a graph. For this
function one can specify the vertices and edges to keep. This function
will be renamed to `subgraph()` in the next major version of igraph.

The `subgraph()` function currently does the same as
`induced_subgraph()` (assuming ‘`auto`’ as the `impl` argument), but
this behaviour is deprecated. In the next major version, `subgraph()`
will overtake the functionality of `subgraph_from_edges()`.

## Related documentation in the C library

[`induced_subgraph`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_induced_subgraph),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`subgraph_from_edges`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_subgraph_from_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

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
g2 <- induced_subgraph(g, 1:7)
g3 <- subgraph_from_edges(g, 1:5)
```
