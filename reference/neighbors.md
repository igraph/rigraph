# Neighboring (adjacent) vertices in a graph

A vertex is a neighbor of another one (in other words, the two vertices
are adjacent), if they are incident to the same edge.

## Usage

``` r
neighbors(graph, v, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  The input graph.

- v:

  The vertex of which the adjacent vertices are queried.

- mode:

  Whether to query outgoing (‘out’), incoming (‘in’) edges, or both
  types (‘all’). This is ignored for undirected graphs.

## Value

A vertex sequence containing the neighbors of the input vertex.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md),
[`gorder()`](https://r.igraph.org/reference/gorder.md),
[`gsize()`](https://r.igraph.org/reference/gsize.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Examples

``` r
g <- make_graph("Zachary")
n1 <- neighbors(g, 1)
n34 <- neighbors(g, 34)
intersection(n1, n34)
#> + 4/34 vertices, from 59d5f6c:
#> [1]  9 14 20 32
```
