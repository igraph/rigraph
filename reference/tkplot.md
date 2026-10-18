# Interactive plotting of graphs

**\[defunct\]**

`tkplot()` used to open an interactive Tcl/Tk window for drawing a
graph. It is defunct since igraph 3.0.0 and throws an error when called.
igraph has no interactive replacement:
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md) draws a
graph on any R graphics device, and
[`rglplot()`](https://r.igraph.org/reference/rglplot.md) draws it in 3D.

`tk_close()`, `tk_off()`, `tk_fit()`, `tk_center()`, `tk_reshape()`,
`tk_postscript()`, `tk_coords()`, `tk_set_coords()`, `tk_rotate()` and
`tk_canvas()` acted on a window opened by `tkplot()`. As no such window
can be opened any more, they have nothing to act on: `tk_off()` does
nothing, and the others throw an error.

## Usage

``` r
tkplot(graph, canvas.width = 450, canvas.height = 450, ...)

tk_close(tkp.id, ..., window.close = TRUE)

tk_off()

tk_fit(tkp.id, ..., width = NULL, height = NULL)

tk_center(tkp.id)

tk_reshape(tkp.id, newlayout, ..., params)

tk_postscript(tkp.id)

tk_coords(tkp.id, ..., norm = FALSE)

tk_set_coords(tkp.id, coords)

tk_rotate(tkp.id, ..., degree = NULL, rad = NULL)

tk_canvas(tkp.id)
```

## Arguments

- graph, canvas.width, canvas.height:

  Ignored, `tkplot()` is defunct.

- ...:

  Ignored by `tkplot()`. For `tk_close()`, `tk_fit()`, `tk_coords()` and
  `tk_rotate()`, these dots must be empty.

- tkp.id:

  The ID of the tkplot window to close/reshape/etc.

- window.close:

  Leave this on the default value.

- width:

  The width of the rectangle for generating new coordinates.

- height:

  The height of the rectangle for generating new coordinates.

- newlayout:

  The new layout, see the `layout` parameter of tkplot.

- params:

  Extra parameters in a list, to pass to the layout function.

- norm:

  Logical, should we norm the coordinates.

- coords:

  Two-column numeric matrix, the new coordinates of the vertices, in
  absolute coordinates.

- degree:

  The degree to rotate the plot.

- rad:

  The degree to rotate the plot, in radian.

## Value

`tkplot()` throws an error.

`tk_off()` returns `NULL` invisibly. The other functions throw an error,
as no plot with ID `tkp.id` exists.

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
[`layout()`](https://r.igraph.org/reference/layout_.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
