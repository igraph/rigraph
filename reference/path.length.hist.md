# Shortest (directed or undirected) paths between vertices

**\[deprecated\]**

`path.length.hist()` was renamed to
[`distance_table()`](https://r.igraph.org/reference/distances.md) to
create a more consistent API.

## Usage

``` r
path.length.hist(graph, directed = TRUE)
```

## Arguments

- graph:

  The graph to work on.

- directed:

  Whether to consider directed paths in directed graphs, this argument
  is ignored for undirected graphs.

## Related documentation in the C library

[`path_length_hist()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_path_length_hist)
