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
  edge.attr.comb = igraph_opt("edge_attr_combine")
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

## Related documentation in the C library

[`to_undirected()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_to_undirected)
