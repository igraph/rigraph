# Reverse edges in a graph

The new graph will contain the same vertices, edges and attributes as
the original graph, except that the direction of the edges selected by
their edge IDs in the `eids` argument will be reversed. When reversing
all edges, this operation is also known as graph transpose.

## Usage

``` r
reverse_edges(graph, eids = E(graph))

# S3 method for class 'igraph'
t(x)
```

## Arguments

- graph:

  The input graph.

- eids:

  The edge IDs of the edges to reverse.

- x:

  The input graph.

## Value

The result graph where the direction of the edges with the given IDs are
reversed

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
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`transitive_closure()`](https://r.igraph.org/reference/transitive_closure.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Related documentation in the C library

[`reverse_edges()`](https://igraph.org/c/html/latest/igraph-Operators.html#igraph_reverse_edges).

## Examples

``` r
g <- make_graph(~ 1 -+ 2, 2 -+ 3, 3 -+ 4)
reverse_edges(g, 2)
#> IGRAPH 529d689 DN-- 4 3 -- 
#> + attr: name (v/c)
#> + edges from 529d689 (vertex names):
#> [1] 1->2 3->2 3->4
```
