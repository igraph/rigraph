# Add edges to a graph

The new edges are given as a vertex sequence, e.g. internal numeric
vertex ids, or vertex names. The first edge points from `edges[1]` to
`edges[2]`, the second from `edges[3]` to `edges[4]`, etc.

## Usage

``` r
add_edges(graph, edges, ..., attr = list())
```

## Arguments

- graph:

  The input graph

- edges:

  The edges to add, a vertex sequence with even number of vertices.

- ...:

  Additional arguments, they must be named, and they will be added as
  edge attributes, for the newly added edges. See also details below.

- attr:

  A named list, its elements will be added as edge attributes, for the
  newly added edges. See also details below.

## Value

The graph, with the edges (and attributes) added.

## Details

If attributes are supplied, and they are not present in the graph, their
values for the original edges of the graph are set to `NA`.

## Related documentation in the C library

[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
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
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Examples

``` r
g <- make_empty_graph(n = 5) %>%
  add_edges(c(
    1, 2,
    2, 3,
    3, 4,
    4, 5
  )) %>%
  set_edge_attr("color", value = "red") %>%
  add_edges(c(5, 1), color = "green")
E(g)[[]]
#> + 5/5 edges from f8a6726:
#>   tail head tid hid color
#> 1    1    2   1   2   red
#> 2    2    3   2   3   red
#> 3    3    4   3   4   red
#> 4    4    5   4   5   red
#> 5    5    1   5   1 green
plot(g)
```
