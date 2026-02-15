# Incident vertices of some graph edges

Incident vertices of some graph edges

## Usage

``` r
ends(graph, es, names = TRUE)
```

## Arguments

- graph:

  The input graph

- es:

  The sequence of edges to query

- names:

  Whether to return vertex names or numeric vertex ids. By default
  vertex names are used.

## Value

A two column matrix of vertex names or vertex ids.

## Related documentation in the C library

[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
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
g <- make_ring(5)
ends(g, E(g))
#>      [,1] [,2]
#> [1,]    1    2
#> [2,]    2    3
#> [3,]    3    4
#> [4,]    4    5
#> [5,]    1    5
```
