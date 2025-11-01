# Create a graph from an edge list matrix

`graph_from_edgelist()` creates a graph from an edge list. Its argument
is a two-column matrix, each row defines one edge. If it is a numeric
matrix then its elements are interpreted as vertex ids. If it is a
character matrix then it is interpreted as symbolic vertex names and a
vertex id will be assigned to each name, and also a `name` vertex
attribute will be added.

## Usage

``` r
graph_from_edgelist(el, directed = TRUE)

from_edgelist(...)
```

## Arguments

- el:

  The edge list, a two column matrix, character or numeric.

- directed:

  Whether to create a directed graph.

- ...:

  Passed to `graph_from_edgelist()`.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md)

## Examples

``` r
el <- matrix(c("foo", "bar", "bar", "foobar"), nc = 2, byrow = TRUE)
graph_from_edgelist(el)
#> IGRAPH 1733a50 DN-- 3 2 -- 
#> + attr: name (v/c)
#> + edges from 1733a50 (vertex names):
#> [1] foo->bar    bar->foobar

# Create a ring by hand
graph_from_edgelist(cbind(1:10, c(2:10, 1)))
#> IGRAPH e01ced0 D--- 10 10 -- 
#> + edges from e01ced0:
#>  [1]  1-> 2  2-> 3  3-> 4  4-> 5  5-> 6  6-> 7  7-> 8  8-> 9  9->10 10-> 1
```
