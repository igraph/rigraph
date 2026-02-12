# Convert between directed and undirected graphs

**\[deprecated\]**

`as.directed()` was renamed to
[`as_directed()`](https://r.igraph.org/reference/as_directed.md) to
create a more consistent API.

## Usage

``` r
as.directed(graph, mode = c("mutual", "arbitrary", "random", "acyclic"))
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
