# Intersection of edge sequences

Intersection of edge sequences

## Usage

``` r
# S3 method for class 'igraph.es'
intersection(...)
```

## Arguments

- ...:

  The edge sequences to take the intersection of.

## Value

An edge sequence that contains edges that appear in all given sequences,
each edge exactly once.

## Details

They must belong to the same graph. Note that this function has ‘set’
semantics and the multiplicity of edges is lost in the result.

## See also

Other vertex and edge sequence operations:
[`c.igraph.es()`](https://r.igraph.org/reference/c.igraph.es.md),
[`c.igraph.vs()`](https://r.igraph.org/reference/c.igraph.vs.md),
[`difference.igraph.es()`](https://r.igraph.org/reference/difference.igraph.es.md),
[`difference.igraph.vs()`](https://r.igraph.org/reference/difference.igraph.vs.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`igraph-vs-indexing2`](https://r.igraph.org/reference/igraph-vs-indexing2.md),
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
intersection(E(g)[1:6], E(g)[5:9])
#> + 2/10 edges from 8ff8f43 (vertex names):
#> [1] E--F F--G
```
