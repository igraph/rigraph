# Interactive plotting of graphs

`tkplot()` and its companion functions serve as an interactive graph
drawing facility. Not all parameters of the plot can be changed
interactively right now though, e.g. the colors of vertices, edges, and
also others have to be pre-defined.

## Usage

``` r
tkplot(graph, canvas.width = 450, canvas.height = 450, ...)

tk_close(tkp.id, window.close = TRUE)

tk_off()

tk_fit(tkp.id, width = NULL, height = NULL)

tk_center(tkp.id)

tk_reshape(tkp.id, newlayout, ..., params)

tk_postscript(tkp.id)

tk_coords(tkp.id, norm = FALSE)

tk_set_coords(tkp.id, coords)

tk_rotate(tkp.id, degree = NULL, rad = NULL)

tk_canvas(tkp.id)
```

## Arguments

- graph:

  The `graph` to plot.

- canvas.width, canvas.height:

  The size of the tkplot drawing area.

- ...:

  Additional plotting parameters. See
  [igraph.plotting](https://r.igraph.org/reference/plot.common.md) for
  the complete list.

- tkp.id:

  The id of the tkplot window to close/reshape/etc.

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

`tkplot()` returns an integer, the id of the plot, this can be used to
manipulate it from the command line.

`tk_canvas()` returns `tkwin` object, the Tk canvas.

`tk_coords()` returns a matrix with the coordinates.

`tk_close()`, `tk_off()`, `tk_fit()`, `tk_reshape()`, `tk_postscript()`,
`tk_center()` and `tk_rotate()` return `NULL` invisibly.

## Details

`tkplot()` is an interactive graph drawing facility. It is not very well
developed at this stage, but it should be still useful.

It's handling should be quite straightforward most of the time, here are
some remarks and hints.

There are different popup menus, activated by the right mouse button,
for vertices and edges. Both operate on the current selection if the
vertex/edge under the cursor is part of the selection and operate on the
vertex/edge under the cursor if it is not.

One selection can be active at a time, either a vertex or an edge
selection. A vertex/edge can be added to a selection by holding the
`control` key while clicking on it with the left mouse button. Doing
this again deselect the vertex/edge.

Selections can be made also from the "Select" menu. The "Select some
vertices" dialog allows to give an expression for the vertices to be
selected: this can be a list of numeric R expessions separated by
commas, like `1,2:10,12,14,15` for example. Similarly in the "Select
some edges" dialog two such lists can be given and all edges connecting
a vertex in the first list to one in the second list will be selected.

In the color dialog a color name like 'orange' or RGB notation can also
be used.

The `tkplot()` command creates a new Tk window with the graphical
representation of `graph`. The command returns an integer number, the
tkplot id. The other commands utilize this id to be able to query or
manipulate the plot.

`tk_close()` closes the Tk plot with id `tkp.id`.

`tk_off()` closes all Tk plots.

`tk_fit()` fits the plot to the given rectangle (`width` and `height`),
if some of these are `NULL` the actual physical width od height of the
plot window is used.

`tk_reshape()` applies a new layout to the plot, its optional parameters
will be collected to a list analogous to `layout.par`.

`tk_postscript()` creates a dialog window for saving the plot in
postscript format.

`tk_canvas()` returns the Tk canvas object that belongs to a graph plot.
The canvas can be directly manipulated then, e.g. labels can be added,
it could be saved to a file programmatically, etc. See an example below.

`tk_coords()` returns the coordinates of the vertices in a matrix. Each
row corresponds to one vertex.

`tk_set_coords()` sets the coordinates of the vertices. A two-column
matrix specifies the new positions, with each row corresponding to a
single vertex.

`tk_center()` shifts the figure to the center of its plot window.

`tk_rotate()` rotates the figure, its parameter can be given either in
degrees or in radians.

tkplot.center tkplot.rotate

## Examples

    g <- make_ring(10)
    tkplot(g)

    ## Saving a tkplot() to a file programmatically
    g <- make_star(10, center=10) 
    E(g)$width <- sample(1:10, ecount(g), replace=TRUE)
    lay <- layout_nicely(g)

    id <- tkplot(g, layout=lay)
    canvas <- tk_canvas(id)
    tcltk::tkpostscript(canvas, file="/tmp/output.eps")
    tk_close(id)

    ## Setting the coordinates and adding a title label
    g <- make_ring(10)
    id <- tkplot(make_ring(10), canvas.width=450, canvas.height=500)

    canvas <- tk_canvas(id)
    padding <- 20
    coords <- norm_coords(layout_in_circle(g), 0+padding, 450-padding,
                          50+padding, 500-padding)
    tk_set_coords(id, coords)

    width <- as.numeric(tkcget(canvas, "-width"))
    height <- as.numeric(tkcget(canvas, "-height"))
    tkcreate(canvas, "text", width/2, 25, text="My title",
             justify="center", font=tcltk::tkfont.create(family="helvetica",
             size=20,weight="bold"))

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
[`layout()`](https://r.igraph.org/reference/layout_.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>
