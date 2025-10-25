# Create a random regular graph

**\[deprecated\]**

`k.regular.game()` was renamed to
[`sample_k_regular()`](https://r.igraph.org/reference/sample_k_regular.md)
to create a more consistent API.

## Usage

``` r
k.regular.game(no.of.nodes, k, directed = FALSE, multiple = FALSE)
```

## Arguments

- no.of.nodes:

  Integer scalar, the number of vertices in the generated graph.

- k:

  Integer scalar, the degree of each vertex in the graph, or the
  out-degree and in-degree in a directed graph.

- directed:

  Logical scalar, whether to create a directed graph.

- multiple:

  Logical scalar, whether multiple edges are allowed.
