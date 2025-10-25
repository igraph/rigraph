# Add vertices, edges or another graph to a graph

Add vertices, edges or another graph to a graph

## Usage

``` r
# S3 method for class 'igraph'
e1 + e2
```

## Arguments

- e1:

  First argument, probably an igraph graph, but see details below.

- e2:

  Second argument, see details below.

## Details

The plus operator can be used to add vertices or edges to graph. The
actual operation that is performed depends on the type of the right hand
side argument.

- If is is another igraph graph object and they are both named graphs,
  then the union of the two graphs are calculated, see
  [`union()`](https://r.igraph.org/reference/union.md).

- If it is another igraph graph object, but either of the two are not
  named, then the disjoint union of the two graphs is calculated, see
  [`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md).

- If it is a numeric scalar, then the specified number of vertices are
  added to the graph.

- If it is a character scalar or vector, then it is interpreted as the
  names of the vertices to add to the graph.

- If it is an object created with the
  [`vertex()`](https://r.igraph.org/reference/vertex.md) or
  [`vertices()`](https://r.igraph.org/reference/vertex.md) function,
  then new vertices are added to the graph. This form is appropriate
  when one wants to add some vertex attributes as well. The operands of
  the [`vertices()`](https://r.igraph.org/reference/vertex.md) function
  specifies the number of vertices to add and their attributes as well.

  The unnamed arguments of
  [`vertices()`](https://r.igraph.org/reference/vertex.md) are
  concatenated and used as the ‘`name`’ vertex attribute (i.e. vertex
  names), the named arguments will be added as additional vertex
  attributes. Examples:

        g <- g +
              vertex(shape="circle", color= "red")
        g <- g + vertex("foo", color="blue")
        g <- g + vertex("bar", "foobar")
        g <- g + vertices("bar2", "foobar2", color=1:2, shape="rectangle")

  [`vertex()`](https://r.igraph.org/reference/vertex.md) is just an
  alias to [`vertices()`](https://r.igraph.org/reference/vertex.md), and
  it is provided for readability. The user should use it if a single
  vertex is added to the graph.

- If it is an object created with the
  [`edge()`](https://r.igraph.org/reference/edge.md) or
  [`edges()`](https://r.igraph.org/reference/edge.md) function, then new
  edges will be added to the graph. The new edges and possibly their
  attributes can be specified as the arguments of the
  [`edges()`](https://r.igraph.org/reference/edge.md) function.

  The unnamed arguments of
  [`edges()`](https://r.igraph.org/reference/edge.md) are concatenated
  and used as vertex ids of the end points of the new edges. The named
  arguments will be added as edge attributes.

  Examples:

        g <- make_empty_graph() +
               vertices(letters[1:10]) +
               vertices("foo", "bar", "bar2", "foobar2")
        g <- g + edge("a", "b")
        g <- g + edges("foo", "bar", "bar2", "foobar2")
        g <- g + edges(c("bar", "foo", "foobar2", "bar2"), color="red", weight=1:2)

  See more examples below.

  [`edge()`](https://r.igraph.org/reference/edge.md) is just an alias to
  [`edges()`](https://r.igraph.org/reference/edge.md) and it is provided
  for readability. The user should use it if a single edge is added to
  the graph.

- If it is an object created with the
  [`path()`](https://r.igraph.org/reference/path.md) function, then new
  edges that form a path are added. The edges and possibly their
  attributes are specified as the arguments to the
  [`path()`](https://r.igraph.org/reference/path.md) function. The
  non-named arguments are concatenated and interpreted as the vertex ids
  along the path. The remaining arguments are added as edge attributes.

  Examples:

        g <- make_empty_graph() + vertices(letters[1:10])
        g <- g + path("a", "b", "c", "d")
        g <- g + path("e", "f", "g", weight=1:2, color="red")
        g <- g + path(c("f", "c", "j", "d"), width=1:3, color="green")

It is important to note that, although the plus operator is commutative,
i.e. is possible to write

      graph <- "foo" + make_empty_graph()

it is not associative, e.g.

      graph <- "foo" + "bar" + make_empty_graph()

results a syntax error, unless parentheses are used:

      graph <- "foo" + ( "bar" + make_empty_graph() )

For clarity, we suggest to always put the graph object on the left hand
side of the operator:

      graph <- make_empty_graph() + "foo" + "bar"

## See also

Other functions for manipulating graph structure:
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

## Examples

``` r
# 10 vertices named a,b,c,... and no edges
g <- make_empty_graph() + vertices(letters[1:10])

# Add edges to make it a ring
g <- g + path(letters[1:10], letters[1], color = "grey")

# Add some extra random edges
g <- g + edges(sample(V(g), 10, replace = TRUE), color = "red")
g$layout <- layout_in_circle
plot(g)
```
