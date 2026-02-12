# Concatenate edge sequences

Concatenate edge sequences

## Usage

``` r
# S3 method for class 'igraph.es'
c(..., recursive = FALSE)
```

## Arguments

- ...:

  The edge sequences to concatenate. They must all refer to the same
  graph.

- recursive:

  Ignored, included for S3 compatibility with the base `c` function.

## Value

An edge sequence, the input sequences concatenated.

## See also

Other vertex and edge sequence operations:
[`c.igraph.vs()`](https://r.igraph.org/reference/c.igraph.vs.md),
[`difference.igraph.es()`](https://r.igraph.org/reference/difference.igraph.es.md),
[`difference.igraph.vs()`](https://r.igraph.org/reference/difference.igraph.vs.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
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
g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
c(E(g)[1], E(g)["A|B"], E(g)[1:4])
#> + 6/10 edges from 8369c9c (vertex names):
#> [1] A--B A--B A--B B--C C--D D--E
```
