# The Sugiyama graph layout generator

**\[deprecated\]**

`layout.sugiyama()` was renamed to
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
to create a more consistent API.

## Usage

``` r
layout.sugiyama(
  graph,
  layers = NULL,
  hgap = 1,
  vgap = 1,
  maxiter = 100,
  weights = NULL,
  attributes = c("default", "all", "none")
)
```

## Arguments

- graph:

  The input graph.

- layers:

  A numeric vector or `NULL`. If not `NULL`, then it should specify the
  layer index of the vertices. Layers are numbered from one. If `NULL`,
  then igraph calculates the layers automatically.

- hgap:

  Real scalar, the minimum horizontal gap between vertices in the same
  layer.

- vgap:

  Real scalar, the distance between layers.

- maxiter:

  Integer scalar, the maximum number of iterations in the crossing
  minimization stage. 100 is a reasonable default; if you feel that you
  have too many edge crossings, increase this.

- weights:

  Optional edge weight vector. If `NULL`, then the 'weight' edge
  attribute is used, if there is one. Supply `NA` here and igraph
  ignores the edge weights. These are used only if the graph contains
  cycles; igraph will tend to reverse edges with smaller weights when
  breaking the cycles.

- attributes:

  Which graph/vertex/edge attributes to keep in the extended graph.
  ‘default’ keeps the ‘size’, ‘size2’, ‘shape’, ‘label’ and ‘color’
  vertex attributes and the ‘arrow.mode’ and ‘arrow.size’ edge
  attributes. ‘all’ keep all graph, vertex and edge attributes, ‘none’
  keeps none of them.

## Related documentation in the C library

[`layout_sugiyama()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_sugiyama),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_is_directed),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
