# Eccentricity of the vertices in a graph

The eccentricity of a vertex is its shortest path distance from the
farthest other node in the graph.

## Usage

``` r
eccentricity(
  graph,
  vids = V(graph),
  ...,
  weights = NULL,
  mode = c("all", "out", "in", "total")
)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- vids:

  The vertices for which the eccentricity is calculated.

- ...:

  These dots are for future extensions and must be empty.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the graph is treated as
  undirected, i.e. edge directions are not taken into account. This
  argument is ignored for undirected graphs.

## Value

`eccentricity()` returns a numeric vector, containing the eccentricity
score of each given vertex.

## Details

The eccentricity of a vertex is calculated by measuring the shortest
distance from (or to) the vertex, to (or from) all vertices in the
graph, and taking the maximum.

This implementation ignores vertex pairs that are in different
components. Isolate vertices have eccentricity zero.

## Related documentation in the C library

[`eccentricity_dijkstra()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_eccentricity_dijkstra),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Harary, F. Graph Theory. Reading, MA: Addison-Wesley, p. 35, 1994.

## See also

[`radius()`](https://r.igraph.org/reference/radius.md) for a related
concept, [`distances()`](https://r.igraph.org/reference/distances.md)
for general shortest path calculations.

Other paths:
[`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md),
[`diameter()`](https://r.igraph.org/reference/diameter.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`graph_center()`](https://r.igraph.org/reference/graph_center.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

## Examples

``` r
g <- make_star(10, mode = "undirected")
eccentricity(g)
#>  [1] 1 2 2 2 2 2 2 2 2 2
```
