# Select vertices and show their metadata

The double bracket operator can be used on vertex sequences, to print
the meta-data (vertex attributes) of the vertices in the sequence.

## Usage

``` r
# S3 method for class 'igraph.vs'
x[[...]]
```

## Arguments

- x:

  A vertex sequence.

- ...:

  Additional arguments, passed to `[`.

## Value

The double bracket operator returns another vertex sequence, with
meta-data (attribute) printing turned on. See details below.

## Details

Technically, when used with vertex sequences, the double bracket
operator does exactly the same as the single bracket operator, but the
resulting vertex sequence is printed differently: all attributes of the
vertices in the sequence are printed as well.

See
[`[.igraph.vs`](https://r.igraph.org/reference/igraph-vs-indexing.md)
for more about indexing vertex sequences.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
[`print.igraph.es()`](https://r.igraph.org/reference/print.igraph.es.md),
[`print.igraph.vs()`](https://r.igraph.org/reference/print.igraph.vs.md)

Other vertex and edge sequence operations:
[`c.igraph.es()`](https://r.igraph.org/reference/c.igraph.es.md),
[`c.igraph.vs()`](https://r.igraph.org/reference/c.igraph.vs.md),
[`difference.igraph.es()`](https://r.igraph.org/reference/difference.igraph.es.md),
[`difference.igraph.vs()`](https://r.igraph.org/reference/difference.igraph.vs.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
[`igraph-es-indexing2`](https://r.igraph.org/reference/igraph-es-indexing2.md),
[`igraph-vs-indexing`](https://r.igraph.org/reference/igraph-vs-indexing.md),
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
g <- make_ring(10) %>%
  set_vertex_attr("color", value = "red") %>%
  set_vertex_attr("name", value = LETTERS[1:10])
V(g)
#> + 10/10 vertices, named, from 070adcf:
#>  [1] A B C D E F G H I J
V(g)[[]]
#> + 10/10 vertices, named, from 070adcf:
#>    color name
#> 1    red    A
#> 2    red    B
#> 3    red    C
#> 4    red    D
#> 5    red    E
#> 6    red    F
#> 7    red    G
#> 8    red    H
#> 9    red    I
#> 10   red    J
V(g)[1:5]
#> + 5/10 vertices, named, from 070adcf:
#> [1] A B C D E
V(g)[[1:5]]
#> + 5/10 vertices, named, from 070adcf:
#>   color name
#> 1   red    A
#> 2   red    B
#> 3   red    C
#> 4   red    D
#> 5   red    E
```
