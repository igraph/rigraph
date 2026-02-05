# Create an igraph graph from a list of edges, or a notable graph

**\[deprecated\]**

`graph.famous()` was renamed to
[`make_graph()`](https://r.igraph.org/reference/make_graph.md) to create
a more consistent API.

## Usage

``` r
graph.famous(
  edges,
  ...,
  n = max(edges),
  isolates = NULL,
  directed = TRUE,
  dir = directed,
  simplify = TRUE
)
```

## Arguments

- edges:

  A vector defining the edges, the first edge points from the first
  element to the second, the second edge from the third to the fourth,
  etc. For a numeric vector, these are interpreted as internal vertex
  ids. For character vectors, they are interpreted as vertex names.

  Alternatively, this can be a character scalar, the name of a notable
  graph. See Notable graphs below. The name is case insensitive.

  Starting from igraph 0.8.0, you can also include literals here, via
  igraph's formula notation (see
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)).
  In this case, the first term of the formula has to start with a ‘`~`’
  character, just like regular formulae in R. See examples below.

- ...:

  For [`make_graph()`](https://r.igraph.org/reference/make_graph.md):
  extra arguments for the case when the graph is given via a literal,
  see
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md).
  For [`directed_graph()`](https://r.igraph.org/reference/make_graph.md)
  and
  [`undirected_graph()`](https://r.igraph.org/reference/make_graph.md):
  Passed to
  [`make_directed_graph()`](https://r.igraph.org/reference/make_graph.md)
  or
  [`make_undirected_graph()`](https://r.igraph.org/reference/make_graph.md).

- n:

  The number of vertices in the graph. This argument is ignored (with a
  warning) if `edges` are symbolic vertex names. It is also ignored if
  there is a bigger vertex id in `edges`. This means that for this
  function it is safe to supply zero here if the vertex with the largest
  id is not an isolate.

- isolates:

  Character vector, names of isolate vertices, for symbolic edge lists.
  It is ignored for numeric edge lists.

- directed:

  Whether to create a directed graph.

- dir:

  It is the same as `directed`, for compatibility. Do not give both of
  them.

- simplify:

  For graph literals, whether to simplify the graph.

## Related documentation in the C library

[`create()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
