# Find mutual edges in a directed graph

**\[deprecated\]**

`is.mutual()` was renamed to
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md) to
create a more consistent API.

## Usage

``` r
is.mutual(graph, eids = E(graph), loops = TRUE)
```

## Arguments

- graph:

  The input graph.

- eids:

  Edge sequence, the edges that will be probed. By default is includes
  all edges in the order of their ids.

- loops:

  Logical, whether to consider directed self-loops to be mutual.
