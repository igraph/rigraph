# Vertex connectivity

The vertex connectivity of a graph or two vertices, this is recently
also called group cohesion.

## Usage

``` r
vertex_connectivity(graph, source = NULL, target = NULL, checks = TRUE)

vertex_disjoint_paths(graph, source = NULL, target = NULL)

# S3 method for class 'igraph'
cohesion(x, checks = TRUE, ...)
```

## Arguments

- graph, x:

  The input graph.

- source:

  The id of the source vertex, for `vertex_connectivity()` it can be
  `NULL`, see details below.

- target:

  The id of the target vertex, for `vertex_connectivity()` it can be
  `NULL`, see details below.

- checks:

  Logical constant. Whether to check that the graph is connected and
  also the degree of the vertices. If the graph is not (strongly)
  connected then the connectivity is obviously zero. Otherwise if the
  minimum degree is one then the vertex connectivity is also one. It is
  a good idea to perform these checks, as they can be done quickly
  compared to the connectivity calculation itself. They were suggested
  by Peter McMahan, thanks Peter.

- ...:

  Additional arguments passed to methods. Not used by
  `vertex_connectivity()` directly but may be used by other methods that
  implement `cohesion()`.

## Value

A scalar real value.

## Details

The vertex connectivity of two vertices (`source` and `target`) in a
graph is the minimum number of vertices that must be deleted to
eliminate all (directed) paths from `source` to `target`.
`vertex_connectivity()` calculates this quantity if both the `source`
and `target` arguments are given and they're not `NULL`.

The vertex connectivity of a pair is the same as the number of different
(i.e. node-independent) paths from source to target, assuming no direct
edges between them.

The vertex connectivity of a graph is the minimum vertex connectivity of
all (ordered) pairs of vertices in the graph. In other words this is the
minimum number of vertices needed to remove to make the graph not
strongly connected. (If the graph is not strongly connected then this is
zero.) `vertex_connectivity()` calculates this quantity if neither the
`source` nor `target` arguments are given. (I.e. they are both `NULL`.)

A set of vertex disjoint directed paths from `source` to `vertex` is a
set of directed paths between them whose vertices do not contain common
vertices (apart from `source` and `target`). The maximum number of
vertex disjoint paths between two vertices is the same as their vertex
connectivity in most cases (if the two vertices are not connected by an
edge).

The cohesion of a graph (as defined by White and Harary, see
references), is the vertex connectivity of the graph. This is calculated
by `cohesion()`.

These three functions essentially calculate the same measure(s), more
precisely `vertex_connectivity()` is the most general, the other two are
included only for the ease of using more descriptive function names.

## Related documentation in the C library

[`st_vertex_connectivity()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_st_vertex_connectivity),
[`vertex_connectivity()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_vertex_connectivity),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`vertex_disjoint_paths()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_vertex_disjoint_paths),
[`cohesion()`](https://igraph.org/c/html/0.10.17/igraph-Flows.html#igraph_cohesion)

## References

White, Douglas R and Frank Harary 2001. The Cohesiveness of Blocks In
Social Networks: Node Connectivity and Conditional Density.
*Sociological Methodology* 31 (1) : 305-359.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_pa(100, m = 1)
g <- delete_edges(g, E(g)[100 %--% 1])
g2 <- sample_pa(100, m = 5)
g2 <- delete_edges(g2, E(g2)[100 %--% 1])
vertex_connectivity(g, 100, 1)
#> [1] 1
vertex_connectivity(g2, 100, 1)
#> [1] 5
vertex_disjoint_paths(g2, 100, 1)
#> [1] 5

g <- sample_gnp(50, 5 / 50)
g <- as_directed(g)
g <- induced_subgraph(g, subcomponent(g, 1))
cohesion(g)
#> [1] 2
```
