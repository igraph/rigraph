# Tails of the edge(s) in a graph

For undirected graphs, head and tail is not defined. In this case
`tail_of()` returns vertices incident to the supplied edges, and
[`head_of()`](https://r.igraph.org/reference/head_of.md) returns the
other end(s) of the edge(s).

## Usage

``` r
tail_of(graph, es)
```

## Arguments

- graph:

  The input graph.

- es:

  The edges to query.

## Value

A vertex sequence with the tail(s) of the edge(s).

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
[`neighbors()`](https://r.igraph.org/reference/neighbors.md)
