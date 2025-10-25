# Intersection of graphs

The intersection of two or more graphs are created. The graphs may have
identical or overlapping vertex sets.

## Usage

``` r
# S3 method for class 'igraph'
intersection(..., byname = "auto", keep.all.vertices = TRUE)
```

## Arguments

- ...:

  Graph objects or lists of graph objects.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if all graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and some (but not all) graphs are named.

- keep.all.vertices:

  Logical scalar, whether to keep vertices that only appear in a subset
  of the input graphs.

## Value

A new graph object.

## Details

[`intersection()`](https://r.igraph.org/reference/intersection.md)
creates the intersection of two or more graphs: only edges present in
all graphs will be included. The corresponding operator is `%s%`.

If the `byname` argument is `TRUE` (or `auto` and all graphs are named),
then the operation is performed on symbolic vertex names instead of the
internal numeric vertex ids.

[`intersection()`](https://r.igraph.org/reference/intersection.md) keeps
the attributes of all graphs. All graph, vertex and edge attributes are
copied to the result. If an attribute is present in multiple graphs and
would result a name clash, then this attribute is renamed by adding
suffixes: \_1, \_2, etc.

The `name` vertex attribute is treated specially if the operation is
performed based on symbolic vertex names. In this case `name` must be
present in all graphs, and it is not renamed in the result graph.

An error is generated if some input graphs are directed and others are
undirected.

## See also

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

## Examples

``` r
## Common part of two social networks
net1 <- graph_from_literal(
  D - A:B:F:G, A - C - F - A, B - E - G - B, A - B, F - G,
  H - F:G, H - I - J
)
net2 <- graph_from_literal(D - A:F:Y, B - A - X - F - H - Z, F - Y)
print_all(net1 %s% net2)
#> IGRAPH c79882e UN-- 13 4 -- 
#> + attr: name (v/c)
#> + vertex attributes:
#> |      name
#> | [1]     D
#> | [2]     A
#> | [3]     B
#> | [4]     F
#> | [5]     G
#> | [6]     C
#> | [7]     E
#> | [8]     H
#> | [9]     I
#> | [10]    J
#> | [11]    Y
#> | [12]    X
#> | [13]    Z
#> + edges from c79882e (vertex names):
#> [1] F--H A--B D--F D--A
```
