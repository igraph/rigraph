# Maximum cardinality search

Maximum cardinality search is a simple ordering a vertices that is
useful in determining the chordality of a graph.

## Usage

``` r
max_cardinality(graph)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored,
  as the algorithm is defined for undirected graphs.

## Value

A list with two components:

- alpha:

  Numeric vector. The 1-based rank of each vertex in the graph such that
  the vertex with rank 1 is visited first, the vertex with rank 2 is
  visited second and so on.

- alpham1:

  Numeric vector. The inverse of `alpha`. In other words, the elements
  of this vector are the vertices in reverse maximum cardinality search
  order.

## Details

Maximum cardinality search visits the vertices in such an order that
every time the vertex with the most already visited neighbors is
visited. Ties are broken randomly.

The algorithm provides a simple basis for deciding whether a graph is
chordal, see References below, and also
[`is_chordal()`](https://r.igraph.org/reference/is_chordal.md).

## References

Robert E Tarjan and Mihalis Yannakakis. (1984). Simple linear-time
algorithms to test chordality of graphs, test acyclicity of hypergraphs,
and selectively reduce acyclic hypergraphs. *SIAM Journal of
Computation* 13, 566–579.

## See also

[`is_chordal()`](https://r.igraph.org/reference/is_chordal.md)

Other chordal:
[`is_chordal()`](https://r.igraph.org/reference/is_chordal.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`maximum_cardinality_search()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_maximum_cardinality_search).

## Examples

``` r
## The examples from the Tarjan-Yannakakis paper
g1 <- graph_from_literal(
  A - B:C:I, B - A:C:D, C - A:B:E:H, D - B:E:F,
  E - C:D:F:H, F - D:E:G, G - F:H, H - C:E:G:I,
  I - A:H
)
max_cardinality(g1)
#> $alpha
#> [1] 9 4 6 8 3 5 7 2 1
#> 
#> $alpham1
#> + 9/9 vertices, named, from 67dbb46:
#> [1] G F D B E C H I A
#> 
is_chordal(g1, fillin = TRUE)
#> $chordal
#> [1] FALSE
#> 
#> $fillin
#>  [1] 2 6 8 7 5 7 2 7 6 1 7 1
#> 
#> $newgraph
#> NULL
#> 

g2 <- graph_from_literal(
  A - B:E, B - A:E:F:D, C - E:D:G, D - B:F:E:C:G,
  E - A:B:C:D:F, F - B:D:E, G - C:D:H:I, H - G:I:J,
  I - G:H:J, J - H:I
)
max_cardinality(g2)
#> $alpha
#>  [1] 10  8  9  6  7  5  4  2  3  1
#> 
#> $alpham1
#> + 10/10 vertices, named, from e8e9aae:
#>  [1] J H I G C F D B E A
#> 
is_chordal(g2, fillin = TRUE)
#> $chordal
#> [1] TRUE
#> 
#> $fillin
#> numeric(0)
#> 
#> $newgraph
#> NULL
#> 
```
