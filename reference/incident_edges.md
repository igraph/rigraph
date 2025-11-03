# Incident edges of multiple vertices in a graph

This function is similar to
[`incident()`](https://r.igraph.org/reference/incident.md), but it
queries multiple vertices at once.

## Usage

``` r
incident_edges(graph, v, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  Input graph.

- v:

  The vertices to query

- mode:

  Whether to query outgoing (‘out’), incoming (‘in’) edges, or both
  types (‘all’). This is ignored for undirected graphs.

## Value

A list of edge sequences.

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
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Examples

``` r
g <- make_graph("Zachary")
incident_edges(g, c(1, 34))
#> [[1]]
#> + 16/78 edges from fa60aae:
#>  [1] 1-- 2 1-- 3 1-- 4 1-- 5 1-- 6 1-- 7 1-- 8 1-- 9 1--11 1--12 1--13 1--14
#> [13] 1--18 1--20 1--22 1--32
#> 
#> [[2]]
#> + 17/78 edges from fa60aae:
#>  [1]  9--34 10--34 14--34 15--34 16--34 19--34 20--34 21--34 23--34 24--34
#> [11] 27--34 28--34 29--34 30--34 31--34 32--34 33--34
#> 
```
