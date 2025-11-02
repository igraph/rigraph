# Compose two graphs as binary relations

Relational composition of two graph.

## Usage

``` r
compose(g1, g2, byname = "auto")
```

## Arguments

- g1:

  The first input graph.

- g2:

  The second input graph.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if both graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and one graph, but not both graphs are named.

## Value

A new graph object.

## Details

`compose()` creates the relational composition of two graphs. The new
graph will contain an (a,b) edge only if there is a vertex c, such that
edge (a,c) is included in the first graph and (c,b) is included in the
second graph. The corresponding operator is `%c%`.

The function gives an error if one of the input graphs is directed and
the other is undirected.

If the `byname` argument is `TRUE` (or `auto` and the graphs are all
named), then the operation is performed based on symbolic vertex names.
Otherwise numeric vertex ids are used.

`compose()` keeps the attributes of both graphs. All graph, vertex and
edge attributes are copied to the result. If an attribute is present in
multiple graphs and would result a name clash, then this attribute is
renamed by adding suffixes: \_1, \_2, etc.

The `name` vertex attribute is treated specially if the operation is
performed based on symbolic vertex names. In this case `name` must be
present in both graphs, and it is not renamed in the result graph.

Note that an edge in the result graph corresponds to two edges in the
input, one in the first graph, one in the second. This mapping is not
injective and several edges in the result might correspond to the same
edge in the first (and/or the second) graph. The edge attributes in the
result graph are updated accordingly.

Also note that the function may generate multigraphs, if there are more
than one way to find edges (a,b) in g1 and (b,c) in g2 for an edge (a,c)
in the result. See
[`simplify()`](https://r.igraph.org/reference/simplify.md) if you want
to get rid of the multiple edges.

The function may create loop edges, if edges (a,b) and (b,a) are present
in g1 and g2, respectively, then (a,a) is included in the result. See
[`simplify()`](https://r.igraph.org/reference/simplify.md) if you want
to get rid of the self-loops.

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
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
[`permute()`](https://r.igraph.org/reference/permute.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`transitive_closure()`](https://r.igraph.org/reference/transitive_closure.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g1 <- make_ring(10)
g2 <- make_star(10, mode = "undirected")
gc <- compose(g1, g2)
print_all(gc)
#> IGRAPH 850d570 U--- 10 36 -- 
#> + attr: name_1 (g/c), name_2 (g/c), mutual (g/l), circular (g/l), mode
#> | (g/c), center (g/n)
#> + edges:
#>  1 --  1  1  1  1  2  3  3  4  4  5  5  6  6  7  7  8  8  9  9 10
#>  2 --  1  2  2  3  4  5  6  7  8  9 10 10
#>  3 --  1  1  2 10
#>  4 --  1  1  2 10
#>  5 --  1  1  2 10
#>  6 --  1  1  2 10
#>  7 --  1  1  2 10
#>  8 --  1  1  2 10
#>  9 --  1  1  2 10
#> 10 --  1  2  2  3  4  5  6  7  8  9 10 10
print_all(simplify(gc))
#> IGRAPH 95f94a5 U--- 10 24 -- 
#> + attr: name_1 (g/c), name_2 (g/c), mutual (g/l), circular (g/l), mode
#> | (g/c), center (g/n)
#> + edges:
#>  1 --  2  3  4  5  6  7  8  9 10    2 --  1  3  4  5  6  7  8  9 10
#>  3 --  1  2 10                      4 --  1  2 10                  
#>  5 --  1  2 10                      6 --  1  2 10                  
#>  7 --  1  2 10                      8 --  1  2 10                  
#>  9 --  1  2 10                     10 --  1  2  3  4  5  6  7  8  9
```
