# Query and manipulate a graph as it were an adjacency list

Query and manipulate a graph as it were an adjacency list

## Usage

``` r
# S3 method for class 'igraph'
x[[i, j, from, to, ..., directed = TRUE, edges = FALSE, exact = TRUE]]
```

## Arguments

- x:

  The graph.

- i:

  Index, integer, character or logical, see details below.

- j:

  Index, integer, character or logical, see details below.

- from:

  A numeric or character vector giving vertex ids or names. Together
  with the `to` argument, it can be used to query/set a sequence of
  edges. See details below. This argument cannot be present together
  with any of the `i` and `j` arguments and if it is present, then the
  `to` argument must be present as well.

- to:

  A numeric or character vector giving vertex ids or names. Together
  with the `from` argument, it can be used to query/set a sequence of
  edges. See details below. This argument cannot be present together
  with any of the `i` and `j` arguments and if it is present, then the
  `from` argument must be present as well.

- ...:

  Additional arguments are not used currently.

- directed:

  Logical scalar, whether to consider edge directions in directed
  graphs. It is ignored for undirected graphs.

- edges:

  Logical scalar, whether to return edge ids.

- exact:

  Ignored.

## Details

The double bracket operator indexes the (imaginary) adjacency list of
the graph. This can used for the following operations:

1.  Querying the adjacent vertices for one or more vertices:

          graph[[1:3,]]
        graph[[,1:3]]

    The first form gives the successors, the second the predecessors or
    the 1:3 vertices. (For undirected graphs they are equivalent.)

2.  Querying the incident edges for one or more vertices, if the `edges`
    argument is set to `TRUE`:

          graph[[1:3, , edges=TRUE]]
        graph[[, 1:3, edges=TRUE]]

3.  Querying the edge ids between two sets or vertices, if both indices
    are used. E.g.

          graph[[v, w, edges=TRUE]]

    gives the edge ids of all the edges that exist from vertices \\v\\
    to vertices \\w\\.

The alternative argument names `from` and `to` can be used instead of
the usual `i` and `j`, to make the code more readable:

     graph[[from = 1:3]]
    graph[[from = v, to = w, edges = TRUE]]

‘`[[`’ operators allows logical indices and negative indices as well,
with the usual R semantics.

Vertex names are also supported, so instead of a numeric vertex id a
vertex can also be given to ‘`[`’ and ‘`[[`’.

## See also

Other structural queries:
[`[.igraph()`](https://r.igraph.org/reference/sub-.igraph.md),
[`adjacent_vertices()`](https://r.igraph.org/reference/adjacent_vertices.md),
[`are_adjacent()`](https://r.igraph.org/reference/are_adjacent.md),
[`ends()`](https://r.igraph.org/reference/ends.md),
[`get_edge_ids()`](https://r.igraph.org/reference/get_edge_ids.md),
[`gorder()`](https://r.igraph.org/reference/gorder.md),
[`gsize()`](https://r.igraph.org/reference/gsize.md),
[`head_of()`](https://r.igraph.org/reference/head_of.md),
[`incident()`](https://r.igraph.org/reference/incident.md),
[`incident_edges()`](https://r.igraph.org/reference/incident_edges.md),
[`is_directed()`](https://r.igraph.org/reference/is_directed.md),
[`neighbors()`](https://r.igraph.org/reference/neighbors.md),
[`tail_of()`](https://r.igraph.org/reference/tail_of.md)
