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

## Related documentation in the C library

[`create()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify)
