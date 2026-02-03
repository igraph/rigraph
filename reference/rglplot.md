# 3D plotting of graphs with OpenGL

Using the `rgl` package, `rglplot()` plots a graph in 3D. The plot can
be zoomed, rotated, shifted, etc. but the coordinates of the vertices is
fixed.

## Usage

``` r
rglplot(x, ...)
```

## Arguments

- x:

  The graph to plot.

- ...:

  Additional arguments, see
  [igraph.plotting](https://r.igraph.org/reference/plot.common.md) for
  the details

## Value

`NULL`, invisibly.

## Details

Note that `rglplot()` is considered to be highly experimental. It is not
very useful either. See
[igraph.plotting](https://r.igraph.org/reference/plot.common.md) for the
possible arguments.

## Related documentation in the C library

[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## See also

[igraph.plotting](https://r.igraph.org/reference/plot.common.md),
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md) for the
2D version, [`tkplot()`](https://r.igraph.org/reference/tkplot.md) for
interactive graph drawing in 2D.

Other plot:
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_lattice(c(5, 5, 5))
coords <- layout_with_fr(g, dim = 3)

if (FALSE) { # interactive() && rlang::is_installed("rgl")
rglplot(g, layout = coords)
}
```
