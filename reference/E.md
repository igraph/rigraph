# Edges of a graph

An edge sequence is a vector containing numeric edge ids, with a special
class attribute that allows custom operations: selecting subsets of
edges based on attributes, or graph structure, creating the
intersection, union of edges, etc.

## Usage

``` r
E(graph, P = NULL, path = NULL, directed = TRUE)
```

## Arguments

- graph:

  The graph.

- P:

  A list of vertices to select edges via pairs of vertices. The first
  and second vertices select the first edge, the third and fourth the
  second, etc.

- path:

  A list of vertices, to select edges along a path. Note that this only
  works reliable for simple graphs. If the graph has multiple edges, one
  of them will be chosen arbitrarily to be included in the edge
  sequence.

- directed:

  Whether to consider edge directions in the `P` argument, for directed
  graphs.

## Value

An edge sequence of the graph.

## Details

Edge sequences are usually used as igraph function arguments that refer
to edges of a graph.

An edge sequence is tied to the graph it refers to: it really denoted
the specific edges of that graph, and cannot be used together with
another graph.

An edge sequence is most often created by the `E()` function. The result
includes edges in increasing edge id order by default (if. none of the
`P` and `path` arguments are used). An edge sequence can be indexed by a
numeric vector, just like a regular R vector. See links to other edge
sequence operations below.

## Indexing edge sequences

Edge sequences mostly behave like regular vectors, but there are some
additional indexing operations that are specific for them; e.g.
selecting edges based on graph structure, or based on edge attributes.
See
[`[.igraph.es`](https://r.igraph.org/reference/igraph-es-indexing.md)
for details.

## Querying or setting attributes

Edge sequences can be used to query or set attributes for the edges in
the sequence. See
[`$.igraph.es()`](https://r.igraph.org/reference/igraph-es-attributes.md)
for details.

## See also

Other vertex and edge sequences:
[`V()`](https://r.igraph.org/reference/V.md),
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
# Edges of an unnamed graph
g <- make_ring(10)
E(g)
#> + 10/10 edges from 26533b0:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10

# Edges of a named graph
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = letters[1:10])
E(g2)
#> + 10/10 edges from 4793bc8 (vertex names):
#>  [1] a--b b--c c--d d--e e--f f--g g--h h--i i--j a--j
```
