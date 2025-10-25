# Choose an appropriate graph layout algorithm automatically

**\[deprecated\]**

`layout.auto()` was renamed to
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md) to
create a more consistent API.

## Usage

``` r
layout.auto(graph, dim = 2, ...)
```

## Arguments

- graph:

  The input graph

- dim:

  Dimensions, should be 2 or 3.

- ...:

  For
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md)
  the extra arguments are passed to the real layout function. For
  [`nicely()`](https://r.igraph.org/reference/layout_nicely.md) all
  argument are passed to
  [`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md).
