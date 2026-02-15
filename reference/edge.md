# Helper function for adding and deleting edges

This is a helper function that simplifies adding and deleting edges
to/from graphs.

## Usage

``` r
edge(...)

edges(...)
```

## Arguments

- ...:

  See details below.

## Value

A special object that can be used with together with igraph graphs and
the plus and minus operators.

## Details

`edges()` is an alias for `edge()`.

When adding edges via `+`, all unnamed arguments of `edge()` (or
`edges()`) are concatenated, and then passed to
[`add_edges()`](https://r.igraph.org/reference/add_edges.md). They are
interpreted as pairs of vertex ids, and an edge will added between each
pair. Named arguments will be used as edge attributes for the new edges.

When deleting edges via `-`, all arguments of `edge()` (or `edges()`)
are concatenated via [`c()`](https://rdrr.io/r/base/c.html) and passed
to [`delete_edges()`](https://r.igraph.org/reference/delete_edges.md).

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`contract()`](https://r.igraph.org/reference/contract.md),
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md),
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md),
[`difference()`](https://r.igraph.org/reference/difference.md),
[`difference.igraph()`](https://r.igraph.org/reference/difference.igraph.md),
[`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md),
[`igraph-minus`](https://r.igraph.org/reference/igraph-minus.md),
[`intersection()`](https://r.igraph.org/reference/intersection.md),
[`intersection.igraph()`](https://r.igraph.org/reference/intersection.igraph.md),
[`path()`](https://r.igraph.org/reference/path.md),
[`permute()`](https://r.igraph.org/reference/permute.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`transitive_closure()`](https://r.igraph.org/reference/transitive_closure.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Examples

``` r
g <- make_ring(10) %>%
  set_edge_attr("color", value = "red")

g <- g + edge(1, 5, color = "green") +
  edge(2, 6, color = "blue") -
  edge("8|9")

E(g)[[]]
#> + 11/11 edges from f77ba05:
#>    tail head tid hid color
#> 1     1    2   1   2   red
#> 2     2    3   2   3   red
#> 3     3    4   3   4   red
#> 4     4    5   4   5   red
#> 5     5    6   5   6   red
#> 6     6    7   6   7   red
#> 7     7    8   7   8   red
#> 8     9   10   9  10   red
#> 9     1   10   1  10   red
#> 10    1    5   1   5 green
#> 11    2    6   2   6  blue

g %>%
  add_layout_(in_circle()) %>%
  plot()


g <- make_ring(10) + edges(1:10)
plot(g)
```
