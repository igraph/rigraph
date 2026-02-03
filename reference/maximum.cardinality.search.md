# Maximum cardinality search

**\[deprecated\]**

`maximum.cardinality.search()` was renamed to
[`max_cardinality()`](https://r.igraph.org/reference/max_cardinality.md)
to create a more consistent API.

## Usage

``` r
maximum.cardinality.search(graph)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored,
  as the algorithm is defined for undirected graphs.

## Related documentation in the C library

[`maximum_cardinality_search()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_maximum_cardinality_search),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
