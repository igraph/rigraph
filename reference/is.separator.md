# Vertex separators

**\[deprecated\]**

`is.separator()` was renamed to
[`is_separator()`](https://r.igraph.org/reference/is_separator.md) to
create a more consistent API.

## Usage

``` r
is.separator(graph, candidate)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

- candidate:

  A numeric vector giving the vertex ids of the candidate separator.

## Related documentation in the C library

[[`is_separator()`](https://r.igraph.org/reference/is_separator.md)](https://igraph.org/c/html/latest/igraph-Separators.html#igraph_is_separator),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
