# Plotting of graphs

`plot.igraph()` is able to plot graphs to any R device. It is the
non-interactive companion of the
[`tkplot()`](https://r.igraph.org/reference/tkplot.md) function.

## Usage

``` r
# S3 method for class 'igraph'
plot(
  x,
  axes = FALSE,
  add = FALSE,
  xlim = NULL,
  ylim = NULL,
  mark.groups = list(),
  mark.shape = 1/2,
  mark.col = rainbow(length(mark.groups), alpha = 0.3),
  mark.border = rainbow(length(mark.groups), alpha = 1),
  mark.expand = 15,
  mark.lwd = 1,
  loop.size = 1,
  ...
)
```

## Arguments

- x:

  The graph to plot.

- axes:

  Logical, whether to plot axes, defaults to FALSE.

- add:

  Logical scalar, whether to add the plot to the current device, or
  delete the device's current contents first.

- xlim:

  The limits for the horizontal axis, it is unlikely that you want to
  modify this.

- ylim:

  The limits for the vertical axis, it is unlikely that you want to
  modify this.

- mark.groups:

  A list of vertex id vectors. It is interpreted as a set of vertex
  groups. Each vertex group is highlighted, by plotting a colored
  smoothed polygon around and “under” it. See the arguments below to
  control the look of the polygons.

- mark.shape:

  A numeric scalar or vector. Controls the smoothness of the vertex
  group marking polygons. This is basically the ‘shape’ parameter of the
  [`graphics::xspline()`](https://rdrr.io/r/graphics/xspline.html)
  function, its possible values are between -1 and 1. If it is a vector,
  then a different value is used for the different vertex groups.

- mark.col:

  A scalar or vector giving the colors of marking the polygons, in any
  format accepted by
  [`graphics::xspline()`](https://rdrr.io/r/graphics/xspline.html); e.g.
  numeric color ids, symbolic color names, or colors in RGB.

- mark.border:

  A scalar or vector giving the colors of the borders of the vertex
  group marking polygons. If it is `NA`, then no border is drawn.

- mark.expand:

  A numeric scalar or vector, the size of the border around the marked
  vertex groups. It is in the same units as the vertex sizes. If a
  vector is given, then different values are used for the different
  vertex groups.

- mark.lwd:

  A numeric scalar or vector, the linewidth of the border around the
  marked vertex groups. If a vector is given, then different values are
  used for the different vertex groups.

- loop.size:

  A numeric scalar that allows the user to scale the loop edges of the
  network. The default loop size is 1. Larger values will produce larger
  loops.

- ...:

  Additional plotting parameters. See
  [igraph.plotting](https://r.igraph.org/reference/plot.common.md) for
  the complete list.

## Value

Returns `NULL`, invisibly.

## Details

One convenient way to plot graphs is to plot with
[`tkplot()`](https://r.igraph.org/reference/tkplot.md) first, handtune
the placement of the vertices, query the coordinates by the
[`tk_coords()`](https://r.igraph.org/reference/tkplot.md) function and
use them with [`plot()`](https://rdrr.io/r/graphics/plot.default.html)
to plot the graph to any R device.

## Related documentation in the C library

[`get_edgelist()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[[`incident()`](https://r.igraph.org/reference/incident.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_incident),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`is_loop()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_loop),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed),
[`convex_hull_2d()`](https://igraph.org/c/html/0.10.17/igraph-Nongraph.html#igraph_convex_hull_2d),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids)

## See also

[`layout()`](https://r.igraph.org/reference/layout_.md) for different
layouts,
[igraph.plotting](https://r.igraph.org/reference/plot.common.md) for the
detailed description of the plotting parameters and
[`tkplot()`](https://r.igraph.org/reference/tkplot.md) and
[`rglplot()`](https://r.igraph.org/reference/rglplot.md) for other graph
plotting functions.

Other plot: [`rglplot()`](https://r.igraph.org/reference/rglplot.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
plot(g, layout = layout_with_kk, vertex.color = "green")

```
