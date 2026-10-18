# Interactive plotting of graphs

**\[deprecated\]**

`tkplot.reshape()` was renamed to
[`tk_reshape()`](https://r.igraph.org/reference/tkplot.md) to create a
more consistent API. As
[`tkplot()`](https://r.igraph.org/reference/tkplot.md) is defunct,
neither function has a plot to act on.

## Usage

``` r
tkplot.reshape(tkp.id, newlayout, ..., params)
```

## Arguments

- tkp.id:

  The ID of the tkplot window to close/reshape/etc.

- newlayout:

  The new layout, see the `layout` parameter of tkplot.

- ...:

  Ignored by [`tkplot()`](https://r.igraph.org/reference/tkplot.md). For
  [`tk_close()`](https://r.igraph.org/reference/tkplot.md),
  [`tk_fit()`](https://r.igraph.org/reference/tkplot.md),
  [`tk_coords()`](https://r.igraph.org/reference/tkplot.md) and
  [`tk_rotate()`](https://r.igraph.org/reference/tkplot.md), these dots
  must be empty.

- params:

  Extra parameters in a list, to pass to the layout function.

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
