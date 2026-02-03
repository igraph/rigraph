# Edge connectivity

The edge connectivity of a graph or two vertices, this is recently also
called group adhesion.

## Usage

``` r
edge_connectivity(graph, source = NULL, target = NULL, checks = TRUE)

edge_disjoint_paths(graph, source = NULL, target = NULL)

adhesion(graph, checks = TRUE)
```

## Arguments

- graph:

  The input graph.

- source:

  The id of the source vertex, for `edge_connectivity()` it can be
  `NULL`, see details below.

- target:

  The id of the target vertex, for `edge_connectivity()` it can be
  `NULL`, see details below.

- checks:

  Logical constant. Whether to check that the graph is connected and
  also the degree of the vertices. If the graph is not (strongly)
  connected then the connectivity is obviously zero. Otherwise if the
  minimum degree is one then the edge connectivity is also one. It is a
  good idea to perform these checks, as they can be done quickly
  compared to the connectivity calculation itself. They were suggested
  by Peter McMahan, thanks Peter.

## Value

A scalar real value.

## `edge_connectivity()` Edge connectivity

The edge connectivity of a pair of vertices (`source` and `target`) is
the minimum number of edges needed to remove to eliminate all (directed)
paths from `source` to `target`. `edge_connectivity()` calculates this
quantity if both the `source` and `target` arguments are given (and not
`NULL`).

The edge connectivity of a graph is the minimum of the edge connectivity
of every (ordered) pair of vertices in the graph. `edge_connectivity()`
calculates this quantity if neither the `source` nor the `target`
arguments are given (i.e. they are both `NULL`).

## `edge_disjoint_paths()` The maximum number of edge-disjoint paths between two vertices

A set of paths between two vertices is called edge-disjoint if they do
not share any edges. The maximum number of edge-disjoint paths are
calculated by this function using maximum flow techniques. Directed
paths are considered in directed graphs.

A set of edge disjoint paths between two vertices is a set of paths
between them containing no common edges. The maximum number of edge
disjoint paths between two vertices is the same as their edge
connectivity.

When there are no direct edges between the source and the target, the
number of vertex-disjoint paths is the same as the vertex connectivity
of the two vertices. When some edges are present, each one of them
contributes one extra path.

## `adhesion()` Adhesion of a graph

The adhesion of a graph is the minimum number of edges needed to remove
to obtain a graph which is not strongly connected. This is the same as
the edge connectivity of the graph.

## All three functions

The three functions documented on this page calculate similar
properties, more precisely the most general is `edge_connectivity()`,
the others are included only for having more descriptive function names.

## Related documentation in the C library

[`edge_connectivity()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_edge_connectivity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`adhesion()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_adhesion)

## References

Douglas R. White and Frank Harary (2001): The cohesiveness of blocks in
social networks: node connectivity and conditional density, Sociological
Methodology, vol. 31, 2001, pp. 305–59.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_pa(100, m = 1)
g2 <- sample_pa(100, m = 5)
edge_connectivity(g, 100, 1)
#> [1] 1
edge_connectivity(g2, 100, 1)
#> [1] 5
edge_disjoint_paths(g2, 100, 1)
#> [1] 5

g <- sample_gnp(50, 5 / 50)
g <- as_directed(g)
g <- induced_subgraph(g, subcomponent(g, 1))
adhesion(g)
#> [1] 1
```
