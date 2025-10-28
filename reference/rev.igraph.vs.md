# Reverse the order in a vertex sequence

Reverse the order in a vertex sequence

## Usage

``` r
# S3 method for class 'igraph.vs'
rev(x)
```

## Arguments

- x:

  The vertex sequence to reverse.

## Value

The reversed vertex sequence.

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
[`union.igraph.es()`](https://r.igraph.org/reference/union.igraph.es.md),
[`union.igraph.vs()`](https://r.igraph.org/reference/union.igraph.vs.md),
[`unique.igraph.es()`](https://r.igraph.org/reference/unique.igraph.es.md),
[`unique.igraph.vs()`](https://r.igraph.org/reference/unique.igraph.vs.md)

## Examples

``` r
g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
V(g) %>% rev()
#> + 10/10 vertices, named, from 524815f:
#>  [1] J I H G F E D C B A
```
