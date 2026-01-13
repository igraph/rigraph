# Permute the vertices of a graph

**\[deprecated\]**

`permute.vertices()` was renamed to
[`permute()`](https://r.igraph.org/reference/permute.md) to create a
more consistent API.

## Usage

``` r
permute.vertices(graph, permutation)
```

## Arguments

- graph:

  The input graph, it can directed or undirected.

- permutation:

  A numeric vector giving the permutation to apply. The first element is
  the new id of vertex 1, etc. Every number between one and
  `vcount(graph)` must appear exactly once.

## Related documentation in the C library

[`permute_vertices()`](https://igraph.org/c/html/latest/igraph-Isomorphism.html#igraph_permute_vertices)
