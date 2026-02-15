# Depth-first search

**\[deprecated\]**

`graph.dfs()` was renamed to
[`dfs()`](https://r.igraph.org/reference/dfs.md) to create a more
consistent API.

## Usage

``` r
graph.dfs(
  graph,
  root,
  mode = c("out", "in", "all", "total"),
  unreachable = TRUE,
  order = TRUE,
  order.out = FALSE,
  father = FALSE,
  dist = FALSE,
  in.callback = NULL,
  out.callback = NULL,
  extra = NULL,
  rho = parent.frame(),
  neimode
)
```

## Arguments

- graph:

  The input graph.

- root:

  The single root vertex to start the search from.

- mode:

  For directed graphs specifies the type of edges to follow. ‘out’
  follows outgoing, ‘in’ incoming edges. ‘all’ ignores edge directions
  completely. ‘total’ is a synonym for ‘all’. This argument is ignored
  for undirected graphs.

- unreachable:

  Logical scalar, whether the search should visit the vertices that are
  unreachable from the given root vertex (or vertices). If `TRUE`, then
  additional searches are performed until all vertices are visited.

- order:

  Logical scalar, whether to return the DFS ordering of the vertices.

- order.out:

  Logical scalar, whether to return the ordering based on leaving the
  subtree of the vertex.

- father:

  Logical scalar, whether to return the father of the vertices.

- dist:

  Logical scalar, whether to return the distance from the root of the
  search tree.

- in.callback:

  If not `NULL`, then it must be callback function. This is called
  whenever a vertex is visited. See details below.

- out.callback:

  If not `NULL`, then it must be callback function. This is called
  whenever the subtree of a vertex is completed by the algorithm. See
  details below.

- extra:

  Additional argument to supply to the callback function.

- rho:

  The environment in which the callback function is evaluated.

- neimode:

  **\[deprecated\]** This argument is deprecated from igraph 1.3.0; use
  `mode` instead.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
