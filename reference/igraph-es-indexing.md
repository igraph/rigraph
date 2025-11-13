# Indexing edge sequences

Edge sequences can be indexed very much like a plain numeric R vector,
with some extras.

## Usage

``` r
# S3 method for class 'igraph.es'
x[...]
```

## Arguments

- x:

  An edge sequence

- ...:

  Indices, see details below.

## Value

Another edge sequence, referring to the same graph.

## Multiple indices

When using multiple indices within the bracket, all of them are
evaluated independently, and then the results are concatenated using the
[`c()`](https://rdrr.io/r/base/c.html) function. E.g.
`E(g)[1, 2, .inc(1)]` is equivalent to
`c(E(g)[1], E(g)[2], E(g)[.inc(1)])`.

## Index types

Edge sequences can be indexed with positive numeric vectors, negative
numeric vectors, logical vectors, character vectors:

- When indexed with positive numeric vectors, the edges at the given
  positions in the sequence are selected. This is the same as indexing a
  regular R atomic vector with positive numeric vectors.

- When indexed with negative numeric vectors, the edges at the given
  positions in the sequence are omitted. Again, this is the same as
  indexing a regular R atomic vector.

- When indexed with a logical vector, the lengths of the edge sequence
  and the index must match, and the edges for which the index is `TRUE`
  are selected.

- Named graphs can be indexed with character vectors, to select edges
  with the given names. Note that a graph may have edge names and vertex
  names, and both can be used to select edges. Edge names are simply
  used as names of the numeric edge id vector. Vertex names effectively
  only work in graphs without multiple edges, and must be separated with
  a `|` bar character to select an edges that incident to the two given
  vertices. See examples below.

## Edge attributes

When indexing edge sequences, edge attributes can be referred to simply
by using their names. E.g. if a graph has a `weight` edge attribute,
then `E(G)[weight > 1]` selects all edges with a weight larger than one.
See more examples below. Note that attribute names mask the names of
variables present in the calling environment; if you need to look up a
variable and you do not want a similarly named edge attribute to mask
it, use the `.env` pronoun to perform the name lookup in the calling
environment. In other words, use `E(g)[.env$weight > 1]` to make sure
that `weight` is looked up from the calling environment even if there is
an edge attribute with the same name. Similarly, you can use `.data` to
match attribute names only.

## Special functions

There are some special igraph functions that can be used only in
expressions indexing edge sequences:

- `.inc`:

  takes a vertex sequence, and selects all edges that have at least one
  incident vertex in the vertex sequence.

- `.from`:

  similar to
  [`.inc()`](https://r.igraph.org/reference/inside-square-error.md), but
  only the tails of the edges are considered.

- `.to`:

  is similar to
  [`.inc()`](https://r.igraph.org/reference/inside-square-error.md), but
  only the heads of the edges are considered.

- `\%--\%`:

  a special operator that can be used to select all edges between two
  sets of vertices. It ignores the edge directions in directed graphs.

- `\%->\%`:

  similar to `\%--\%`, but edges *from* the left hand side argument,
  pointing *to* the right hand side argument, are selected, in directed
  graphs.

- `\%<-\%`:

  similar to `\%--\%`, but edges *to* the left hand side argument,
  pointing *from* the right hand side argument, are selected, in
  directed graphs.

Note that multiple special functions can be used together, or with
regular indices, and then their results are concatenated. See more
examples below.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
[`print.igraph.es()`](https://r.igraph.org/reference/print.igraph.es.md),
[`print.igraph.vs()`](https://r.igraph.org/reference/print.igraph.vs.md)

Other vertex and edge sequence operations:
[`c.igraph.es()`](https://r.igraph.org/reference/c.igraph.es.md),
[`c.igraph.vs()`](https://r.igraph.org/reference/c.igraph.vs.md),
[`difference.igraph.es()`](https://r.igraph.org/reference/difference.igraph.es.md),
[`difference.igraph.vs()`](https://r.igraph.org/reference/difference.igraph.vs.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
[`intersection.igraph.es()`](https://r.igraph.org/reference/intersection.igraph.es.md),
[`intersection.igraph.vs()`](https://r.igraph.org/reference/intersection.igraph.vs.md),
[`rev.igraph.es()`](https://r.igraph.org/reference/rev.igraph.es.md),
[`rev.igraph.vs()`](https://r.igraph.org/reference/rev.igraph.vs.md),
[`union.igraph.es()`](https://r.igraph.org/reference/union.igraph.es.md),
[`union.igraph.vs()`](https://r.igraph.org/reference/union.igraph.vs.md),
[`unique.igraph.es()`](https://r.igraph.org/reference/unique.igraph.es.md),
[`unique.igraph.vs()`](https://r.igraph.org/reference/unique.igraph.vs.md)

## Examples

``` r
# -----------------------------------------------------------------
# Special operators for indexing based on graph structure
g <- sample_pa(100, power = 0.3)
E(g)[1:3 %--% 2:6]
#> + 4/99 edges from 41cc739:
#> [1] 2->1 3->2 4->1 5->3
E(g)[1:5 %->% 1:6]
#> + 4/99 edges from 41cc739:
#> [1] 2->1 3->2 4->1 5->3
E(g)[1:3 %<-% 2:6]
#> + 4/99 edges from 41cc739:
#> [1] 2->1 3->2 4->1 5->3

# -----------------------------------------------------------------
# The edges along the diameter
g <- sample_pa(100, directed = FALSE)
d <- get_diameter(g)
E(g, path = d)
#> + 11/99 edges from 1826a0a:
#>  [1] 56--77 49--56 25--49 24--25  2--24  2-- 4  4--10 10--16 16--22 22--67
#> [11] 67--92

# -----------------------------------------------------------------
# Select edges based on attributes
g <- sample_gnp(20, 3 / 20) %>%
  set_edge_attr("weight", value = rnorm(gsize(.)))
E(g)[[weight < 0]]
#> + 11/19 edges from e12f527:
#>    tail head tid hid     weight
#> 1     1    2   1   2 -1.3803023
#> 2     5    6   5   6 -0.7457159
#> 5     2   10   2  10 -0.1886325
#> 7     7   14   7  14 -1.1246830
#> 9    11   14  11  14 -0.6231949
#> 10   13   15  13  15 -1.0164530
#> 12    3   17   3  17 -0.5737814
#> 13    4   19   4  19 -1.2981434
#> 14    8   19   8  19 -0.1116867
#> 15   12   19  12  19 -0.5027056
#> 16   18   19  18  19 -0.8653440

# Indexing with a variable whose name matches the name of an attribute
# may fail; use .env to force the name lookup in the parent environment
E(g)$x <- E(g)$weight
x <- 2
E(g)[.env$x]
#> + 1/19 edge from e12f527:
#> [1] 5--6
```
