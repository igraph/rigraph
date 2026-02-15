# Remove duplicate edges from an edge sequence

Remove duplicate edges from an edge sequence

## Usage

``` r
# S3 method for class 'igraph.es'
unique(x, incomparables = FALSE, ...)
```

## Arguments

- x:

  An edge sequence.

- incomparables:

  a vector of values that cannot be compared. Passed to base function
  `duplicated`. See details there.

- ...:

  Passed to base function
  [`duplicated()`](https://rdrr.io/r/base/duplicated.html).

## Value

An edge sequence with the duplicate vertices removed.

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
[`unique.igraph.vs()`](https://r.igraph.org/reference/unique.igraph.vs.md)

## Examples

``` r
g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
E(g)[1, 1:5, 1:10, 5:10]
#> + 22/10 edges from a7baa6f (vertex names):
#>  [1] A--B A--B B--C C--D D--E E--F A--B B--C C--D D--E E--F F--G G--H H--I I--J
#> [16] A--J E--F F--G G--H H--I I--J A--J
E(g)[1, 1:5, 1:10, 5:10] %>% unique()
#> + 10/10 edges from a7baa6f (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
```
