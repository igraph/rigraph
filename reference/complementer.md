# Complementer of a graph

A complementer graph contains all edges that were not present in the
input graph.

## Usage

``` r
complementer(graph, loops = FALSE)
```

## Arguments

- graph:

  The input graph, can be directed or undirected.

- loops:

  Logical constant, whether to generate loop edges.

## Value

A new graph object.

## Details

`complementer()` creates the complementer of a graph. Only edges which
are *not* present in the original graph will be included in the new
graph.

`complementer()` keeps graph and vertex attriubutes, edge attributes are
lost.

## Related documentation in the C library

[`complementer()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_complementer)

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
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

## Complementer of a ring
g <- make_ring(10)
complementer(g)
#> ── <igraph> Ring graph ────────────────────────────────────────────── a35d5f9 ──
#> ℹ undirected
#> ℹ 10 vertices · 35 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 9   1 ─ 8   1 ─ 7   1 ─ 6   1 ─ 5   1 ─ 4   1 ─ 3   2 ─ 10  2 ─ 9  
#> [10] 2 ─ 8   2 ─ 7   2 ─ 6   2 ─ 5   2 ─ 4   3 ─ 10  3 ─ 9   3 ─ 8   3 ─ 7  
#> [19] 3 ─ 6   3 ─ 5   4 ─ 10  4 ─ 9   4 ─ 8   4 ─ 7   4 ─ 6   5 ─ 10  5 ─ 9  
#> [28] 5 ─ 8   5 ─ 7   6 ─ 10  6 ─ 9   6 ─ 8   7 ─ 10  7 ─ 9   8 ─ 10 

## A graph and its complementer give together the full graph
g <- make_ring(10)
gc <- complementer(g)
gu <- union(g, gc)
gu
#> ── <igraph> ───────────────────────────────────────────────────────── b148af3 ──
#> ℹ undirected
#> ℹ 10 vertices · 45 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name_1 <chr>, name_2 <chr>, mutual_1 <lgl>, mutual_2 <lgl>, circular_1 <lgl>, circular_2 <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 9 ─ 10  8 ─ 10  8 ─ 9   7 ─ 10  7 ─ 9   7 ─ 8   6 ─ 10  6 ─ 9   6 ─ 8  
#> [10] 6 ─ 7   5 ─ 10  5 ─ 9   5 ─ 8   5 ─ 7   5 ─ 6   4 ─ 10  4 ─ 9   4 ─ 8  
#> [19] 4 ─ 7   4 ─ 6   4 ─ 5   3 ─ 10  3 ─ 9   3 ─ 8   3 ─ 7   3 ─ 6   3 ─ 5  
#> [28] 3 ─ 4   2 ─ 10  2 ─ 9   2 ─ 8   2 ─ 7   2 ─ 6   2 ─ 5   2 ─ 4   2 ─ 3  
#> [37] 1 ─ 10  1 ─ 9   1 ─ 8   1 ─ 7   1 ─ 6   1 ─ 5   1 ─ 4   1 ─ 3   1 ─ 2  
isomorphic(gu, make_full_graph(vcount(g)))
#> [1] TRUE
```
