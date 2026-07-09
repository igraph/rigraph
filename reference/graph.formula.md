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

  Logical, whether to call
  [`simplify()`](https://r.igraph.org/reference/simplify.md) on the
  created graph. By default the graph is simplified, loop and multiple
  edges are removed.
  [`simplify()`](https://r.igraph.org/reference/simplify.md) is only
  called when the created graph is not already simple, so the edge order
  from the formula is preserved whenever no loops or multi-edges are
  present. When the graph does contain loops or multi-edges (and
  `simplify = TRUE`),
  [`simplify()`](https://r.igraph.org/reference/simplify.md) reorders
  the edges into its canonical order.

## Related documentation in the C library

[`create()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`simplify()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[`is_simple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_simple),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty)
