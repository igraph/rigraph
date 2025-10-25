# K-core decomposition of graphs

**\[deprecated\]**

`graph.coreness()` was renamed to
[`coreness()`](https://r.igraph.org/reference/coreness.md) to create a
more consistent API.

## Usage

``` r
graph.coreness(graph, mode = c("all", "out", "in"))
```

## Arguments

- graph:

  The input graph, it can be directed or undirected

- mode:

  The type of the core in directed graphs. Character constant, possible
  values: `in`: in-cores are computed, `out`: out-cores are computed,
  `all`: the corresponding undirected graph is considered. This argument
  is ignored for undirected graphs.
