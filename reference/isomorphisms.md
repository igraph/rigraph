# Calculate all isomorphic mappings between the vertices of two graphs

Calculate all isomorphic mappings between the vertices of two graphs

## Usage

``` r
isomorphisms(graph1, graph2, method = "vf2", ...)
```

## Arguments

- graph1:

  The first graph.

- graph2:

  The second graph.

- method:

  Currently only ‘vf2’ is supported, see
  [`isomorphic()`](https://r.igraph.org/reference/isomorphic.md) for
  details about it and extra arguments.

- ...:

  Extra arguments, passed to the various methods.

## Value

A list of vertex sequences, corresponding to all mappings from the first
graph to the second.

## Related documentation in the C library

[`get_isomorphisms_vf2()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_get_isomorphisms_vf2),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)
