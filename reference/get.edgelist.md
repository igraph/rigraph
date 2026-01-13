# Convert a graph to an edge list

**\[deprecated\]**

`get.edgelist()` was renamed to
[`as_edgelist()`](https://r.igraph.org/reference/as_edgelist.md) to
create a more consistent API.

## Usage

``` r
get.edgelist(graph, names = TRUE)
```

## Arguments

- graph:

  The graph to convert.

- names:

  Whether to return a character matrix containing vertex names (i.e. the
  `name` vertex attribute) if they exist or numeric vertex ids.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
