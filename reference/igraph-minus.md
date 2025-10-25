# Delete vertices or edges from a graph

Delete vertices or edges from a graph

## Usage

``` r
# S3 method for class 'igraph'
e1 - e2
```

## Arguments

- e1:

  Left argument, see details below.

- e2:

  Right argument, see details below.

## Value

An igraph graph.

## Details

The minus operator (‘`-`’) can be used to remove vertices or edges from
the graph. The operation performed is selected based on the type of the
right hand side argument:

- If it is an igraph graph object, then the difference of the two graphs
  is calculated, see
  [`difference()`](https://r.igraph.org/reference/difference.md).

- If it is a numeric or character vector, then it is interpreted as a
  vector of vertex ids and the specified vertices will be deleted from
  the graph. Example:

        g <- make_ring(10)
      V(g)$name <- letters[1:10]
      g <- g - c("a", "b")

- If `e2` is a vertex sequence (e.g. created by the
  [`V()`](https://r.igraph.org/reference/V.md) function), then these
  vertices will be deleted from the graph.

- If it is an edge sequence (e.g. created by the
  [`E()`](https://r.igraph.org/reference/E.md) function), then these
  edges will be deleted from the graph.

- If it is an object created with the
  [`vertex()`](https://r.igraph.org/reference/vertex.md) (or the
  [`vertices()`](https://r.igraph.org/reference/vertex.md)) function,
  then all arguments of
  [`vertices()`](https://r.igraph.org/reference/vertex.md) are
  concatenated and the result is interpreted as a vector of vertex ids.
  These vertices will be removed from the graph.

- If it is an object created with the
  [`edge()`](https://r.igraph.org/reference/edge.md) (or the
  [`edges()`](https://r.igraph.org/reference/edge.md)) function, then
  all arguments of [`edges()`](https://r.igraph.org/reference/edge.md)
  are concatenated and then interpreted as edges to be removed from the
  graph. Example:

        g <- make_ring(10)
      V(g)$name <- letters[1:10]
      E(g)$name <- LETTERS[1:10]
      g <- g - edge("e|f")
      g <- g - edge("H")

- If it is an object created with the
  [`path()`](https://r.igraph.org/reference/path.md) function, then all
  [`path()`](https://r.igraph.org/reference/path.md) arguments are
  concatenated and then interpreted as a path along which edges will be
  removed from the graph. Example:

        g <- make_ring(10)
      V(g)$name <- letters[1:10]
      g <- g - path("a", "b", "c", "d")

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
