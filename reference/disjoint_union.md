# Disjoint union of graphs

The union of two or more graphs are created. The graphs are assumed to
have disjoint vertex sets.

## Usage

``` r
disjoint_union(...)

x %du% y
```

## Arguments

- ...:

  Graph objects or lists of graph objects.

- x, y:

  Graph objects.

## Value

A new graph object.

## Details

`disjoint_union()` creates a union of two or more disjoint graphs. Thus
first the vertices in the second, third, etc. graphs are relabeled to
have completely disjoint graphs. Then a simple union is created. This
function can also be used via the `%du%` operator.

`disjoint_union()` handles graph, vertex and edge attributes. In
particular, it merges vertex and edge attributes using the
[`vctrs::vec_c()`](https://vctrs.r-lib.org/reference/vec_c.html)
function. For graphs that lack some vertex/edge attribute, the
corresponding values in the new graph are set to a missing value (`NA`
for scalar attributes, `NULL` for list attributes). Graph attributes are
simply copied to the result. If this would result a name clash, then
they are renamed by adding suffixes: \_1, \_2, etc.

Note that if both graphs have vertex names (i.e. a `name` vertex
attribute), then the concatenated vertex names might be non-unique in
the result. A warning is given if this happens.

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
## A star and a ring
g1 <- make_star(10, mode = "undirected")
V(g1)$name <- letters[1:10]
g2 <- make_ring(10)
V(g2)$name <- letters[11:20]
print_all(g1 %du% g2)
#> IGRAPH 02ee952 UN-- 20 19 -- 
#> + attr: name_1 (g/c), name_2 (g/c), mode (g/c), center (g/n), mutual
#> | (g/l), circular (g/l), name (v/c)
#> + edges from 02ee952 (vertex names):
#>  [1] a--b a--c a--d a--e a--f a--g a--h a--i a--j k--l l--m m--n n--o o--p p--q
#> [16] q--r r--s s--t k--t
```
