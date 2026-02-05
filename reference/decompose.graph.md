# Decompose a graph into components

**\[deprecated\]**

`decompose.graph()` was renamed to
[`decompose()`](https://r.igraph.org/reference/decompose.md) to create a
more consistent API.

## Usage

``` r
decompose.graph(
  graph,
  mode = c("weak", "strong"),
  max.comps = NA,
  min.vertices = 0
)
```

## Arguments

- graph:

  The original graph.

- mode:

  Character constant giving the type of the components, wither `weak`
  for weakly connected components or `strong` for strongly connected
  components.

- max.comps:

  The maximum number of components to return. The first `max.comps`
  components will be returned (which hold at least `min.vertices`
  vertices, see the next parameter), the others will be ignored. Supply
  `NA` here if you don't want to limit the number of components.

- min.vertices:

  The minimum number of vertices a component should contain in order to
  place it in the result list. E.g. supply 2 here to ignore isolate
  vertices.

## Related documentation in the C library

[[`decompose()`](https://r.igraph.org/reference/decompose.md)](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_decompose)
