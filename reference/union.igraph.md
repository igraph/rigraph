# Union of graphs

The union of two or more graphs are created. The graphs may have
identical or overlapping vertex sets.

## Usage

``` r
# S3 method for class 'igraph'
union(
  ...,
  byname = "auto",
  graph.attr.comb = igraph_opt("graph.attr.comb"),
  vertex.attr.comb = "rename",
  edge.attr.comb = "rename"
)
```

## Arguments

- ...:

  Graph objects or lists of graph objects.

- byname:

  A Logical, or the character scalar `auto`. Whether to perform the
  operation based on symbolic vertex names. If it is `auto`, that means
  `TRUE` if all graphs are named and `FALSE` otherwise. A warning is
  generated if `auto` and some (but not all) graphs are named.

- graph.attr.comb, vertex.attr.comb, edge.attr.comb:

  Specification for combining clashing graph, vertex and edge
  attributes. `vertex.attr.comb` and `edge.attr.comb` default to
  `"rename"`; `graph.attr.comb` defaults to the `graph.attr.comb` igraph
  option (`"rename"` unless changed via
  [`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)).
  `"rename"` preserves the historical behaviour of appending `_1`, `_2`,
  ... suffixes. See
  [igraph-attribute-combination](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for the available combiners.

## Value

A new graph object.

## Details

[`union()`](https://r.igraph.org/reference/union.md) creates the union
of two or more graphs. Edges which are included in at least one graph
will be part of the new graph. This function can be also used via the
`%u%` operator.

If the `byname` argument is `TRUE` (or `auto` and all graphs are named),
then the operation is performed on symbolic vertex names instead of the
internal numeric vertex IDs.

[`union()`](https://r.igraph.org/reference/union.md) keeps the
attributes of all graphs. All graph, vertex and edge attributes are
copied to the result. By default, if an attribute is present in multiple
graphs and would result in a name clash, that attribute is renamed by
adding suffixes: `_1`, `_2`, etc. Pass `graph.attr.comb`,
`vertex.attr.comb` or `edge.attr.comb` to combine clashing attributes
instead, e.g. by summing or by taking the first non-`NA` value. See
[igraph-attribute-combination](https://r.igraph.org/reference/igraph-attribute-combination.md)
for the available combiners.

The `name` vertex attribute is treated specially if the operation is
performed based on symbolic vertex names. In this case `name` must be
present in all graphs, and it is not renamed in the result graph.

An error is generated if some input graphs are directed and others are
undirected.

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`permute_vertices()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_permute_vertices),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

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
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r

## Union of two social networks with overlapping sets of actors
net1 <- graph_from_literal(
  D - A:B:F:G, A - C - F - A, B - E - G - B, A - B, F - G,
  H - F:G, H - I - J
)
net2 <- graph_from_literal(D - A:F:Y, B - A - X - F - H - Z, F - Y)
print_all(net1 %u% net2)
#> ── <igraph> ───────────────────────────────────────────────────────── 3ea0f21 ──
#> ℹ undirected · named
#> ℹ 13 vertices · 21 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → vertex: name <chr>
#> 
#> ── Vertex attributes ───────────────────────────────────────────────────────────
#>      name
#> [1]     D
#> [2]     A
#> [3]     B
#> [4]     F
#> [5]     G
#> [6]     C
#> [7]     E
#> [8]     H
#> [9]     I
#> [10]    J
#> [11]    Y
#> [12]    X
#> [13]    Z
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#>  [1] I ─ J  H ─ Z  H ─ I  G ─ H  G ─ E  F ─ X  F ─ Y  F ─ H  F ─ C  F ─ G 
#> [11] B ─ E  B ─ G  A ─ X  A ─ C  A ─ F  A ─ B  D ─ Y  D ─ G  D ─ F  D ─ B 
#> [21] D ─ A 
```
