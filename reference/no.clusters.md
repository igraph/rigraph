# Connected components of a graph

**\[deprecated\]**

`no.clusters()` was renamed to
[`count_components()`](https://r.igraph.org/reference/components.md) to
create a more consistent API.

## Usage

``` r
no.clusters(graph, mode = c("weak", "strong"))
```

## Arguments

- graph:

  The graph to analyze.

- mode:

  Character string, either “weak” or “strong”. For directed graphs
  “weak” implies weakly, “strong” strongly connected components to
  search. It is ignored for undirected graphs.
