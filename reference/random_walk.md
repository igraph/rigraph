# Random walk on a graph

`random_walk()` performs a random walk on the graph and returns the
vertices that the random walk passed through. `random_edge_walk()` is
the same but returns the edges that that random walk passed through.

## Usage

``` r
random_walk(
  graph,
  start,
  steps,
  weights = NULL,
  mode = c("out", "in", "all", "total"),
  stuck = c("return", "error")
)

random_edge_walk(
  graph,
  start,
  steps,
  weights = NULL,
  mode = c("out", "in", "all", "total"),
  stuck = c("return", "error")
)
```

## Arguments

- graph:

  The input graph, might be undirected or directed.

- start:

  The start vertex.

- steps:

  The number of steps to make.

- weights:

  The edge weights. Larger edge weights increase the probability that an
  edge is selected by the random walker. In other words, larger edge
  weights correspond to stronger connections. The ‘weight’ edge
  attribute is used if present. Supply ‘`NA`’ here if you want to ignore
  the ‘weight’ edge attribute.

- mode:

  How to follow directed edges. `"out"` steps along the edge direction,
  `"in"` is opposite to that. `"all"` ignores edge directions. This
  argument is ignored for undirected graphs.

- stuck:

  What to do if the random walk gets stuck. `"return"` returns the
  partial walk, `"error"` raises an error.

## Value

For `random_walk()`, a vertex sequence of length `steps + 1` containing
the vertices along the walk, starting with `start`. For
`random_edge_walk()`, an edge sequence of length `steps` containing the
edges along the walk.

## Details

Do a random walk. From the given start vertex, take the given number of
steps, choosing an edge from the actual vertex uniformly randomly. Edge
directions are observed in directed graphs (see the `mode` argument as
well). Multiple and loop edges are also observed.

For igraph \< 1.6.0, `random_walk()` counted steps differently, and
returned a sequence of length `steps` instead of `steps + 1`. This has
changed to improve consistency with the underlying C library.

## Related documentation in the C library

[`random_walk()`](https://igraph.org/c/html/0.10.17/igraph-Visitors.html#igraph_random_walk).

## Examples

``` r
## Stationary distribution of a Markov chain
g <- make_ring(10, directed = TRUE) %u%
  make_star(11, center = 11) + edge(11, 1)

ec <- eigen_centrality(g, directed = TRUE)$vector
pg <- page_rank(g, damping = 0.999)$vector
w <- random_walk(g, start = 1, steps = 10000)

## These are similar, but not exactly the same
cor(table(w), ec)
#> [1] 0.9618877

## But these are (almost) the same
cor(table(w), pg)
#> [1] 0.9998887
```
