# Is this a complete graph?

A graph is considered complete if there is an edge between all distinct
directed pairs of vertices. igraph considers both the singleton graph
and the null graph complete.

## Usage

``` r
is_complete(graph)
```

## Arguments

- graph:

  The input graph.

## Value

True if the graph is complete.

## Related documentation in the C library

[`is_complete()`](https://igraph.org/c/html/0.10.17/igraph-Cliques.html#igraph_is_complete)

## See also

[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md)

Other cliques: [`cliques()`](https://r.igraph.org/reference/cliques.md),
[`ivs()`](https://r.igraph.org/reference/ivs.md),
[`weighted_cliques()`](https://r.igraph.org/reference/weighted_cliques.md)

## Examples

``` r
g <- make_full_graph(6, directed = TRUE)
is_complete(g)
#> [1] TRUE
g <- delete_edges(g, 1)
is_complete(g)
#> [1] FALSE
g <- as_undirected(g)
is_complete(g)
#> [1] TRUE
```
