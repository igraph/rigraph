# Scale-free random graphs, from vertex fitness scores

**\[deprecated\]**

`static.power.law.game()` was renamed to
[`sample_fitness_pl()`](https://r.igraph.org/reference/sample_fitness_pl.md)
to create a more consistent API.

## Usage

``` r
static.power.law.game(
  no.of.nodes,
  no.of.edges,
  exponent.out,
  exponent.in = -1,
  loops = FALSE,
  multiple = FALSE,
  finite.size.correction = TRUE
)
```

## Arguments

- no.of.nodes:

  The number of vertices in the generated graph.

- no.of.edges:

  The number of edges in the generated graph.

- exponent.out:

  Numeric scalar, the power law exponent of the degree distribution. For
  directed graphs, this specifies the exponent of the out-degree
  distribution. It must be greater than or equal to 2. If you pass `Inf`
  here, you will get back an Erdős-Rényi random network.

- exponent.in:

  Numeric scalar. If negative, the generated graph will be undirected.
  If greater than or equal to 2, this argument specifies the exponent of
  the in-degree distribution. If non-negative but less than 2, an error
  will be generated.

- loops:

  Logical scalar, whether to allow loop edges in the graph.

- multiple:

  Logical scalar, whether to allow multiple edges in the graph.

- finite.size.correction:

  Logical scalar, whether to use the proposed finite size correction of
  Cho et al., see references below.

## Related documentation in the C library

[`static_power_law_game()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_static_power_law_game)
