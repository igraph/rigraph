# Minimal vertex separators

**\[deprecated\]**

`is.minimal.separator()` was renamed to
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md)
to create a more consistent API.

## Usage

``` r
is.minimal.separator(graph, candidate)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

- candidate:

  A numeric vector giving the vertex ids of the candidate separator.
