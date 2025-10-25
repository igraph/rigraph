# Shortest (directed or undirected) paths between vertices

**\[deprecated\]**

`average.path.length()` was renamed to
[`mean_distance()`](https://r.igraph.org/reference/distances.md) to
create a more consistent API.

## Usage

``` r
average.path.length(
  graph,
  weights = NULL,
  directed = TRUE,
  unconnected = TRUE,
  details = FALSE
)
```

## Arguments

- graph:

  The graph to work on.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- directed:

  Whether to consider directed paths in directed graphs, this argument
  is ignored for undirected graphs.

- unconnected:

  What to do if the graph is unconnected (not strongly connected if
  directed paths are considered). If TRUE, only the lengths of the
  existing paths are considered and averaged; if FALSE, the length of
  the missing paths are considered as having infinite length, making the
  mean distance infinite as well.

- details:

  Whether to provide additional details in the result. Functions
  accepting this argument (like
  [`mean_distance()`](https://r.igraph.org/reference/distances.md))
  return additional information like the number of disconnected vertex
  pairs in the result when this parameter is set to `TRUE`.
