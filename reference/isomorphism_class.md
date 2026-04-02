# Isomorphism class of a graph

The isomorphism class is a non-negative integer number. Graphs (with the
same number of vertices) having the same isomorphism class are
isomorphic and isomorphic graphs always have the same isomorphism class.
Currently it can handle directed graphs with 3 or 4 vertices and
undirected graphs with 3 to 6 vertices.

## Usage

``` r
isomorphism_class(graph, v)
```

## Arguments

- graph:

  The input graph.

- v:

  Optionally a vertex sequence. If not missing, then an induced subgraph
  of the input graph, consisting of this vertices, is used.

## Value

An integer number.

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)

## Examples

``` r
# create some non-isomorphic graphs
g1 <- graph_from_isomorphism_class(3, 10)
g2 <- graph_from_isomorphism_class(3, 11)
isomorphism_class(g1)
#> [1] 10
isomorphism_class(g2)
#> [1] 11
isomorphic(g1, g2)
#> [1] FALSE
```
