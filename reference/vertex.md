# Helper function for adding and deleting vertices

This is a helper function that simplifies adding and deleting vertices
to/from graphs.

## Usage

``` r
vertex(...)

vertices(...)
```

## Arguments

- ...:

  See details below.

## Value

A special object that can be used with together with igraph graphs and
the plus and minus operators.

## Details

`vertices()` is an alias for `vertex()`.

When adding vertices via `+`, all unnamed arguments are interpreted as
vertex names of the new vertices. Named arguments are interpreted as
vertex attributes for the new vertices.

When deleting vertices via `-`, all arguments of `vertex()` (or
`vertices()`) are concatenated via
[`c()`](https://rdrr.io/r/base/c.html) and passed to
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md).

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
[`edge()`](https://r.igraph.org/reference/edge.md),
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
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md)

## Examples

``` r
g <- make_(ring(10), with_vertex_(name = LETTERS[1:10])) +
  vertices("X", "Y")
g
#> IGRAPH 15c6b65 UN-- 12 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 15c6b65 (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
plot(g)
```
