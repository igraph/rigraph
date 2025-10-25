# Community structure dendrogram plots

**\[deprecated\]**

`dendPlot()` was renamed to
[`plot_dendrogram()`](https://r.igraph.org/reference/plot_dendrogram.communities.md)
to create a more consistent API.

## Usage

``` r
dendPlot(x, mode = igraph_opt("dend.plot.type"), ...)
```

## Arguments

- x:

  An object containing the community structure of a graph. See
  [`communities()`](https://r.igraph.org/reference/communities.md) for
  details.

- mode:

  Which dendrogram plotting function to use. See details below.

- ...:

  Additional arguments to supply to the dendrogram plotting function.
