# Subgraph of a graph

**\[deprecated\]**

`induced.subgraph()` was renamed to
[`induced_subgraph()`](https://r.igraph.org/reference/subgraph.md) to
create a more consistent API.

## Usage

``` r
induced.subgraph(
  graph,
  vids,
  impl = c("auto", "copy_and_delete", "create_from_scratch")
)
```

## Arguments

- graph:

  The original graph.

- vids:

  Numeric vector, the vertices of the original graph which will form the
  subgraph.

- impl:

  Character scalar, to choose between two implementation of the subgraph
  calculation. ‘`copy_and_delete`’ copies the graph first, and then
  deletes the vertices and edges that are not included in the result
  graph. ‘`create_from_scratch`’ searches for all vertices and edges
  that must be kept and then uses them to create the graph from scratch.
  ‘`auto`’ chooses between the two implementations automatically, using
  heuristics based on the size of the original and the result graph.

## Related documentation in the C library

[`induced_subgraph`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_induced_subgraph),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
