# Vertices of a graph

Create a vertex sequence (vs) containing all vertices of a graph.

## Usage

``` r
V(graph)
```

## Arguments

- graph:

  The graph

## Value

A vertex sequence containing all vertices, in the order of their numeric
vertex ids.

## Details

A vertex sequence is just what the name says it is: a sequence of
vertices. Vertex sequences are usually used as igraph function arguments
that refer to vertices of a graph.

A vertex sequence is tied to the graph it refers to: it really denoted
the specific vertices of that graph, and cannot be used together with
another graph.

At the implementation level, a vertex sequence is simply a vector
containing numeric vertex ids, but it has a special class attribute
which makes it possible to perform graph specific operations on it, like
selecting a subset of the vertices based on graph structure, or vertex
attributes.

A vertex sequence is most often created by the `V()` function. The
result of this includes all vertices in increasing vertex id order. A
vertex sequence can be indexed by a numeric vector, just like a regular
R vector. See
[`[.igraph.vs`](https://r.igraph.org/reference/igraph-vs-indexing.md)
and additional links to other vertex sequence operations below.

## Indexing vertex sequences

Vertex sequences mostly behave like regular vectors, but there are some
additional indexing operations that are specific for them; e.g.
selecting vertices based on graph structure, or based on vertex
attributes. See
[`[.igraph.vs`](https://r.igraph.org/reference/igraph-vs-indexing.md)
for details.

## Querying or setting attributes

Vertex sequences can be used to query or set attributes for the vertices
in the sequence. See
[`$.igraph.vs()`](https://r.igraph.org/reference/igraph-vs-attributes.md)
for details.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
[`print.igraph.es()`](https://r.igraph.org/reference/print.igraph.es.md),
[`print.igraph.vs()`](https://r.igraph.org/reference/print.igraph.vs.md)

## Examples

``` r
# Vertex ids of an unnamed graph
g <- make_ring(10)
V(g)
#> + 10/10 vertices, from b862e93:
#>  [1]  1  2  3  4  5  6  7  8  9 10

# Vertex ids of a named graph
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = letters[1:10])
V(g2)
#> + 10/10 vertices, named, from 33ce822:
#>  [1] a b c d e f g h i j
```
