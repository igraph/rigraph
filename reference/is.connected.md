# Connected components of a graph

**\[deprecated\]**

`is.connected()` was renamed to
[`is_connected()`](https://r.igraph.org/reference/components.md) to
create a more consistent API.

## Usage

``` r
is.connected(graph, mode = c("weak", "strong"))
```

## Arguments

- graph:

  The graph to analyze.

- mode:

  Character string, either “weak” or “strong”. For directed graphs
  “weak” implies weakly, “strong” strongly connected components to
  search. It is ignored for undirected graphs.
