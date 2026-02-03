# Bipartite random graphs

**\[deprecated\]**

`bipartite.random.game()` was renamed to
[`sample_bipartite()`](https://r.igraph.org/reference/sample_bipartite.md)
to create a more consistent API.

## Usage

``` r
bipartite.random.game(
  n1,
  n2,
  type = c("gnp", "gnm"),
  p,
  m,
  directed = FALSE,
  mode = c("out", "in", "all")
)
```

## Arguments

- n1:

  Integer scalar, the number of bottom vertices.

- n2:

  Integer scalar, the number of top vertices.

- type:

  Character scalar, the type of the graph, ‘gnp’ creates a \\G(n,p)\\
  graph, ‘gnm’ creates a \\G(n,m)\\ graph. See details below.

- p:

  Real scalar, connection probability for \\G(n,p)\\ graphs. Should not
  be given for \\G(n,m)\\ graphs.

- m:

  Integer scalar, the number of edges for \\G(n,m)\\ graphs. Should not
  be given for \\G(n,p)\\ graphs.

- directed:

  Logical scalar, whether to create a directed graph. See also the
  `mode` argument.

- mode:

  Character scalar, specifies how to direct the edges in directed
  graphs. If it is ‘out’, then directed edges point from bottom vertices
  to top vertices. If it is ‘in’, edges point from top vertices to
  bottom vertices. ‘out’ and ‘in’ do not generate mutual edges. If this
  argument is ‘all’, then each edge direction is considered
  independently and mutual edges might be generated. This argument is
  ignored for undirected graphs.

## Related documentation in the C library

[`bipartite_game_gnm()`](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_bipartite_game_gnm),
[`bipartite_game_gnp()`](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_bipartite_game_gnp),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
