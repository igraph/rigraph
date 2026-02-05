# Make a new graph

This is a generic function for creating graphs.

## Usage

``` r
make_(...)
```

## Arguments

- ...:

  Parameters, see details below.

## Details

`make_()` is a generic function for creating graphs. For every graph
constructor in igraph that has a `make_` prefix, there is a
corresponding function without the prefix: e.g. for
[`make_ring()`](https://r.igraph.org/reference/make_ring.md) there is
also [`ring()`](https://r.igraph.org/reference/make_ring.md), etc.

The same is true for the random graph samplers, i.e. for each
constructor with a `sample_` prefix, there is a corresponding function
without that prefix.

These shorter forms can be used together with `make_()`. The advantage
of this form is that the user can specify constructor modifiers which
work with all constructors. E.g. the
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md)
modifier adds vertex attributes to the newly created graphs.

See the examples and the various constructor modifiers below.

## Related documentation in the C library

[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
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
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

Constructor modifiers (and related functions)
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
r <- make_(ring(10))
l <- make_(lattice(c(3, 3, 3)))

r2 <- make_(ring(10), with_vertex_(color = "red", name = LETTERS[1:10]))
l2 <- make_(lattice(c(3, 3, 3)), with_edge_(weight = 2))

ran <- sample_(degseq(c(3, 3, 3, 3, 3, 3), method = "configuration"), simplified())
degree(ran)
#> [1] 3 3 3 3 3 3
is_simple(ran)
#> [1] TRUE
```
