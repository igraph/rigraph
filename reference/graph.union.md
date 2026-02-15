# Union of graphs

**\[deprecated\]**

`graph.union()` was renamed to
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md) to
create a more consistent API.

## Usage

``` r
graph.union(..., byname = "auto")
```

## Arguments

- ...:

  Graph objects or lists of graph objects.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if all graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and some (but not all) graphs are named.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`permute_vertices`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_permute_vertices),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
