# Cocitation coupling

Two vertices are cocited if there is another vertex citing both of them.
`cocitation()` simply counts how many types two vertices are cocited.
The bibliographic coupling of two vertices is the number of other
vertices they both cite, `bibcoupling()` calculates this.

## Usage

``` r
cocitation(graph, v = V(graph))

bibcoupling(graph, v = V(graph))
```

## Arguments

- graph:

  The graph object to analyze

- v:

  Vertex sequence or numeric vector, the vertex ids for which the
  cocitation or bibliographic coupling values we want to calculate. The
  default is all vertices.

## Value

A numeric matrix with `length(v)` lines and `vcount(graph)` columns.
Element `(i,j)` contains the cocitation or bibliographic coupling for
vertices `v[i]` and `j`.

## Details

`cocitation()` calculates the cocitation counts for the vertices in the
`v` argument and all vertices in the graph.

`bibcoupling()` calculates the bibliographic coupling for vertices in
`v` and all vertices in the graph.

Calculating the cocitation or bibliographic coupling for only one vertex
costs the same amount of computation as for all vertices. This might
change in the future.

## Related documentation in the C library

[`cocitation`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_cocitation),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`bibcoupling`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_bibcoupling)

## See also

Other cocitation:
[`similarity()`](https://r.igraph.org/reference/similarity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_kautz_graph(2, 3)
cocitation(g)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]    0    2    0    0    0    0    0    0    0     0     0     0     0
#>  [2,]    2    0    0    0    0    0    0    0    0     0     0     0     0
#>  [3,]    0    0    0    2    0    0    0    0    0     0     0     0     0
#>  [4,]    0    0    2    0    0    0    0    0    0     0     0     0     0
#>  [5,]    0    0    0    0    0    2    0    0    0     0     0     0     0
#>  [6,]    0    0    0    0    2    0    0    0    0     0     0     0     0
#>  [7,]    0    0    0    0    0    0    0    2    0     0     0     0     0
#>  [8,]    0    0    0    0    0    0    2    0    0     0     0     0     0
#>  [9,]    0    0    0    0    0    0    0    0    0     2     0     0     0
#> [10,]    0    0    0    0    0    0    0    0    2     0     0     0     0
#> [11,]    0    0    0    0    0    0    0    0    0     0     0     2     0
#> [12,]    0    0    0    0    0    0    0    0    0     0     2     0     0
#> [13,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [14,]    0    0    0    0    0    0    0    0    0     0     0     0     2
#> [15,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [16,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [17,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [18,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [19,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [20,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [21,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [22,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [23,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [24,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>       [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24]
#>  [1,]     0     0     0     0     0     0     0     0     0     0     0
#>  [2,]     0     0     0     0     0     0     0     0     0     0     0
#>  [3,]     0     0     0     0     0     0     0     0     0     0     0
#>  [4,]     0     0     0     0     0     0     0     0     0     0     0
#>  [5,]     0     0     0     0     0     0     0     0     0     0     0
#>  [6,]     0     0     0     0     0     0     0     0     0     0     0
#>  [7,]     0     0     0     0     0     0     0     0     0     0     0
#>  [8,]     0     0     0     0     0     0     0     0     0     0     0
#>  [9,]     0     0     0     0     0     0     0     0     0     0     0
#> [10,]     0     0     0     0     0     0     0     0     0     0     0
#> [11,]     0     0     0     0     0     0     0     0     0     0     0
#> [12,]     0     0     0     0     0     0     0     0     0     0     0
#> [13,]     2     0     0     0     0     0     0     0     0     0     0
#> [14,]     0     0     0     0     0     0     0     0     0     0     0
#> [15,]     0     0     2     0     0     0     0     0     0     0     0
#> [16,]     0     2     0     0     0     0     0     0     0     0     0
#> [17,]     0     0     0     0     2     0     0     0     0     0     0
#> [18,]     0     0     0     2     0     0     0     0     0     0     0
#> [19,]     0     0     0     0     0     0     2     0     0     0     0
#> [20,]     0     0     0     0     0     2     0     0     0     0     0
#> [21,]     0     0     0     0     0     0     0     0     2     0     0
#> [22,]     0     0     0     0     0     0     0     2     0     0     0
#> [23,]     0     0     0     0     0     0     0     0     0     0     2
#> [24,]     0     0     0     0     0     0     0     0     0     2     0
bibcoupling(g)
#>       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11] [,12] [,13]
#>  [1,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [2,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [3,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [4,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [5,]    0    0    0    0    0    0    0    0    0     0     0     0     2
#>  [6,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [7,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [8,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#>  [9,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [10,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [11,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [12,]    0    0    0    0    0    0    0    0    0     0     0     0     0
#> [13,]    0    0    0    0    2    0    0    0    0     0     0     0     0
#> [14,]    0    0    0    0    0    2    0    0    0     0     0     0     0
#> [15,]    0    0    0    0    0    0    2    0    0     0     0     0     0
#> [16,]    0    0    0    0    0    0    0    2    0     0     0     0     0
#> [17,]    0    0    0    0    0    0    0    0    2     0     0     0     0
#> [18,]    0    0    0    0    0    0    0    0    0     2     0     0     0
#> [19,]    0    0    0    0    0    0    0    0    0     0     2     0     0
#> [20,]    0    0    0    0    0    0    0    0    0     0     0     2     0
#> [21,]    2    0    0    0    0    0    0    0    0     0     0     0     0
#> [22,]    0    2    0    0    0    0    0    0    0     0     0     0     0
#> [23,]    0    0    2    0    0    0    0    0    0     0     0     0     0
#> [24,]    0    0    0    2    0    0    0    0    0     0     0     0     0
#>       [,14] [,15] [,16] [,17] [,18] [,19] [,20] [,21] [,22] [,23] [,24]
#>  [1,]     0     0     0     0     0     0     0     2     0     0     0
#>  [2,]     0     0     0     0     0     0     0     0     2     0     0
#>  [3,]     0     0     0     0     0     0     0     0     0     2     0
#>  [4,]     0     0     0     0     0     0     0     0     0     0     2
#>  [5,]     0     0     0     0     0     0     0     0     0     0     0
#>  [6,]     2     0     0     0     0     0     0     0     0     0     0
#>  [7,]     0     2     0     0     0     0     0     0     0     0     0
#>  [8,]     0     0     2     0     0     0     0     0     0     0     0
#>  [9,]     0     0     0     2     0     0     0     0     0     0     0
#> [10,]     0     0     0     0     2     0     0     0     0     0     0
#> [11,]     0     0     0     0     0     2     0     0     0     0     0
#> [12,]     0     0     0     0     0     0     2     0     0     0     0
#> [13,]     0     0     0     0     0     0     0     0     0     0     0
#> [14,]     0     0     0     0     0     0     0     0     0     0     0
#> [15,]     0     0     0     0     0     0     0     0     0     0     0
#> [16,]     0     0     0     0     0     0     0     0     0     0     0
#> [17,]     0     0     0     0     0     0     0     0     0     0     0
#> [18,]     0     0     0     0     0     0     0     0     0     0     0
#> [19,]     0     0     0     0     0     0     0     0     0     0     0
#> [20,]     0     0     0     0     0     0     0     0     0     0     0
#> [21,]     0     0     0     0     0     0     0     0     0     0     0
#> [22,]     0     0     0     0     0     0     0     0     0     0     0
#> [23,]     0     0     0     0     0     0     0     0     0     0     0
#> [24,]     0     0     0     0     0     0     0     0     0     0     0
```
