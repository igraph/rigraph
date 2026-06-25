# Convert a vertex or edge sequence to an ordinary vector

Convert a vertex or edge sequence to an ordinary vector

## Usage

``` r
as_ids(seq)

# S3 method for class 'igraph.vs'
as_ids(seq)

# S3 method for class 'igraph.es'
as_ids(seq)
```

## Arguments

- seq:

  The vertex or edge sequence.

## Value

A character or numeric vector, see details below.

## Details

For graphs without names, a numeric vector is returned, containing the
internal numeric vertex or edge ids.

For graphs with names, and vertex sequences, the vertex names are
returned in a character vector.

For graphs with names and edge sequences, a character vector is
returned, with the ‘bar’ notation: `a|b` means an edge from vertex `a`
to vertex `b`.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
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
g <- make_ring(10)
as_ids(V(g))
#>  [1]  1  2  3  4  5  6  7  8  9 10
as_ids(E(g))
#>  [1]  1  2  3  4  5  6  7  8  9 10

V(g)$name <- letters[1:10]
as_ids(V(g))
#>  [1] "a" "b" "c" "d" "e" "f" "g" "h" "i" "j"
as_ids(E(g))
#>  [1] "a|b" "b|c" "c|d" "d|e" "e|f" "f|g" "g|h" "h|i" "i|j" "a|j"
```
