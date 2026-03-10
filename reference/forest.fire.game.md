# Forest Fire Network Model

**\[deprecated\]**

`forest.fire.game()` was renamed to
[`sample_forestfire()`](https://r.igraph.org/reference/sample_forestfire.md)
to create a more consistent API.

## Usage

``` r
forest.fire.game(nodes, fw.prob, bw.factor = 1, ambs = 1, directed = TRUE)
```

## Arguments

- nodes:

  The number of vertices in the graph.

- fw.prob:

  The forward burning probability, see details below.

- bw.factor:

  The backward burning ratio. The backward burning probability is
  calculated as `bw.factor*fw.prob`.

- ambs:

  The number of ambassador vertices.

- directed:

  Logical scalar, whether to create a directed graph.

## Related documentation in the C library

[`forest_fire_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_forest_fire_game)
