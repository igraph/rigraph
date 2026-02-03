# Sample stochastic block model

**\[deprecated\]**

`sbm.game()` was renamed to
[`sample_sbm()`](https://r.igraph.org/reference/sample_sbm.md) to create
a more consistent API.

## Usage

``` r
sbm.game(n, pref.matrix, block.sizes, directed = FALSE, loops = FALSE)
```

## Arguments

- n:

  Number of vertices in the graph.

- pref.matrix:

  The matrix giving the Bernoulli rates. This is a \\K\times K\\ matrix,
  where \\K\\ is the number of groups. The probability of creating an
  edge between vertices from groups \\i\\ and \\j\\ is given by element
  \\(i,j)\\. For undirected graphs, this matrix must be symmetric.

- block.sizes:

  Numeric vector giving the number of vertices in each group. The sum of
  the vector must match the number of vertices.

- directed:

  Logical scalar, whether to create a directed graph.

- loops:

  Logical scalar, whether self-loops are allowed in the graph.

## Related documentation in the C library

[`sbm_game()`](https://igraph.org/c/html/latest/igraph-Games.html#igraph_sbm_game)
