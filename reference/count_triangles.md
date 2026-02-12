# Find triangles in graphs

Count how many triangles a vertex is part of, in a graph, or just list
the triangles of a graph.

## Usage

``` r
triangles(graph)

count_triangles(graph, vids = V(graph))
```

## Arguments

- graph:

  The input graph. It might be directed, but edge directions are
  ignored.

- vids:

  The vertices to query, all of them by default. This might be a vector
  of numeric ids, or a character vector of symbolic vertex names for
  named graphs.

## Value

For `triangles()` a numeric vector of vertex ids, the first three
vertices belong to the first triangle found, etc.

For `count_triangles()` a numeric vector, the number of triangles for
all vertices queried.

## Details

`triangles()` lists all triangles of a graph. For efficiency, all
triangles are returned in a single vector. The first three vertices
belong to the first triangle, etc.

`count_triangles()` counts how many triangles a vertex is part of.

## See also

[`transitivity()`](https://r.igraph.org/reference/transitivity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`list_triangles()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_list_triangles),
[`adjacent_triangles()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_adjacent_triangles).

## Examples

``` r
## A small graph
kite <- make_graph("Krackhardt_Kite")
plot(kite)

matrix(triangles(kite), nrow = 3)
#>      [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10] [,11]
#> [1,]    4    4    4    4    4    4    4    4    6     6     7
#> [2,]    1    1    2    6    6    6    7    7    1     7     2
#> [3,]    2    3    5    1    3    7    2    5    3     8     5

## Adjacenct triangles
atri <- count_triangles(kite)
plot(kite, vertex.label = atri)


## Always true
sum(count_triangles(kite)) == length(triangles(kite))
#> [1] TRUE

## Should match, local transitivity is the
## number of adjacent triangles divided by the number
## of adjacency triples
transitivity(kite, type = "local")
#>  [1] 0.6666667 0.6666667 1.0000000 0.5333333 1.0000000 0.5000000 0.5000000
#>  [8] 0.3333333 0.0000000       NaN
count_triangles(kite) / (degree(kite) * (degree(kite) - 1) / 2)
#>  [1] 0.6666667 0.6666667 1.0000000 0.5333333 1.0000000 0.5000000 0.5000000
#>  [8] 0.3333333 0.0000000       NaN
```
