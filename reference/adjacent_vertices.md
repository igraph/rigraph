# Adjacent vertices of multiple vertices in a graph

This function is similar to
[`neighbors()`](https://r.igraph.org/reference/neighbors.md), but it
queries the adjacent vertices for multiple vertices at once.

## Usage

``` r
adjacent_vertices(graph, v, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  Input graph.

- v:

  The vertices to query.

- mode:

  Whether to query outgoing (‘out’), incoming (‘in’) edges, or both
  types (‘all’). This is ignored for undirected graphs.

## Value

A list of vertex sequences.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md),
[`gorder()`](https://r.igraph.org/reference/gorder.md),
[`gsize()`](https://r.igraph.org/reference/gsize.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Examples

``` r
g <- make_graph("Zachary")
adjacent_vertices(g, c(1, 34))
#> [[1]]
#> + 16/34 vertices, from d14e2a3:
#>  [1]  2  3  4  5  6  7  8  9 11 12 13 14 18 20 22 32
#> 
#> [[2]]
#> + 17/34 vertices, from d14e2a3:
#>  [1]  9 10 14 15 16 19 20 21 23 24 27 28 29 30 31 32 33
#> 
```
