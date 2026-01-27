# Permute the vertices of a graph

Create a new graph, by permuting vertex ids.

## Usage

``` r
permute(graph, permutation)
```

## Arguments

- graph:

  The input graph, it can directed or undirected.

- permutation:

  A numeric vector giving the permutation to apply. The first element is
  the new id of vertex 1, etc. Every number between one and
  `vcount(graph)` must appear exactly once.

## Value

A new graph object.

## Details

This function creates a new graph from the input graph by permuting its
vertices according to the specified mapping. Call this function with the
output of
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)
to create the canonical form of a graph.

`permute()` keeps all graph, vertex and edge attributes of the graph.

## See also

[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md)

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`contract()`](https://r.igraph.org/reference/contract.md),
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md),
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md),
[`difference()`](https://r.igraph.org/reference/difference.md),
[`difference.igraph()`](https://r.igraph.org/reference/difference.igraph.md),
[`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md),
[`edge()`](https://r.igraph.org/reference/edge.md),
[`igraph-minus`](https://r.igraph.org/reference/igraph-minus.md),
[`intersection()`](https://r.igraph.org/reference/intersection.md),
[`intersection.igraph()`](https://r.igraph.org/reference/intersection.igraph.md),
[`path()`](https://r.igraph.org/reference/path.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`permute_vertices()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_permute_vertices).

## Examples

``` r
# Random permutation of a random graph
g <- sample_gnm(20, 50)
g2 <- permute(g, sample(vcount(g)))
isomorphic(g, g2)
#> [1] TRUE

# Permutation keeps all attributes
g$name <- "Random graph, Gnm, 20, 50"
V(g)$name <- letters[1:vcount(g)]
E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)
g2 <- permute(g, sample(vcount(g)))
isomorphic(g, g2)
#> [1] TRUE
g2$name
#> [1] "Random graph, Gnm, 20, 50"
V(g2)$name
#>  [1] "l" "p" "a" "b" "j" "r" "g" "f" "q" "h" "i" "k" "c" "d" "m" "o" "t" "e" "n"
#> [20] "s"
E(g2)$weight
#>  [1] 4 1 1 5 4 4 4 5 4 4 3 3 2 3 3 2 5 3 1 3 4 4 4 5 3 1 5 1 2 2 2 4 4 5 4 2 1 5
#> [39] 1 1 5 3 1 4 4 3 1 1 1 3
all(sort(E(g2)$weight) == sort(E(g)$weight))
#> [1] TRUE
```
