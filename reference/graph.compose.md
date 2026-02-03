# Compose two graphs as binary relations

**\[deprecated\]**

`graph.compose()` was renamed to
[`compose()`](https://r.igraph.org/reference/compose.md) to create a
more consistent API.

## Usage

``` r
graph.compose(g1, g2, byname = "auto")
```

## Arguments

- g1:

  The first input graph.

- g2:

  The second input graph.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if both graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and one graph, but not both graphs are named.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[`permute_vertices()`](https://igraph.org/c/html/latest/igraph-Isomorphism.html#igraph_permute_vertices),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
