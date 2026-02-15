# Interactive plotting of graphs

**\[deprecated\]**

`tkplot.reshape()` was renamed to
[`tk_reshape()`](https://r.igraph.org/reference/tkplot.md) to create a
more consistent API.

## Usage

``` r
tkplot.reshape(tkp.id, newlayout, ..., params)
```

## Arguments

- tkp.id:

  The id of the tkplot window to close/reshape/etc.

- newlayout:

  The new layout, see the `layout` parameter of tkplot.

- ...:

  Additional plotting parameters. See
  [igraph.plotting](https://r.igraph.org/reference/plot.common.md) for
  the complete list.

- params:

  Extra parameters in a list, to pass to the layout function.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
