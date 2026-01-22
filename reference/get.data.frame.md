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

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
