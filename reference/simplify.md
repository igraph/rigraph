# Simple graphs

Simple graphs are graphs which do not contain loop and multiple edges.

## Usage

``` r
simplify(
  graph,
  remove.multiple = TRUE,
  remove.loops = TRUE,
  edge.attr.comb = igraph_opt("edge.attr.comb")
)

is_simple(graph)

simplify_and_colorize(graph)
```

## Arguments

- graph:

  The graph to work on.

- remove.multiple:

  Logical, whether the multiple edges are to be removed.

- remove.loops:

  Logical, whether the loop edges are to be removed.

- edge.attr.comb:

  Specifies what to do with edge attributes, if `remove.multiple=TRUE`.
  In this case many edges might be mapped to a single one in the new
  graph, and their attributes are combined. Please see
  [`attribute.combination()`](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for details on this.

## Value

a new graph object with the edges deleted.

## Details

A loop edge is an edge for which the two endpoints are the same vertex.
Two edges are multiple edges if they have exactly the same two endpoints
(for directed graphs order does matter). A graph is simple is it does
not contain loop edges and multiple edges.

`is_simple()` checks whether a graph is simple.

`simplify()` removes the loop and/or multiple edges from a graph. If
both `remove.loops` and `remove.multiple` are `TRUE` the function
returns a simple graph.

`simplify_and_colorize()` constructs a new, simple graph from a graph
and also sets a `color` attribute on both the vertices and the edges.
The colors of the vertices represent the number of self-loops that were
originally incident on them, while the colors of the edges represent the
multiplicities of the same edges in the original graph. This allows one
to take into account the edge multiplicities and the number of loop
edges in the VF2 isomorphism algorithm. Other graph, vertex and edge
attributes from the original graph are discarded as the primary purpose
of this function is to facilitate the usage of multigraphs with the VF2
algorithm.

## Related documentation in the C library

[`simplify()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[`is_simple()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_is_simple),
[`simplify_and_colorize()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_simplify_and_colorize),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

[`which_loop()`](https://r.igraph.org/reference/which_multiple.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md)
and
[`count_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md),
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md)

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
[`transitive_closure()`](https://r.igraph.org/reference/transitive_closure.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_graph(c(1, 2, 1, 2, 3, 3))
is_simple(g)
#> [1] FALSE
is_simple(simplify(g, remove.loops = FALSE))
#> [1] FALSE
is_simple(simplify(g, remove.multiple = FALSE))
#> [1] FALSE
is_simple(simplify(g))
#> [1] TRUE
```
