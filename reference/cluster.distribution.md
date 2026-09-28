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

  For
  [`component_distribution()`](https://r.igraph.org/reference/components.md),
  forwarded to
  [`components()`](https://r.igraph.org/reference/components.md). For
  [`components()`](https://r.igraph.org/reference/components.md),
  [`is_connected()`](https://r.igraph.org/reference/components.md),
  [`count_components()`](https://r.igraph.org/reference/components.md)
  and
  [`largest_component()`](https://r.igraph.org/reference/components.md),
  these dots must be empty.

## Related documentation in the C library

[`connected_components()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_connected_components),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
