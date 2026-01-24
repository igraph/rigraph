# Remove duplicate vertices from a vertex sequence

Remove duplicate vertices from a vertex sequence

## Usage

``` r
# S3 method for class 'igraph.vs'
unique(x, incomparables = FALSE, ...)
```

## Arguments

- x:

  A vertex sequence.

- incomparables:

  a vector of values that cannot be compared. Passed to base function
  `duplicated`. See details there.

- ...:

  Passed to base function
  [`duplicated()`](https://rdrr.io/r/base/duplicated.html).

## Value

A vertex sequence with the duplicate vertices removed.

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
[`intersection.igraph.es()`](https://r.igraph.org/reference/intersection.igraph.es.md),
[`intersection.igraph.vs()`](https://r.igraph.org/reference/intersection.igraph.vs.md),
[`rev.igraph.es()`](https://r.igraph.org/reference/rev.igraph.es.md),
[`rev.igraph.vs()`](https://r.igraph.org/reference/rev.igraph.vs.md),
[`union.igraph.es()`](https://r.igraph.org/reference/union.igraph.es.md),
[`union.igraph.vs()`](https://r.igraph.org/reference/union.igraph.vs.md),
[`unique.igraph.es()`](https://r.igraph.org/reference/unique.igraph.es.md)

## Examples

``` r
g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
V(g)[1, 1:5, 1:10, 5:10]
#> + 22/10 vertices, named, from 7356a04:
#>  [1] A A B C D E A B C D E F G H I J E F G H I J
V(g)[1, 1:5, 1:10, 5:10] %>% unique()
#> + 10/10 vertices, named, from 7356a04:
#>  [1] A B C D E F G H I J
```
