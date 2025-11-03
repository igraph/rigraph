# Delete vertices from a graph

Delete vertices from a graph

## Usage

``` r
delete_vertices(graph, v)
```

## Arguments

- graph:

  The input graph.

- v:

  The vertices to remove, a vertex sequence.

## Value

The graph, with the vertices removed.

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

## Examples

``` r
g <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
g
#> IGRAPH 9854198 UN-- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 9854198 (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
V(g)
#> + 10/10 vertices, named, from 9854198:
#>  [1] A B C D E F G H I J

g2 <- delete_vertices(g, c(1, 5)) %>%
  delete_vertices("B")
g2
#> IGRAPH 026f74c UN-- 7 5 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 026f74c (vertex names):
#> [1] C--D F--G G--H H--I I--J
V(g2)
#> + 7/7 vertices, named, from 026f74c:
#> [1] C D F G H I J
```
