# Select edges and show their metadata

The double bracket operator can be used on edge sequences, to print the
meta-data (edge attributes) of the edges in the sequence.

## Usage

``` r
# S3 method for class 'igraph.es'
x[[...]]
```

## Arguments

- x:

  An edge sequence.

- ...:

  Additional arguments, passed to `[`.

## Value

Another edge sequence, with metadata printing turned on. See details
below.

## Details

Technically, when used with edge sequences, the double bracket operator
does exactly the same as the single bracket operator, but the resulting
edge sequence is printed differently: all attributes of the edges in the
sequence are printed as well.

See
[`[.igraph.es`](https://r.igraph.org/reference/igraph-es-indexing.md)
for more about indexing edge sequences.

## See also

Other vertex and edge sequences:
[`E()`](https://r.igraph.org/reference/E.md),
[`V()`](https://r.igraph.org/reference/V.md),
[`as_ids()`](https://r.igraph.org/reference/as_ids.md),
[`igraph-es-attributes`](https://r.igraph.org/reference/igraph-es-attributes.md),
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
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
[`igraph-es-indexing`](https://r.igraph.org/reference/igraph-es-indexing.md),
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
g <- make_(
  ring(10),
  with_vertex_(name = LETTERS[1:10]),
  with_edge_(weight = 1:10, color = "green")
)
E(g)
#> + 10/10 edges from f2eb87a (vertex names):
#>  [1] A--B B--C C--D D--E E--F F--G G--H H--I I--J A--J
E(g)[[]]
#> + 10/10 edges from f2eb87a (vertex names):
#>    tail head tid hid weight color
#> 1     A    B   1   2      1 green
#> 2     B    C   2   3      2 green
#> 3     C    D   3   4      3 green
#> 4     D    E   4   5      4 green
#> 5     E    F   5   6      5 green
#> 6     F    G   6   7      6 green
#> 7     G    H   7   8      7 green
#> 8     H    I   8   9      8 green
#> 9     I    J   9  10      9 green
#> 10    A    J   1  10     10 green
E(g)[[.inc("A")]]
#> + 2/10 edges from f2eb87a (vertex names):
#>    tail head tid hid weight color
#> 1     A    B   1   2      1 green
#> 10    A    J   1  10     10 green
```
