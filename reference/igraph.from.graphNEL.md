# Convert graphNEL objects from the graph package to igraph

**\[deprecated\]**

`igraph.from.graphNEL()` was renamed to
[`graph_from_graphnel()`](https://r.igraph.org/reference/graph_from_graphnel.md)
to create a more consistent API.

## Usage

``` r
igraph.from.graphNEL(graphNEL, name = TRUE, weight = TRUE, unlist.attrs = TRUE)
```

## Arguments

- graphNEL:

  The graphNEL graph.

- name:

  Logical scalar, whether to add graphNEL vertex names as an igraph
  vertex attribute called ‘`name`’.

- weight:

  Logical scalar, whether to add graphNEL edge weights as an igraph edge
  attribute called ‘`weight`’. (graphNEL graphs are always weighted.)

- unlist.attrs:

  Logical scalar. graphNEL attribute query functions return the values
  of the attributes in R lists, if this argument is `TRUE` (the default)
  these will be converted to atomic vectors, whenever possible, before
  adding them to the igraph graph.

## Related documentation in the C library

[`adjlist()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_adjlist),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)
