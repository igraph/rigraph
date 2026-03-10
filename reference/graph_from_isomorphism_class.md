# Create a graph from an isomorphism class

The isomorphism class is a non-negative integer number. Graphs (with the
same number of vertices) having the same isomorphism class are
isomorphic and isomorphic graphs always have the same isomorphism class.
Currently it can handle directed graphs with 3 or 4 vertices and
undirected graphd with 3 to 6 vertices.

## Usage

``` r
graph_from_isomorphism_class(size, number, directed = TRUE)
```

## Arguments

- size:

  The number of vertices in the graph.

- number:

  The isomorphism class.

- directed:

  Whether to create a directed graph (the default).

## Value

An igraph object, the graph of the given size, directedness and
isomorphism class.

## Related documentation in the C library

[`isoclass_create()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_isoclass_create)

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)
