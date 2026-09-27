# Random graphs from vertex fitness scores

**\[deprecated\]**

`static.fitness.game()` was renamed to
[`sample_fitness()`](https://r.igraph.org/reference/sample_fitness.md)
to create a more consistent API.

## Usage

``` r
static.fitness.game(
  no.of.edges,
  fitness.out,
  fitness.in = NULL,
  loops = FALSE,
  multiple = FALSE
)
```

## Arguments

- no.of.edges:

  The number of edges in the generated graph.

- fitness.out:

  A numeric vector containing the fitness of each vertex. For directed
  graphs, this specifies the out-fitness of each vertex.

- fitness.in:

  Numeric vector that specifies the in-fitness of each vertex. The
  generated graph will be directed. Default: `NULL`, the generated graph
  will be undirected.

- loops:

  Logical, whether to allow loop edges in the graph.

- multiple:

  Logical, whether to allow multiple edges in the graph.

## Related documentation in the C library

[`static_fitness_game()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_static_fitness_game)
