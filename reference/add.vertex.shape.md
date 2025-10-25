# Various vertex shapes when plotting igraph graphs

**\[deprecated\]**

`add.vertex.shape()` was renamed to
[`add_shape()`](https://r.igraph.org/reference/shapes.md) to create a
more consistent API.

## Usage

``` r
add.vertex.shape(
  shape,
  clip = shape_noclip,
  plot = shape_noplot,
  parameters = list()
)
```

## Arguments

- shape:

  Character scalar, name of a vertex shape. If it is `NULL` for
  [`shapes()`](https://r.igraph.org/reference/shapes.md), then the names
  of all defined vertex shapes are returned.

- clip:

  An R function object, the clipping function.

- plot:

  An R function object, the plotting function.

- parameters:

  Named list, additional plot/vertex/edge parameters. The element named
  define the new parameters, and the elements themselves define their
  default values. Vertex parameters should have a prefix ‘`vertex.`’,
  edge parameters a prefix ‘`edge.`’. Other general plotting parameters
  should have a prefix ‘`plot.`’. See Details below.
