# Growing random graph generation

**\[deprecated\]**

`growing.random.game()` was renamed to
[`sample_growing()`](https://r.igraph.org/reference/sample_growing.md)
to create a more consistent API.

## Usage

``` r
growing.random.game(n, m = 1, directed = TRUE, citation = FALSE)
```

## Arguments

- n:

  Numeric constant, number of vertices in the graph.

- m:

  Numeric constant, number of edges added in each time step.

- directed:

  Logical, whether to create a directed graph.

- citation:

  Logical. If `TRUE` a citation graph is created, i.e. in each time step
  the added edges are originating from the new vertex.

## Related documentation in the C library

[`growing_random_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_growing_random_game)
