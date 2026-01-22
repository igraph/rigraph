# Optimal edge curvature when plotting graphs

**\[deprecated\]**

`autocurve.edges()` was renamed to
[`curve_multiple()`](https://r.igraph.org/reference/curve_multiple.md)
to create a more consistent API.

## Usage

``` r
autocurve.edges(graph, start = 0.5)
```

## Arguments

- graph:

  The input graph.

- start:

  The curvature at the two extreme edges. All edges will have a
  curvature between `-start` and `start`, spaced equally.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
