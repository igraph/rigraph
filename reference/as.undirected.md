# Convert between undirected and unundirected graphs

**\[deprecated\]**

`as.undirected()` was renamed to
[`as_undirected()`](https://r.igraph.org/reference/as_directed.md) to
create a more consistent API.

## Usage

``` r
as.undirected(
  graph,
  mode = c("collapse", "each", "mutual"),
  edge.attr.comb = igraph_opt("edge.attr.comb")
)
```

## Arguments

- graph:

  The graph to convert.

- mode:

  Character constant, defines the conversion algorithm. For
  [`as_directed()`](https://r.igraph.org/reference/as_directed.md) it
  can be `mutual` or `arbitrary`. For
  [`as_undirected()`](https://r.igraph.org/reference/as_directed.md) it
  can be `each`, `collapse` or `mutual`. See details below.

- edge.attr.comb:

  Specifies what to do with edge attributes, if `mode="collapse"` or
  `mode="mutual"`. In these cases many edges might be mapped to a single
  one in the new graph, and their attributes are combined. Please see
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details on this.

## Related documentation in the C library

[`to_undirected()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_to_undirected)
