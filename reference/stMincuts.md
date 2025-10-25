# List all minimum \\(s,t)\\-cuts of a graph

**\[deprecated\]**

`stMincuts()` was renamed to
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md) to
create a more consistent API.

## Usage

``` r
stMincuts(graph, source, target, capacity = NULL)
```

## Arguments

- graph:

  The input graph. It must be directed.

- source:

  The id of the source vertex.

- target:

  The id of the target vertex.

- capacity:

  Numeric vector giving the edge capacities. If this is `NULL` and the
  graph has a `weight` edge attribute, then this attribute defines the
  edge capacities. For forcing unit edge capacities, even for graphs
  that have a `weight` edge attribute, supply `NA` here.
