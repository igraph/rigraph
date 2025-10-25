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
