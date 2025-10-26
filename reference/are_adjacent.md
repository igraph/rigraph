# Are two vertices adjacent?

The order of the vertices only matters in directed graphs, where the
existence of a directed `(v1, v2)` edge is queried.

## Usage

``` r
are_adjacent(graph, v1, v2)
```

## Arguments

- graph:

  The graph.

- v1:

  The first vertex, tail in directed graphs.

- v2:

  The second vertex, head in directed graphs.

## Value

A logical scalar, `TRUE` if edge `(v1, v2)` exists in the graph.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
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

## Related documentation in the C library

[`are_adjacent()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_are_adjacent).

## Examples

``` r
ug <- make_ring(10)
ug
#> IGRAPH dc59db0 U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from dc59db0:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
are_adjacent(ug, 1, 2)
#> [1] TRUE
are_adjacent(ug, 2, 1)
#> [1] TRUE

dg <- make_ring(10, directed = TRUE)
dg
#> IGRAPH 297e224 D--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 297e224:
#>  [1]  1-> 2  2-> 3  3-> 4  4-> 5  5-> 6  6-> 7  7-> 8  8-> 9  9->10 10-> 1
are_adjacent(ug, 1, 2)
#> [1] TRUE
are_adjacent(ug, 2, 1)
#> [1] TRUE
```
