# A graph with no edges

A graph with no edges

## Usage

``` r
make_empty_graph(n = 0, directed = TRUE)

empty_graph(n = 0, directed = TRUE)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether to create a directed graph.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Related documentation in the C library

[`empty()`](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_empty).

## Examples

``` r
make_empty_graph(n = 10)
#> IGRAPH 8604f84 D--- 10 0 -- 
#> + edges from 8604f84:
make_empty_graph(n = 5, directed = FALSE)
#> IGRAPH e3abfd4 U--- 5 0 -- 
#> + edges from e3abfd4:
```
