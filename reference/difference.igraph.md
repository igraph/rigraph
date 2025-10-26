# Difference of graphs

The difference of two graphs are created.

## Usage

``` r
# S3 method for class 'igraph'
difference(big, small, byname = "auto", ...)
```

## Arguments

- big:

  The left hand side argument of the minus operator. A directed or
  undirected graph.

- small:

  The right hand side argument of the minus operator. A directed ot
  undirected graph.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if both graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and one graph, but not both graphs are named.

- ...:

  Ignored, included for S3 compatibility.

## Value

A new graph object.

## Details

[`difference()`](https://r.igraph.org/reference/difference.md) creates
the difference of two graphs. Only edges present in the first graph but
not in the second will be be included in the new graph. The
corresponding operator is `%m%`.

If the `byname` argument is `TRUE` (or `auto` and the graphs are all
named), then the operation is performed based on symbolic vertex names.
Otherwise numeric vertex ids are used.

[`difference()`](https://r.igraph.org/reference/difference.md) keeps all
attributes (graph, vertex and edge) of the first graph.

Note that `big` and `small` must both be directed or both be undirected,
otherwise an error message is given.

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

## Examples

``` r
## Create a wheel graph
wheel <- union(
  make_ring(10),
  make_star(11, center = 11, mode = "undirected")
)
V(wheel)$name <- letters[seq_len(vcount(wheel))]

## Subtract a star graph from it
sstar <- make_star(6, center = 6, mode = "undirected")
V(sstar)$name <- letters[c(1, 3, 5, 7, 9, 11)]
G <- wheel %m% sstar
print_all(G)
#> IGRAPH 4357e3c UN-- 11 15 -- 
#> + attr: name_1 (g/c), name_2 (g/c), mutual (g/l), circular (g/l), mode
#> | (g/c), center (g/n), name (v/c)
#> + edges (vertex names):
#> a -- b, j
#> b -- a, c, k
#> c -- b, d
#> d -- c, e, k
#> e -- d, f
#> f -- e, g, k
#> g -- f, h
#> h -- g, i, k
#> i -- h, j
#> j -- a, i, k
#> k -- b, d, f, h, j
plot(G, layout = layout_nicely(wheel))
```
