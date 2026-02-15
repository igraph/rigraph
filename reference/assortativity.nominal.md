# Assortativity coefficient

**\[deprecated\]**

`assortativity.nominal()` was renamed to
[`assortativity_nominal()`](https://r.igraph.org/reference/assortativity.md)
to create a more consistent API.

## Usage

``` r
assortativity.nominal(graph, types, directed = TRUE, normalized = TRUE)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- types:

  Vector giving the vertex types. They as assumed to be integer numbers,
  starting with one. Non-integer values are converted to integers with
  [`as.integer()`](https://rdrr.io/r/base/integer.html). Character
  vectors are converted to integers using
  [`as.factor()`](https://rdrr.io/r/base/factor.html).

- directed:

  Logical scalar, whether to consider edge directions for directed
  graphs. This argument is ignored for undirected graphs. Supply `TRUE`
  here to do the natural thing, i.e. use directed version of the measure
  for directed graphs and the undirected version for undirected graphs.

- normalized:

  Boolean, whether to compute the normalized assortativity. The
  non-normalized nominal assortativity is identical to modularity. The
  non-normalized value-based assortativity is simply the covariance of
  the values at the two ends of edges.

## Related documentation in the C library

[`assortativity_nominal`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_assortativity_nominal)
