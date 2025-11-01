# Delete edges from a graph

Delete edges from a graph

## Usage

``` r
delete_edges(graph, edges)
```

## Arguments

- graph:

  The input graph.

- edges:

  The edges to remove, specified as an edge sequence. Typically this is
  either a numeric vector containing edge IDs, or a character vector
  containing the IDs or names of the source and target vertices,
  separated by `|`

## Value

The graph, with the edges removed.

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`contract()`](https://r.igraph.org/reference/contract.md),
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
g <- make_ring(10) %>%
  delete_edges(seq(1, 9, by = 2))
g
#> IGRAPH 34e84ec U--- 10 5 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 34e84ec:
#> [1] 2-- 3 4-- 5 6-- 7 8-- 9 1--10

g <- make_ring(10) %>%
  delete_edges("10|1")
g
#> IGRAPH 0c5580d U--- 10 9 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from 0c5580d:
#> [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10

g <- make_ring(5)
g <- delete_edges(g, get_edge_ids(g, c(1, 5, 4, 5)))
g
#> IGRAPH b4c77f5 U--- 5 3 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from b4c77f5:
#> [1] 1--2 2--3 3--4
```
