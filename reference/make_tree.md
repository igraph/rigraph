# Create tree graphs

Create a k-ary tree graph, where almost all vertices other than the
leaves have the same number of children.

## Usage

``` r
make_tree(n, children = 2, mode = c("out", "in", "undirected"))

tree(...)
```

## Arguments

- n:

  Number of vertices.

- children:

  Integer scalar, the number of children of a vertex (except for leafs)

- mode:

  Defines the direction of the edges. `out` indicates that the edges
  point from the parent to the children, `in` indicates that they point
  from the children to their parents, while `undirected` creates an
  undirected graph.

- ...:

  Passed to `make_tree()` or
  [`sample_tree()`](https://r.igraph.org/reference/sample_tree.md).

## Value

An igraph graph

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md)

## Examples

``` r
make_tree(10, 2)
#> IGRAPH 691f152 D--- 10 9 -- Tree
#> + attr: name (g/c), children (g/n), mode (g/c)
#> + edges from 691f152:
#> [1] 1-> 2 1-> 3 2-> 4 2-> 5 3-> 6 3-> 7 4-> 8 4-> 9 5->10
make_tree(10, 3, mode = "undirected")
#> IGRAPH 2fa456a U--- 10 9 -- Tree
#> + attr: name (g/c), children (g/n), mode (g/c)
#> + edges from 2fa456a:
#> [1] 1-- 2 1-- 3 1-- 4 2-- 5 2-- 6 2-- 7 3-- 8 3-- 9 3--10
```
