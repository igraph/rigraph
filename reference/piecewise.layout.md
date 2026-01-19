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
