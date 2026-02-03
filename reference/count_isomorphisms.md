# Count the number of isomorphic mappings between two graphs

Count the number of isomorphic mappings between two graphs

## Usage

``` r
count_isomorphisms(graph1, graph2, method = "vf2", ...)
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

  Passed to the individual methods.

## Value

Number of isomorphic mappings between the two graphs.

## Related documentation in the C library

[`count_isomorphisms_vf2()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_count_isomorphisms_vf2),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## References

LP Cordella, P Foggia, C Sansone, and M Vento: An improved algorithm for
matching large graphs, *Proc. of the 3rd IAPR TC-15 Workshop on
Graphbased Representations in Pattern Recognition*, 149–159, 2001.

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)

## Examples

``` r
# colored graph isomorphism
g1 <- make_ring(10)
g2 <- make_ring(10)
isomorphic(g1, g2)
#> [1] TRUE

V(g1)$color <- rep(1:2, length = vcount(g1))
V(g2)$color <- rep(2:1, length = vcount(g2))
# consider colors by default
count_isomorphisms(g1, g2)
#> [1] 10
# ignore colors
count_isomorphisms(g1, g2,
  vertex.color1 = NULL,
  vertex.color2 = NULL
)
#> [1] 20
```
