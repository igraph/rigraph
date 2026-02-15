# Create a star graph, a tree with n vertices and n - 1 leaves

**\[deprecated\]**

`graph.star()` was renamed to
[`make_star()`](https://r.igraph.org/reference/make_star.md) to create a
more consistent API.

## Usage

``` r
graph.star(n, mode = c("in", "out", "mutual", "undirected"), center = 1)
```

## Arguments

- n:

  Number of vertices.

- mode:

  It defines the direction of the edges, `in`: the edges point *to* the
  center, `out`: the edges point *from* the center, `mutual`: a directed
  star is created with mutual edges, `undirected`: the edges are
  undirected.

- center:

  ID of the center vertex.

## Related documentation in the C library

[`star`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_star)
