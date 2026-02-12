# Maximum flow in a graph

**\[deprecated\]**

`graph.maxflow()` was renamed to
[`max_flow()`](https://r.igraph.org/reference/max_flow.md) to create a
more consistent API.

## Usage

``` r
graph.maxflow(graph, source, target, capacity = NULL)
```

## Arguments

- graph:

  The input graph.

- source:

  The id of the source vertex.

- target:

  The id of the target vertex (sometimes also called sink).

- capacity:

  Vector giving the capacity of the edges. If this is `NULL` (the
  default) then the `capacity` edge attribute is used. Note that the
  `weight` edge attribute is not used by this function.
