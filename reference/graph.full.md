# Create a full graph

**\[deprecated\]**

`graph.full()` was renamed to
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md)
to create a more consistent API.

## Usage

``` r
graph.full(n, directed = FALSE, loops = FALSE)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether to create a directed graph.

- loops:

  Whether to add self-loops to the graph.

## Related documentation in the C library

[`full`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_full)
