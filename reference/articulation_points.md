# Articulation points and bridges of a graph

`articulation_points()` finds the articulation points (or cut vertices)

## Usage

``` r
articulation_points(graph)

bridges(graph)
```

## Arguments

- graph:

  The input graph. It is treated as an undirected graph, even if it is
  directed.

## Value

For `articulation_points()`, a numeric vector giving the vertex IDs of
the articulation points of the input graph. For `bridges()`, a numeric
vector giving the edge IDs of the bridges of the input graph.

## Details

Articulation points or cut vertices are vertices whose removal increases
the number of connected components in a graph. Similarly, bridges or
cut-edges are edges whose removal increases the number of connected
components in a graph. If the original graph was connected, then the
removal of a single articulation point or a single bridge makes it
disconnected. If a graph contains no articulation points, then its
vertex connectivity is at least two.

## Related documentation in the C library

[`articulation_points()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_articulation_points),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`bridges()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_bridges),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids)

## See also

[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`components()`](https://r.igraph.org/reference/components.md),
[`is_connected()`](https://r.igraph.org/reference/components.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md)

Connected components
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`count_reachable()`](https://r.igraph.org/reference/count_reachable.md),
[`decompose()`](https://r.igraph.org/reference/decompose.md),
[`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- disjoint_union(make_full_graph(5), make_full_graph(5))
clu <- components(g)$membership
g <- add_edges(g, c(match(1, clu), match(2, clu)))
articulation_points(g)
#> + 2/10 vertices, from 629eea6:
#> [1] 6 1

g <- make_graph("krackhardt_kite")
bridges(g)
#> + 2/18 edges from 4d3772e:
#> [1] 9--10 8-- 9
```
