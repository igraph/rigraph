# Strength or weighted vertex degree

**\[deprecated\]**

`graph.strength()` was renamed to
[`strength()`](https://r.igraph.org/reference/strength.md) to create a
more consistent API.

## Usage

``` r
graph.strength(
  graph,
  vids = V(graph),
  mode = c("all", "out", "in", "total"),
  loops = TRUE,
  weights = NULL
)
```

## Arguments

- graph:

  The input graph.

- vids:

  The vertices for which the strength will be calculated.

- mode:

  Character string, “out” for out-degree, “in” for in-degree or “all”
  for the sum of the two. For undirected graphs this argument is
  ignored.

- loops:

  Logical; whether the loop edges are also counted.

- weights:

  Weight vector. If the graph has a `weight` edge attribute, then this
  is used by default. If the graph does not have a `weight` edge
  attribute and this argument is `NULL`, then a
  [`degree()`](https://r.igraph.org/reference/degree.md) is called. If
  this is `NA`, then no edge weights are used (even if the graph has a
  `weight` edge attribute).
