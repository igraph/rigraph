# Create a ring graph

A ring is a one-dimensional lattice and this function is a special case
of [`make_lattice()`](https://r.igraph.org/reference/make_lattice.md).

## Usage

``` r
make_ring(n, directed = FALSE, mutual = FALSE, circular = TRUE)

ring(...)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether the graph is directed.

- mutual:

  Whether directed edges are mutual. It is ignored in undirected graphs.

- circular:

  Whether to create a circular ring. A non-circular ring is essentially
  a “line”: a tree where every non-leaf vertex has one child.

- ...:

  Passed to `make_ring()`.

## Value

An igraph graph.

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
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md)

## Examples

``` r
print_all(make_ring(10))
#> IGRAPH 83cef48 U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + graph attributes:
#> | + name:
#> |   [1] "Ring graph"
#> | + mutual:
#> |   [1] FALSE
#> | + circular:
#> |   [1] TRUE
#> + edges from 83cef48:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
print_all(make_ring(10, directed = TRUE, mutual = TRUE))
#> IGRAPH a9d90fc D--- 10 20 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + graph attributes:
#> | + name:
#> |   [1] "Ring graph"
#> | + mutual:
#> |   [1] TRUE
#> | + circular:
#> |   [1] TRUE
#> + edges from a9d90fc:
#>  [1]  1-> 2  2-> 1  2-> 3  3-> 2  3-> 4  4-> 3  4-> 5  5-> 4  5-> 6  6-> 5
#> [11]  6-> 7  7-> 6  7-> 8  8-> 7  8-> 9  9-> 8  9->10 10-> 9 10-> 1  1->10
```
