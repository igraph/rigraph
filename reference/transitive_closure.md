# Transitive closure of a graph

**\[experimental\]**

Computes the transitive closure of a graph. The resulting graph will
have an edge from vertex \\i\\ to vertex \\j\\ if \\j\\ is reachable
from \\i\\ in the original graph.

The transitive closure of a graph is a new graph where there is an edge
between any two vertices if there is a path between them in the original
graph. For directed graphs, an edge from \\i\\ to \\j\\ is added if
there is a directed path from \\i\\ to \\j\\. For undirected graphs,
this is equivalent to connecting all vertices that are in the same
connected component.

## Usage

``` r
transitive_closure(graph)
```

## Arguments

- graph:

  The input graph. It can be directed or undirected.

## Value

A new graph object representing the transitive closure. The returned
graph will have the same directedness as the input.

## Related documentation in the C library

[`transitive_closure()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_transitive_closure)

## See also

[`distances()`](https://r.igraph.org/reference/distances.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md)

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
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Author

Fabio Zanini <fabio.zanini@unsw.edu.au>

## Examples

``` r
# Directed graph
g <- make_graph(c(1, 2, 2, 3, 3, 4))
tc <- transitive_closure(g)
# The closure has edges 1->2, 1->3, 1->4, 2->3, 2->4, 3->4
print_all(tc)
#> IGRAPH 5cb8fa4 D--- 4 6 -- 
#> + edges from 5cb8fa4:
#> [1] 1->2 1->3 1->4 2->3 2->4 3->4

# Undirected graph - connects all vertices in same component
g2 <- make_graph(c(1, 2, 3, 4), directed = FALSE)
tc2 <- transitive_closure(g2)
# Full graph on vertices 1, 2 and full graph on vertices 3, 4
print_all(tc2)
#> IGRAPH 3a58540 U--- 4 2 -- 
#> + edges from 3a58540:
#> [1] 1--2 3--4
```
