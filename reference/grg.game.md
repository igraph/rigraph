# Geometric random graphs

**\[deprecated\]**

`grg.game()` was renamed to
[`sample_grg()`](https://r.igraph.org/reference/sample_grg.md) to create
a more consistent API.

## Usage

``` r
grg.game(nodes, radius, torus = FALSE, coords = FALSE)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- radius:

  The radius within which the vertices will be connected by an edge.

- torus:

  Logical constant, whether to use a torus instead of a square.

- coords:

  Logical scalar, whether to add the positions of the vertices as vertex
  attributes called ‘`x`’ and ‘`y`’.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
