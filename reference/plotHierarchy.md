# Calculate Cohesive Blocks

**\[deprecated\]**

`plotHierarchy()` was renamed to
[`plot_hierarchy()`](https://r.igraph.org/reference/cohesive_blocks.md)
to create a more consistent API.

## Usage

``` r
plotHierarchy(
  blocks,
  layout = layout_as_tree(hierarchy(blocks), root = 1),
  ...
)
```

## Arguments

- layout:

  The layout of a plot, it is simply passed on to
  [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md), see
  the possible formats there. By default the Reingold-Tilford layout
  generator is used.

- ...:

  Additional arguments.
  [`plot_hierarchy()`](https://r.igraph.org/reference/cohesive_blocks.md)
  and [`plot()`](https://rdrr.io/r/graphics/plot.default.html) pass them
  to [`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md).
  [`print()`](https://rdrr.io/r/base/print.html) and
  [`summary()`](https://rdrr.io/r/base/summary.html) ignore them.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
