# Connected components of a graph

**\[deprecated\]**

`cluster.distribution()` was renamed to
[`component_distribution()`](https://r.igraph.org/reference/components.md)
to create a more consistent API.

## Usage

``` r
cluster.distribution(graph, cumulative = FALSE, mul.size = FALSE, ...)
```

## Arguments

- graph:

  The graph to analyze.

- cumulative:

  Logical, if TRUE the cumulative distirubution (relative frequency) is
  calculated.

- mul.size:

  Logical. If TRUE the relative frequencies will be multiplied by the
  cluster sizes.

- ...:

  Additional attributes to pass to `cluster`, right now only `mode`
  makes sense.
