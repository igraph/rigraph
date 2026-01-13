# Create a circulant graph

A circulant graph \\C_n^{\textrm{shifts}}\\ consists of \\n\\ vertices
\\v_0, \ldots, v\_{n-1}\\ such that for each \\s_i\\ in the list of
offsets `shifts`, \\v_j\\ is connected to \\v\_{(j + s_i) \mod n}\\ for
all \\j\\.

## Usage

``` r
make_circulant(n, shifts, directed = FALSE)

circulant(n, shifts, directed = FALSE)
```

## Arguments

- n:

  Integer, the number of vertices in the circulant graph.

- shifts:

  Integer vector, a list of the offsets within the circulant graph.

- directed:

  Boolean, whether to create a directed graph.

## Value

An igraph graph.

## Details

The function can generate either directed or undirected graphs. It does
not generate multi-edges or self-loops.

## Related documentation in the C library

[`circulant()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_circulant)

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
# Create a circulant graph with 10 vertices and shifts 1 and 3
g <- make_circulant(10, c(1, 3))
plot(g, layout = layout_in_circle)


# A directed circulant graph
g2 <- make_circulant(10, c(1, 3), directed = TRUE)
plot(g2, layout = layout_in_circle)
```
