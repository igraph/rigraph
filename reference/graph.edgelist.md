# Create a graph from an edge list matrix

**\[deprecated\]**

`graph.edgelist()` was renamed to
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md)
to create a more consistent API.

## Usage

``` r
graph.edgelist(el, directed = TRUE)
```

## Arguments

- el:

  The edge list, a two column matrix, character or numeric.

- directed:

  Whether to create a directed graph.
