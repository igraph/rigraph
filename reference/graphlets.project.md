# Graphlet decomposition of a graph

**\[deprecated\]**

`graphlets.project()` was renamed to
[`graphlet_proj()`](https://r.igraph.org/reference/graphlet_basis.md) to
create a more consistent API.

## Usage

``` r
graphlets.project(
  graph,
  weights = NULL,
  cliques,
  niter = 1000,
  Mu = rep(1, length(cliques))
)
```

## Arguments

- graph:

  The input graph, edge directions are ignored. Only simple graph (i.e.
  graphs without self-loops and multiple edges) are supported.

- weights:

  Edge weights. If the graph has a `weight` edge attribute and this
  argument is `NULL` (the default), then the `weight` edge attribute is
  used.

- cliques:

  A list of vertex ids, the graphlet basis to use for the projection.

- niter:

  Integer scalar, the number of iterations to perform.

- Mu:

  Starting weights for the projection.

## Related documentation in the C library

[`graphlets_project()`](https://igraph.org/c/html/0.10.17/igraph-Graphlets.html#igraph_graphlets_project),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
