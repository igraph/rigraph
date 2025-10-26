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

## Author

Gabor Csardi <csardi.gabor@gmail.com>.

## Examples

``` r
g <- make_full_graph(5) + make_full_graph(5)
hrg <- fit_hrg(g)
as.igraph(hrg)
#> IGRAPH 8ad1c01 DN-- 19 18 -- Fitted HRG
#> + attr: name (g/c), name (v/c), prob (v/n)
#> + edges from 8ad1c01 (vertex names):
#>  [1] g1->g4 g2->g6 g3->g9 g4->g5 g5->g3 g6->6  g7->7  g8->8  g9->1  g1->g2
#> [11] g2->g7 g3->2  g4->3  g5->5  g6->9  g7->g8 g8->10 g9->4 
```
