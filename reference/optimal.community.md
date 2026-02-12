# Optimal community structure

**\[deprecated\]**

`optimal.community()` was renamed to
[`cluster_optimal()`](https://r.igraph.org/reference/cluster_optimal.md)
to create a more consistent API.

## Usage

``` r
optimal.community(graph, weights = NULL)
```

## Arguments

- graph:

  The input graph. It may be undirected or directed.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.
