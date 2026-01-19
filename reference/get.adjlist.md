# Adjacency lists

**\[deprecated\]**

`get.adjlist()` was renamed to
[`as_adj_list()`](https://r.igraph.org/reference/as_adj_list.md) to
create a more consistent API.

## Usage

``` r
get.adjlist(
  graph,
  mode = c("all", "out", "in", "total"),
  loops = c("twice", "once", "ignore"),
  multiple = TRUE
)
```

## Arguments

- graph:

  The input graph.

- mode:

  Character scalar, it gives what kind of adjacent edges/vertices to
  include in the lists. ‘`out`’ is for outgoing edges/vertices, ‘`in`’
  is for incoming edges/vertices, ‘`all`’ is for both. This argument is
  ignored for undirected graphs.

- loops:

  Character scalar, one of `"ignore"` (to omit loops), `"twice"` (to
  include loop edges twice) and `"once"` (to include them once).
  `"twice"` is not allowed for directed graphs and will be replaced with
  `"once"`.

- multiple:

  Logical scalar, set to `FALSE` to use only one representative of each
  set of parallel edges.
