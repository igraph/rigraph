# Find the edge ids based on the incident vertices of the edges

Find the edges in an igraph graph that have the specified end points.
This function handles multi-graph (graphs with multiple edges) and can
consider or ignore the edge directions in directed graphs.

## Usage

``` r
get_edge_ids(graph, vp, directed = TRUE, error = FALSE)
```

## Arguments

- graph:

  The input graph.

- vp:

  The incident vertices, given as a two-column data frame, two-column
  matrix, or vector of vertex ids or symbolic vertex names. For a
  vector, the values are interpreted pairwise, i.e. the first and second
  are used for the first edge, the third and fourth for the second, etc.

- directed:

  Logical scalar, whether to consider edge directions in directed
  graphs. This argument is ignored for undirected graphs.

- error:

  Logical scalar, whether to report an error if an edge is not found in
  the graph. If `FALSE`, then no error is reported, and zero is returned
  for the non-existant edge(s).

## Value

A numeric vector of edge ids, one for each pair of input vertices. If
there is no edge in the input graph for a given pair of vertices, then
zero is reported. (If the `error` argument is `FALSE`.)

## Details

igraph vertex ids are natural numbers, starting from one, up to the
number of vertices in the graph. Similarly, edges are also numbered from
one, up to the number of edges.

This function allows finding the edges of the graph, via their incident
vertices.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`gorder()`](https://r.igraph.org/reference/gorder.md),
[`gsize()`](https://r.igraph.org/reference/gsize.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
ei <- get_edge_ids(g, c(1, 2, 4, 5))
E(g)[ei]
#> + 2/10 edges from 15f11d0:
#> [1] 1--2 4--5

## non-existant edge
get_edge_ids(g, c(2, 1, 1, 4, 5, 4))
#> [1] 1 0 4

## For multiple edges, a single edge id is returned,
## as many times as corresponding pairs in the vertex series.
g <- make_graph(rep(c(1, 2), 5))
eis <- get_edge_ids(g, c(1, 2, 1, 2))
eis
#> [1] 5 5
E(g)[eis]
#> + 2/5 edges from cceb6b3:
#> [1] 1->2 1->2
```
