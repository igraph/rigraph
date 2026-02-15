# Create graphs from adjacency lists

**\[deprecated\]**

`graph.adjlist()` was renamed to
[`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md)
to create a more consistent API.

## Usage

``` r
graph.adjlist(adjlist, mode = c("out", "in", "all", "total"), duplicate = TRUE)
```

## Arguments

- adjlist:

  The adjacency list. It should be consistent, i.e. the maximum
  throughout all vectors in the list must be less than the number of
  vectors (=the number of vertices in the graph).

- mode:

  Character scalar, it specifies whether the graph to create is
  undirected (‘all’ or ‘total’) or directed; and in the latter case,
  whether it contains the outgoing (‘out’) or the incoming (‘in’)
  neighbors of the vertices.

- duplicate:

  Logical scalar. For undirected graphs it gives whether edges are
  included in the list twice. E.g. if it is `TRUE` then for an
  undirected `{A,B}` edge
  [`graph_from_adj_list()`](https://r.igraph.org/reference/graph_from_adj_list.md)
  expects `A` included in the neighbors of `B` and `B` to be included in
  the neighbors of `A`.

  This argument is ignored if `mode` is `out` or `in`.

## Related documentation in the C library

[`adjlist`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_adjlist)
