# The Davidson-Harel layout algorithm

**\[deprecated\]**

`layout.davidson.harel()` was renamed to
[`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md)
to create a more consistent API.

## Usage

``` r
layout.davidson.harel(
  graph,
  coords = NULL,
  maxiter = 10,
  fineiter = max(10, log2(vcount(graph))),
  cool.fact = 0.75,
  weight.node.dist = 1,
  weight.border = 0,
  weight.edge.lengths = edge_density(graph)/10,
  weight.edge.crossings = 1 - sqrt(edge_density(graph)),
  weight.node.edge.dist = 0.2 * (1 - edge_density(graph))
)
```

## Arguments

- graph:

  The graph to lay out. Edge directions are ignored.

- coords:

  Optional starting positions for the vertices. If this argument is not
  `NULL` then it should be an appropriate matrix of starting
  coordinates.

- maxiter:

  Number of iterations to perform in the first phase.

- fineiter:

  Number of iterations in the fine tuning phase.

- cool.fact:

  Cooling factor.

- weight.node.dist:

  Weight for the node-node distances component of the energy function.

- weight.border:

  Weight for the distance from the border component of the energy
  function. It can be set to zero, if vertices are allowed to sit on the
  border.

- weight.edge.lengths:

  Weight for the edge length component of the energy function.

- weight.edge.crossings:

  Weight for the edge crossing component of the energy function.

- weight.node.edge.dist:

  Weight for the node-edge distance component of the energy function.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`layout_davidson_harel`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_davidson_harel),
[`density`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_density)
