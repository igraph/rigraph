# Create a ring graph

**\[deprecated\]**

`graph.ring()` was renamed to
[`make_ring()`](https://r.igraph.org/reference/make_ring.md) to create a
more consistent API.

## Usage

``` r
graph.ring(n, directed = FALSE, mutual = FALSE, circular = TRUE)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether the graph is directed.

- mutual:

  Whether directed edges are mutual. It is ignored in undirected graphs.

- circular:

  Whether to create a circular ring. A non-circular ring is essentially
  a “line”: a tree where every non-leaf vertex has one child.

## Related documentation in the C library

[`ring`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_ring)
