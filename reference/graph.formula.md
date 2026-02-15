# Creating (small) graphs via a simple interface

**\[deprecated\]**

`graph.formula()` was renamed to
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
to create a more consistent API.

## Usage

``` r
graph.formula(..., simplify = TRUE)
```

## Arguments

- ...:

  For
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
  the formulae giving the structure of the graph, see details below. For
  [`from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)
  all arguments are passed to
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md).

- simplify:

  Logical scalar, whether to call
  [`simplify()`](https://r.igraph.org/reference/simplify.md) on the
  created graph. By default the graph is simplified, loop and multiple
  edges are removed.

## Related documentation in the C library

[`create`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`simplify`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`famous`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`empty`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty)
