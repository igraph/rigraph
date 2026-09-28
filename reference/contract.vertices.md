# Contract several vertices into a single one

**\[deprecated\]**

`contract.vertices()` was renamed to
[`contract()`](https://r.igraph.org/reference/contract.md) to create a
more consistent API.

## Usage

``` r
contract.vertices(
  graph,
  mapping,
  vertex.attr.comb = igraph_opt("vertex_attr_combine")
)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- mapping:

  A numeric vector that specifies the mapping. Its elements correspond
  to the vertices, and for each element the ID in the new graph is
  given.

## Related documentation in the C library

[`contract_vertices()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_contract_vertices)
