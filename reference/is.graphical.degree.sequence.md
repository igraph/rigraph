# Is a degree sequence graphical?

**\[deprecated\]**

`is.graphical.degree.sequence()` was renamed to
[`is_graphical()`](https://r.igraph.org/reference/is_graphical.md) to
create a more consistent API.

## Usage

``` r
is.graphical.degree.sequence(
  out.deg,
  in.deg = NULL,
  allowed.edge.types = c("simple", "loops", "multi", "all")
)
```

## Arguments

- out.deg:

  Integer vector, the degree sequence for undirected graphs, or the
  out-degree sequence for directed graphs.

- in.deg:

  `NULL` or an integer vector. For undirected graphs, it should be
  `NULL`. For directed graphs it specifies the in-degrees.

- allowed.edge.types:

  The allowed edge types in the graph. ‘simple’ means that neither loop
  nor multiple edges are allowed (i.e. the graph must be simple).
  ‘loops’ means that loop edges are allowed but mutiple edges are not.
  ‘multi’ means that multiple edges are allowed but loop edges are not.
  ‘all’ means that both loop edges and multiple edges are allowed.

## Related documentation in the C library

[[`is_graphical()`](https://r.igraph.org/reference/is_graphical.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_graphical)
