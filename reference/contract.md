# Contract several vertices into a single one

This function creates a new graph, by merging several vertices into one.
The vertices in the new graph correspond to sets of vertices in the
input graph.

## Usage

``` r
contract(graph, mapping, vertex.attr.comb = igraph_opt("vertex.attr.comb"))
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- mapping:

  A numeric vector that specifies the mapping. Its elements correspond
  to the vertices, and for each element the id in the new graph is
  given.

- vertex.attr.comb:

  Specifies how to combine the vertex attributes in the new graph.
  Please see
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details.

## Value

A new graph object.

## Details

The attributes of the graph are kept. Graph and edge attributes are
unchanged, vertex attributes are combined, according to the
`vertex.attr.comb` parameter.

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
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
[`permute()`](https://r.igraph.org/reference/permute.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`contract_vertices()`](https://igraph.org/c/html/latest/igraph-Operators.html#igraph_contract_vertices).

## Examples

``` r
g <- make_ring(10)
g$name <- "Ring"
V(g)$name <- letters[1:vcount(g)]
E(g)$weight <- runif(ecount(g))

g2 <- contract(g, rep(1:5, each = 2),
  vertex.attr.comb = toString
)

## graph and edge attributes are kept, vertex attributes are
## combined using the 'toString' function.
print(g2, g = TRUE, v = TRUE, e = TRUE)
#> IGRAPH 64c44c5 UNW- 5 10 -- Ring
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c), weight
#> | (e/n)
#> + edges from 64c44c5 (vertex names):
#>  [1] a, b--a, b a, b--c, d c, d--c, d c, d--e, f e, f--e, f e, f--g, h
#>  [7] g, h--g, h g, h--i, j i, j--i, j a, b--i, j
```
