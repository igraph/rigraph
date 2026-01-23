# Create an extended chordal ring graph

`make_chordal_ring()` creates an extended chordal ring. An extended
chordal ring is regular graph, each node has the same degree. It can be
obtained from a simple ring by adding some extra edges specified by a
matrix. Let p denote the number of columns in the ‘`W`’ matrix. The
extra edges of vertex `i` are added according to column `i mod p` in
‘`W`’. The number of extra edges is the number of rows in ‘`W`’: for
each row `j` an edge `i->i+w[ij]` is added if `i+w[ij]` is less than the
number of total nodes. See also Kotsis, G: Interconnection Topologies
for Parallel Processing Systems, PARS Mitteilungen 11, 1-6, 1993.

## Usage

``` r
make_chordal_ring(n, w, directed = FALSE)

chordal_ring(n, w, directed = FALSE)
```

## Arguments

- n:

  The number of vertices.

- w:

  A matrix which specifies the extended chordal ring. See details below.

- directed:

  Logical scalar, whether or not to create a directed graph.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
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
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Examples

``` r
chord <- make_chordal_ring(
  15,
  matrix(c(3, 12, 4, 7, 8, 11), nr = 2)
)
```
