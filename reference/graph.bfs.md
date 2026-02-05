# Breadth-first search

**\[deprecated\]**

`graph.bfs()` was renamed to
[`bfs()`](https://r.igraph.org/reference/bfs.md) to create a more
consistent API.

## Usage

``` r
graph.bfs(
  graph,
  root,
  mode = c("out", "in", "all", "total"),
  unreachable = TRUE,
  restricted = NULL,
  order = TRUE,
  rank = FALSE,
  father = FALSE,
  pred = FALSE,
  succ = FALSE,
  dist = FALSE,
  callback = NULL,
  extra = NULL,
  rho = parent.frame(),
  neimode
)
```

## Arguments

- graph:

  The input graph.

- root:

  Numeric vector, usually of length one. The root vertex, or root
  vertices to start the search from.

- mode:

  For directed graphs specifies the type of edges to follow. ‘out’
  follows outgoing, ‘in’ incoming edges. ‘all’ ignores edge directions
  completely. ‘total’ is a synonym for ‘all’. This argument is ignored
  for undirected graphs.

- unreachable:

  Logical scalar, whether the search should visit the vertices that are
  unreachable from the given root vertex (or vertices). If `TRUE`, then
  additional searches are performed until all vertices are visited.

- restricted:

  `NULL` (=no restriction), or a vector of vertices (ids or symbolic
  names). In the latter case, the search is restricted to the given
  vertices.

- order:

  Logical scalar, whether to return the ordering of the vertices.

- rank:

  Logical scalar, whether to return the rank of the vertices.

- father:

  Logical scalar, whether to return the father of the vertices.

- pred:

  Logical scalar, whether to return the predecessors of the vertices.

- succ:

  Logical scalar, whether to return the successors of the vertices.

- dist:

  Logical scalar, whether to return the distance from the root of the
  search tree.

- callback:

  If not `NULL`, then it must be callback function. This is called
  whenever a vertex is visited. The callback function should return
  `FALSE` to continue the search or `TRUE` to stop it. See details
  below.

- extra:

  Additional argument to supply to the callback function.

- rho:

  The environment in which the callback function is evaluated.

- neimode:

  **\[deprecated\]** This argument is deprecated from igraph 1.3.0; use
  `mode` instead.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
