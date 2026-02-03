# Matching

**\[deprecated\]**

`maximum.bipartite.matching()` was renamed to
[`max_bipartite_match()`](https://r.igraph.org/reference/matching.md) to
create a more consistent API.

## Usage

``` r
maximum.bipartite.matching(
  graph,
  types = NULL,
  weights = NULL,
  eps = .Machine$double.eps
)
```

## Arguments

- graph:

  The input graph. It might be directed, but edge directions will be
  ignored.

- types:

  Vertex types, if the graph is bipartite. By default they are taken
  from the ‘`type`’ vertex attribute, if present.

- weights:

  Potential edge weights. If the graph has an edge attribute called
  ‘`weight`’, and this argument is `NULL`, then the edge attribute is
  used automatically. In weighted matching, the weights of the edges
  must match as much as possible.

- eps:

  A small real number used in equality tests in the weighted bipartite
  matching algorithm. Two real numbers are considered equal in the
  algorithm if their difference is smaller than `eps`. This is required
  to avoid the accumulation of numerical errors. By default it is set to
  the smallest \\x\\, such that \\1+x \ne 1\\ holds. If you are running
  the algorithm with no weights, this argument is ignored.

## Related documentation in the C library

[`maximum_bipartite_matching()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_maximum_bipartite_matching),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
