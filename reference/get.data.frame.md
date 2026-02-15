# Creating igraph graphs from data frames or vice-versa

**\[deprecated\]**

`get.data.frame()` was renamed to
[`as_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md)
to create a more consistent API.

## Usage

``` r
get.data.frame(x, what = c("edges", "vertices", "both"))
```

## Arguments

- x:

  An igraph object.

- what:

  Character constant, whether to return info about vertices, edges, or
  both. The default is ‘edges’.

## Related documentation in the C library

[`get_edgelist`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
