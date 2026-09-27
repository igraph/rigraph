# Query and manipulate a graph as it were an adjacency matrix

Query and manipulate a graph as it were an adjacency matrix

## Usage

``` r
# S3 method for class 'igraph'
`[`(
  x,
  i,
  j,
  ...,
  from,
  to,
  sparse = igraph_opt("sparsematrices"),
  edges = FALSE,
  drop = TRUE,
  attr = if (is_weighted(x)) "weight"
)
```

## Arguments

- x:

  The graph.

- i:

  Index. Vertex ids or names or logical vectors. See details below.

- j:

  Index. Vertex ids or names or logical vectors. See details below.

- ...:

  Currently ignored.

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

- sparse:

  Logical scalar, whether to return sparse matrices.

- edges:

  Logical scalar, whether to return edge ids.

- drop:

  Ignored.

- attr:

  If not `NULL`, then it should be the name of an edge attribute. This
  attribute is queried and returned.

## Value

A scalar or matrix. See details below.

## Details

The single bracket indexes the (possibly weighted) adjacency matrix of
the graph. Here is what you can do with it:

1.  Check whether there is an edge between two vertices (\\v\\ and
    \\w\\) in the graph:

          graph[v, w]

    A numeric scalar is returned, one if the edge exists, zero
    otherwise.

2.  Extract the (sparse) adjacency matrix of the graph, or part of it:

          graph[]
        graph[1:3,5:6]
        graph[c(1,3,5),]

    The first variants returns the full adjacency matrix, the other two
    return part of it.

3.  The `from` and `to` arguments can be used to check the existence of
    many edges. In this case, both `from` and `to` must be present and
    they must have the same length. They must contain vertex ids or
    names. A numeric vector is returned, of the same length as `from`
    and `to`, it contains ones for existing edges edges and zeros for
    non-existing ones. Example:

          graph[from=1:3, to=c(2,3,5)]

    .

4.  For weighted graphs, the `[` operator returns the edge weights. For
    non-esistent edges zero weights are returned. Other edge attributes
    can be queried as well, by giving the `attr` argument.

5.  Querying edge ids instead of the existance of edges or edge
    attributes. E.g.

          graph[1, 2, edges=TRUE]

    returns the id of the edge between vertices 1 and 2, or zero if
    there is no such edge.

6.  Adding one or more edges to a graph. For this the element(s) of the
    imaginary adjacency matrix must be set to a non-zero numeric value
    (or `TRUE`):

          graph[1, 2] <- 1
        graph[1:3,1] <- 1
        graph[from=1:3, to=c(2,3,5)] <- TRUE

    This does not affect edges that are already present in the graph,
    i.e. no multiple edges are created.

7.  Adding weighted edges to a graph. The `attr` argument contains the
    name of the edge attribute to set, so it does not have to be
    ‘weight’:

          graph[1, 2, attr="weight"]<- 5
        graph[from=1:3, to=c(2,3,5)] <- c(1,-1,4)

    If an edge is already present in the network, then only its weights
    or other attribute are updated. If the graph is already weighted,
    then the `attr="weight"` setting is implicit, and one does not need
    to give it explicitly.

8.  Deleting edges. The replacement syntax allow the deletion of edges,
    by specifying `FALSE` or `NULL` as the replacement value:

          graph[v, w] <- FALSE

    removes the edge from vertex \\v\\ to vertex \\w\\. As this can be
    used to delete edges between two sets of vertices, either pairwise:

          graph[from=v, to=w] <- FALSE

    or not:

          graph[v, w] <- FALSE 

    if \\v\\ and \\w\\ are vectors of edge ids or names.

‘`[`’ allows logical indices and negative indices as well, with the
usual R semantics. E.g.

      graph[degree(graph)==0, 1] <- 1

adds an edge from every isolate vertex to vertex one, and

      G <- make_empty_graph(10)
    G[-1,1] <- TRUE

creates a star graph.

Of course, the indexing operators support vertex names, so instead of a
numeric vertex id a vertex can also be given to ‘`[`’ and ‘`[[`’.

## See also

Other structural queries:
[`[[.igraph()`](https://r.igraph.org/reference/sub-sub-.igraph.md),
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
