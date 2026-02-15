# Connected components of a graph

**\[deprecated\]**

`clusters()` was renamed to
[`components()`](https://r.igraph.org/reference/components.md) to create
a more consistent API.

## Usage

``` r
clusters(graph, mode = c("weak", "strong"))
```

## Arguments

- graph:

  The graph to analyze.

- mode:

  Character string, either “weak” or “strong”. For directed graphs
  “weak” implies weakly, “strong” strongly connected components to
  search. It is ignored for undirected graphs.

## Related documentation in the C library

[`connected_components`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_connected_components),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
