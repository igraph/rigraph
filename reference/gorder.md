# Order (number of vertices) of a graph

`vcount()` and `gorder()` are aliases.

## Usage

``` r
vcount(graph)

gorder(graph)
```

## Arguments

- graph:

  The graph

## Value

Number of vertices, numeric scalar.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md),
[`gsize()`](https://r.igraph.org/reference/gsize.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount).

## Examples

``` r
g <- make_ring(10)
gorder(g)
#> [1] 10
vcount(g)
#> [1] 10
```
