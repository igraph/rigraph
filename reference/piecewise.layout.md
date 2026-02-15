# Merging graph layouts

**\[deprecated\]**

`piecewise.layout()` was renamed to
[`layout_components()`](https://r.igraph.org/reference/merge_coords.md)
to create a more consistent API.

## Usage

``` r
piecewise.layout(graph, layout = layout_with_kk, ...)
```

## Arguments

- graph:

  The input graph.

- layout:

  A function object, the layout function to use.

- ...:

  Additional arguments to pass to the `layout` layout function.

## Related documentation in the C library

[`decompose`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_decompose),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
