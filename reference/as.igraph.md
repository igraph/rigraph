# Conversion to igraph

These functions convert various objects to igraph graphs.

## Usage

``` r
as.igraph(x, ...)
```

## Arguments

- x:

  The object to convert.

- ...:

  Additional arguments. None currently.

## Value

All these functions return an igraph graph.

## Details

You can use `as.igraph()` to convert various objects to igraph graphs.
Right now the following objects are supported:

- codeigraphHRG These objects are created by the
  [`fit_hrg()`](https://r.igraph.org/reference/fit_hrg.md) and
  [`consensus_tree()`](https://r.igraph.org/reference/consensus_tree.md)
  functions.

## Related documentation in the C library

[`create()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[`simplify()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify)

## Author

Gabor Csardi <csardi.gabor@gmail.com>.

## Examples

``` r
g <- make_full_graph(5) + make_full_graph(5)
hrg <- fit_hrg(g)
as.igraph(hrg)
#> IGRAPH 7041998 DN-- 19 18 -- Fitted HRG
#> + attr: name (g/c), name (v/c), prob (v/n)
#> + edges from 7041998 (vertex names):
#>  [1] g1->g6 g2->8  g3->g4 g4->6  g5->g3 g6->g7 g7->1  g8->2  g9->4  g1->g5
#> [11] g2->9  g3->7  g4->10 g5->g2 g6->3  g7->g8 g8->g9 g9->5 
```
