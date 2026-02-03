# Create a hierarchical random graph from an igraph graph

**\[deprecated\]**

`hrg.create()` was renamed to
[`hrg()`](https://r.igraph.org/reference/hrg.md) to create a more
consistent API.

## Usage

``` r
hrg.create(graph, prob)
```

## Arguments

- graph:

  The igraph graph to create the HRG from.

- prob:

  A vector of probabilities, one for each vertex, in the order of vertex
  ids.

## Related documentation in the C library

[`hrg_create()`](https://igraph.org/c/html/latest/igraph-HRG.html#igraph_hrg_create)
