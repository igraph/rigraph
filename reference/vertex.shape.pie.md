# Using pie charts as vertices in graph plots

More complex vertex images can be used to express addtional information
about vertices. E.g. pie charts can be used as vertices, to denote
vertex classes, fuzzy classification of vertices, etc.

## Details

The vertex shape ‘pie’ makes igraph draw a pie chart for every vertex.
There are some extra graphical vertex parameters that specify how the
pie charts will look like:

- pie:

  Numeric vector, gives the sizes of the pie slices.

- pie.color:

  A list of color vectors to use for the pies. If it is a list of a
  single vector, then this is used for all pies. It the color vector is
  shorter than the number of areas in a pie, then it is recycled.

- pie.angle:

  The slope of shading lines, given as an angle in degrees
  (counter-clockwise).

- pie.density:

  The density of the shading lines, in lines per inch. Non-positive
  values inhibit the drawing of shading lines.

- pie.lty:

  The line type of the border of the slices.

## See also

[`igraph.plotting()`](https://r.igraph.org/reference/plot.common.md),
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
values <- lapply(1:10, function(x) sample(1:10, 3))

if (FALSE) { # interactive()
plot(g,
  vertex.shape = "pie", vertex.pie = values,
  vertex.pie.color = list(heat.colors(5)),
  vertex.size = seq(10, 30, length.out = 10), vertex.label = NA
)
}
```
