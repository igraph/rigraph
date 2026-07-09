# Compose two graphs as binary relations

Relational composition of two graph.

## Usage

``` r
compose(
  g1,
  g2,
  byname = "auto",
  graph.attr.comb = igraph_opt("graph.attr.comb"),
  vertex.attr.comb = "rename",
  edge.attr.comb = "rename"
)
```

## Arguments

- g1:

  The first input graph.

- g2:

  The second input graph.

- byname:

  A logical scalar, or the character scalar `auto`. Whether to perform
  the operation based on symbolic vertex names. If it is `auto`, that
  means `TRUE` if both graphs are named and `FALSE` otherwise. A warning
  is generated if `auto` and one graph, but not both graphs are named.

- graph.attr.comb, vertex.attr.comb, edge.attr.comb:

  Specification for combining clashing graph, vertex and edge
  attributes. `vertex.attr.comb` and `edge.attr.comb` default to
  `"rename"`; `graph.attr.comb` defaults to the `graph.attr.comb` igraph
  option (`"rename"` unless changed via
  [`igraph_options()`](https://r.igraph.org/reference/igraph_options.md)).
  See
  [igraph-attribute-combination](https://r.igraph.org/reference/igraph-attribute-combination.md)
  for the available combiners.

## Value

A new graph object.

## Details

`compose()` creates the relational composition of two graphs. The new
graph will contain an (a,b) edge only if there is a vertex c, such that
edge (a,c) is included in the first graph and (c,b) is included in the
second graph. The corresponding operator is `%c%`.

The function gives an error if one of the input graphs is directed and
the other is undirected.

If the `byname` argument is `TRUE` (or `auto` and the graphs are all
named), then the operation is performed based on symbolic vertex names.
Otherwise numeric vertex IDs are used.

`compose()` keeps the attributes of both graphs. All graph, vertex and
edge attributes are copied to the result. By default, if an attribute is
present in both graphs and would result in a name clash, that attribute
is renamed by adding suffixes: `_1`, `_2`. Pass `graph.attr.comb`,
`vertex.attr.comb` or `edge.attr.comb` to combine clashing attributes
instead; see
[igraph-attribute-combination](https://r.igraph.org/reference/igraph-attribute-combination.md)
for the available combiners.

The `name` vertex attribute is treated specially if the operation is
performed based on symbolic vertex names. In this case `name` must be
present in both graphs, and it is not renamed in the result graph.

Note that an edge in the result graph corresponds to two edges in the
input, one in the first graph, one in the second. This mapping is not
injective and several edges in the result might correspond to the same
edge in the first (and/or the second) graph. The edge attributes in the
result graph are updated accordingly.

Also note that the function may generate multigraphs, if there are more
than one way to find edges (a,b) in g1 and (b,c) in g2 for an edge (a,c)
in the result. See
[`simplify()`](https://r.igraph.org/reference/simplify.md) if you want
to get rid of the multiple edges.

The function may create loop edges, if edges (a,b) and (b,a) are present
in g1 and g2, respectively, then (a,a) is included in the result. See
[`simplify()`](https://r.igraph.org/reference/simplify.md) if you want
to get rid of the self-loops.

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
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r

g1 <- make_ring(10)
g2 <- make_star(10, mode = "undirected")
gc <- compose(g1, g2)
print_all(gc)
#> ── <igraph> ───────────────────────────────────────────────────────── 7632b22 ──
#> ℹ undirected
#> ℹ 10 vertices · 36 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name_1 <chr>, name_2 <chr>, mutual <lgl>, circular <lgl>, mode <chr>, center <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 1    1 ─ 1    1 ─ 2    2 ─ 10   2 ─ 9    2 ─ 8    2 ─ 7    2 ─ 6   
#>  [9] 2 ─ 5    2 ─ 4    2 ─ 3    2 ─ 2    1 ─ 3    1 ─ 3    1 ─ 4    1 ─ 4   
#> [17] 1 ─ 5    1 ─ 5    1 ─ 6    1 ─ 6    1 ─ 7    1 ─ 7    1 ─ 8    1 ─ 8   
#> [25] 1 ─ 9    1 ─ 9    1 ─ 10   10 ─ 10  9 ─ 10   8 ─ 10   7 ─ 10   6 ─ 10  
#> [33] 5 ─ 10   4 ─ 10   3 ─ 10   2 ─ 10  
print_all(simplify(gc))
#> ── <igraph> ───────────────────────────────────────────────────────── 5a1a663 ──
#> ℹ undirected
#> ℹ 10 vertices · 24 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name_1 <chr>, name_2 <chr>, mutual <lgl>, circular <lgl>, mode <chr>, center <dbl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 2   1 ─ 3   1 ─ 4   1 ─ 5   1 ─ 6   1 ─ 7   1 ─ 8   1 ─ 9   1 ─ 10 
#> [10] 2 ─ 3   2 ─ 4   2 ─ 5   2 ─ 6   2 ─ 7   2 ─ 8   2 ─ 9   2 ─ 10  3 ─ 10 
#> [19] 4 ─ 10  5 ─ 10  6 ─ 10  7 ─ 10  8 ─ 10  9 ─ 10 
```
