# Assortativity coefficient

**\[deprecated\]**

`assortativity.degree()` was renamed to
[`assortativity_degree()`](https://r.igraph.org/reference/assortativity.md)
to create a more consistent API.

## Usage

``` r
assortativity.degree(graph, directed = TRUE)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- directed:

  Logical scalar, whether to consider edge directions for directed
  graphs. This argument is ignored for undirected graphs. Supply `TRUE`
  here to do the natural thing, i.e. use directed version of the measure
  for directed graphs and the undirected version for undirected graphs.
