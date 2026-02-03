# Efficiency of a graph

These functions calculate the global or average local efficiency of a
network, or the local efficiency of every vertex in the network. See
below for definitions.

## Usage

``` r
global_efficiency(graph, weights = NULL, directed = TRUE)

local_efficiency(
  graph,
  vids = V(graph),
  weights = NULL,
  directed = TRUE,
  mode = c("all", "out", "in", "total")
)

average_local_efficiency(
  graph,
  weights = NULL,
  directed = TRUE,
  mode = c("all", "out", "in", "total")
)
```

## Arguments

- graph:

  The graph to analyze.

- weights:

  The edge weights. All edge weights must be non-negative; additionally,
  no edge weight may be NaN. If it is `NULL` (the default) and the graph
  has a `weight` edge attribute, then it is used automatically.

- directed:

  Logical scalar, whether to consider directed paths. Ignored for
  undirected graphs.

- vids:

  The vertex ids of the vertices for which the calculation will be done.
  Applies to the local efficiency calculation only.

- mode:

  Specifies how to define the local neighborhood of a vertex in directed
  graphs. “out” considers out-neighbors only, “in” considers
  in-neighbors only, “all” considers both.

## Value

For `global_efficiency()`, the global efficiency of the graph as a
single number. For `average_local_efficiency()`, the average local
efficiency of the graph as a single number. For `local_efficiency()`,
the local efficiency of each vertex in a vector.

## Global efficiency

The global efficiency of a network is defined as the average of inverse
distances between all pairs of vertices.

More precisely:

\$\$E_g = \frac{1}{n (n-1)} \sum\_{i \ne j} \frac{1}{d\_{ij}}\$\$

where \\n\\ is the number of vertices.

The inverse distance between pairs that are not reachable from each
other is considered to be zero. For graphs with fewer than 2 vertices,
NaN is returned.

## Local efficiency

The local efficiency of a network around a vertex is defined as follows:
We remove the vertex and compute the distances (shortest path lengths)
between its neighbours through the rest of the network. The local
efficiency around the removed vertex is the average of the inverse of
these distances.

The inverse distance between two vertices which are not reachable from
each other is considered to be zero. The local efficiency around a
vertex with fewer than two neighbours is taken to be zero by convention.

## Average local efficiency

The average local efficiency of a network is simply the arithmetic mean
of the local efficiencies of all the vertices; see the definition for
local efficiency above.

## Related documentation in the C library

[`global_efficiency()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_global_efficiency),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[`local_efficiency()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_efficiency),
[`average_local_efficiency()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_average_local_efficiency)

## References

V. Latora and M. Marchiori: Efficient Behavior of Small-World Networks,
Phys. Rev. Lett. 87, 198701 (2001).

I. Vragović, E. Louis, and A. Díaz-Guilera, Efficiency of informational
transfer in regular and complex networks, Phys. Rev. E 71, 1 (2005).

## Examples

``` r
g <- make_graph("zachary")
global_efficiency(g)
#> [1] 0.4920083
average_local_efficiency(g)
#> [1] 0.752932
```
