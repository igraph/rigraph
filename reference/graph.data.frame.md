# Creating igraph graphs from data frames or vice-versa

**\[deprecated\]**

`graph.data.frame()` was renamed to
[`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
to create a more consistent API.

## Usage

``` r
graph.data.frame(d, directed = TRUE, vertices = NULL)
```

## Arguments

- d:

  A data frame containing a symbolic edge list in the first two columns.
  Additional columns are considered as edge attributes. Since version
  0.7 this argument is coerced to a data frame with `as.data.frame`.

- directed:

  Logical scalar, whether or not to create a directed graph.

- vertices:

  A data frame with vertex metadata, or `NULL`. See details below. Since
  version 0.7 this argument is coerced to a data frame with
  `as.data.frame`, if not `NULL`.

## Related documentation in the C library

[`add_vertices`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_add_vertices),
[`empty`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
