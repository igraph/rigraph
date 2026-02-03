# Infomap community finding

**\[deprecated\]**

`infomap.community()` was renamed to
[`cluster_infomap()`](https://r.igraph.org/reference/cluster_infomap.md)
to create a more consistent API.

## Usage

``` r
infomap.community(
  graph,
  e.weights = NULL,
  v.weights = NULL,
  nb.trials = 10,
  modularity = TRUE
)
```

## Arguments

- graph:

  The input graph. Edge directions will be taken into account.

- e.weights:

  If not `NULL`, then a numeric vector of edge weights. The length must
  match the number of edges in the graph. By default the ‘`weight`’ edge
  attribute is used as weights. If it is not present, then all edges are
  considered to have the same weight. Larger edge weights correspond to
  stronger connections.

- v.weights:

  If not `NULL`, then a numeric vector of vertex weights. The length
  must match the number of vertices in the graph. By default the
  ‘`weight`’ vertex attribute is used as weights. If it is not present,
  then all vertices are considered to have the same weight. A larger
  vertex weight means a larger probability that the random surfer jumps
  to that vertex.

- nb.trials:

  The number of attempts to partition the network (can be any integer
  value equal or larger than 1).

- modularity:

  Logical scalar, whether to calculate the modularity score of the
  detected community structure.

## Related documentation in the C library

[`community_infomap()`](https://igraph.org/c/html/latest/igraph-Community.html#igraph_community_infomap),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
