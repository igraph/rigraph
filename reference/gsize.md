# The size of the graph (number of edges)

`ecount()` and `gsize()` are aliases.

## Usage

``` r
gsize(graph)

ecount(graph)
```

## Arguments

- graph:

  The graph.

## Value

Numeric scalar, the number of edges.

## Related documentation in the C library

[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md),
[`gorder()`](https://r.igraph.org/reference/gorder.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Examples

``` r
g <- sample_gnp(100, 2 / 100)
gsize(g)
#> [1] 81
ecount(g)
#> [1] 81

# Number of edges in a G(n,p) graph
replicate(100, sample_gnp(10, 1 / 2), simplify = FALSE) %>%
  vapply(gsize, 0) %>%
  hist()
```
