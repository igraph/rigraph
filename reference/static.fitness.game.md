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

  If `NULL` (the default), the generated graph will be undirected. If
  not `NULL`, then it should be a numeric vector and it specifies the
  in-fitness of each vertex.

  If this argument is not `NULL`, then a directed graph is generated,
  otherwise an undirected one.

- loops:

  Logical scalar, whether to allow loop edges in the graph.

- multiple:

  Logical scalar, whether to allow multiple edges in the graph.

## Related documentation in the C library

[`static_fitness_game()`](https://igraph.org/c/html/latest/igraph-Games.html#igraph_static_fitness_game)
