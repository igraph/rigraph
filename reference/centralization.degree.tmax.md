# Theoretical maximum for degree centralization

**\[deprecated\]**

`centralization.degree.tmax()` was renamed to
[`centr_degree_tmax()`](https://r.igraph.org/reference/centr_degree_tmax.md)
to create a more consistent API.

## Usage

``` r
centralization.degree.tmax(
  graph = NULL,
  nodes = 0,
  mode = c("all", "out", "in", "total"),
  loops = FALSE
)
```

## Arguments

- graph:

  The input graph. It can also be `NULL` if `nodes` is given.

- nodes:

  The number of vertices. This is ignored if the graph is given.

- mode:

  This is the same as the `mode` argument of
  [`degree()`](https://r.igraph.org/reference/degree.md). Ignored if
  `graph` is given and the graph is undirected.

- loops:

  Logical scalar, whether to consider loops edges when calculating the
  degree.
