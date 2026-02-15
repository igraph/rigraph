# Independent vertex sets

**\[deprecated\]**

`independent.vertex.sets()` was renamed to
[`ivs()`](https://r.igraph.org/reference/ivs.md) to create a more
consistent API.

## Usage

``` r
independent.vertex.sets(graph, min = NULL, max = NULL)
```

## Arguments

- graph:

  The input graph.

- min:

  Numeric constant, limit for the minimum size of the independent vertex
  sets to find. `NULL` means no limit.

- max:

  Numeric constant, limit for the maximum size of the independent vertex
  sets to find. `NULL` means no limit.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
