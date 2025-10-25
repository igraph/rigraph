# Biconnected components

Finding the biconnected components of a graph

## Usage

``` r
biconnected_components(graph)
```

## Arguments

- graph:

  The input graph. It is treated as an undirected graph, even if it is
  directed.

## Value

A named list with three components:

- no:

  Numeric scalar, an integer giving the number of biconnected components
  in the graph.

- tree_edges:

  The components themselves, a list of numeric vectors. Each vector is a
  set of edge ids giving the edges in a biconnected component. These
  edges define a spanning tree of the component.

- component_edges:

  A list of numeric vectors. It gives all edges in the components.

- components:

  A list of numeric vectors, the vertices of the components.

- articulation_points:

  The articulation points of the graph. See
  [`articulation_points()`](https://r.igraph.org/reference/articulation_points.md).

## Details

A graph is biconnected if the removal of any single vertex (and its
adjacent edges) does not disconnect it.

A biconnected component of a graph is a maximal biconnected subgraph of
it. The biconnected components of a graph can be given by the partition
of its edges: every edge is a member of exactly one biconnected
component. Note that this is not true for vertices: the same vertex can
be part of many biconnected components.

## See also

[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`components()`](https://r.igraph.org/reference/components.md),
[`is_connected()`](https://r.igraph.org/reference/components.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

Connected components
[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`decompose()`](https://r.igraph.org/reference/decompose.md),
[`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`biconnected_components()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_biconnected_components).

## Examples

``` r
g <- disjoint_union(make_full_graph(5), make_full_graph(5))
clu <- components(g)$membership
g <- add_edges(g, c(which(clu == 1), which(clu == 2)))
bc <- biconnected_components(g)
```
