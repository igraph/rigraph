# Chordality of a graph

A graph is chordal (or triangulated) if each of its cycles of four or
more nodes has a chord, which is an edge joining two nodes that are not
adjacent in the cycle. An equivalent definition is that any chordless
cycles have at most three nodes.

## Usage

``` r
is_chordal(
  graph,
  alpha = NULL,
  alpham1 = NULL,
  fillin = FALSE,
  newgraph = FALSE
)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored,
  as the algorithm is defined for undirected graphs.

- alpha:

  Numeric vector, the maximal chardinality ordering of the vertices. If
  it is `NULL`, then it is automatically calculated by calling
  [`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md),
  or from `alpham1` if that is given..

- alpham1:

  Numeric vector, the inverse of `alpha`. If it is `NULL`, then it is
  automatically calculated by calling
  [`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md),
  or from `alpha`.

- fillin:

  Logical scalar, whether to calculate the fill-in edges.

- newgraph:

  Logical scalar, whether to calculate the triangulated graph.

## Value

A list with three members:

- chordal:

  Logical scalar, it is `TRUE` iff the input graph is chordal.

- fillin:

  If requested, then a numeric vector giving the fill-in edges. `NULL`
  otherwise.

- newgraph:

  If requested, then the triangulated graph, an `igraph` object. `NULL`
  otherwise.

## Details

The chordality of the graph is decided by first performing maximum
cardinality search on it (if the `alpha` and `alpham1` arguments are
`NULL`), and then calculating the set of fill-in edges.

The set of fill-in edges is empty if and only if the graph is chordal.

It is also true that adding the fill-in edges to the graph makes it
chordal.

## References

Robert E Tarjan and Mihalis Yannakakis. (1984). Simple linear-time
algorithms to test chordality of graphs, test acyclicity of hypergraphs,
and selectively reduce acyclic hypergraphs. *SIAM Journal of
Computation* 13, 566–579.

## See also

[`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md)

Other chordal:
[`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

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
#> + 9/9 vertices, named, from 7df1cf6:
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
#> + 10/10 vertices, named, from 3f60ab7:
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
