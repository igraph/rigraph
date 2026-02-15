# Degree and degree distribution of the vertices

**\[deprecated\]**

`degree.distribution()` was renamed to
[`degree_distribution()`](https://r.igraph.org/reference/degree.md) to
create a more consistent API.

## Usage

``` r
degree.distribution(graph, cumulative = FALSE, ...)
```

## Arguments

- graph:

  The graph to analyze.

- cumulative:

  Logical; whether the cumulative degree distribution is to be
  calculated.

- ...:

  These dots are for future extensions and must be empty.

## Related documentation in the C library

[`degree`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_degree),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
