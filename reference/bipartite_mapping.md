# Decide whether a graph is bipartite

This function decides whether the vertices of a network can be mapped to
two vertex types in a way that no vertices of the same type are
connected.

## Usage

``` r
bipartite_mapping(graph)
```

## Arguments

- graph:

  The input graph.

## Value

A named list with two elements:

- res:

  A logical scalar, `TRUE` if the can be bipartite, `FALSE` otherwise.

- type:

  A possible vertex type mapping, a logical vector. If no such mapping
  exists, then an empty vector.

## Details

A bipartite graph in igraph has a ‘`type`’ vertex attribute giving the
two vertex types.

This function simply checks whether a graph *could* be bipartite. It
tries to find a mapping that gives a possible division of the vertices
into two classes, such that no two vertices of the same class are
connected by an edge.

The existence of such a mapping is equivalent of having no circuits of
odd length in the graph. A graph with loop edges cannot bipartite.

Note that the mapping is not necessarily unique, e.g. if the graph has
at least two components, then the vertices in the separate components
can be mapped independently.

## See also

Bipartite graphs
[`bipartite_projection()`](https://r.igraph.org/reference/bipartite_projection.md),
[`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md),
[`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[[`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md)](https://igraph.org/c/html/latest/igraph-Bipartite.html#igraph_is_bipartite).

## Examples

``` r
## Rings with an even number of vertices are bipartite
g <- make_ring(10)
bipartite_mapping(g)
#> $res
#> [1] TRUE
#> 
#> $type
#>  [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
#> 

## All star graphs are bipartite
g2 <- make_star(10)
bipartite_mapping(g2)
#> $res
#> [1] TRUE
#> 
#> $type
#>  [1] FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
#> 

## A graph containing a triangle is not bipartite
g3 <- make_ring(10)
g3 <- add_edges(g3, c(1, 3))
bipartite_mapping(g3)
#> $res
#> [1] FALSE
#> 
#> $type
#> logical(0)
#> 
```
