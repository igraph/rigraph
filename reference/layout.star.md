# Generate coordinates to place the vertices of a graph in a star-shape

**\[deprecated\]**

`layout.star()` was renamed to
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md)
to create a more consistent API.

## Usage

``` r
layout.star(graph, center = V(graph)[1], order = NULL)
```

## Arguments

- graph:

  The graph to layout.

- center:

  The id of the vertex to put in the center. By default it is the first
  vertex.

- order:

  Numeric vector, the order of the vertices along the perimeter. The
  default ordering is given by the vertex ids.
