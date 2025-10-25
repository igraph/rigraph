# Constructor modifier to add graph attributes

Constructor modifier to add graph attributes

## Usage

``` r
with_graph_(...)
```

## Arguments

- ...:

  The attributes to add. They must be named.

## See also

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
make_(ring(10), with_graph_(name = "10-ring"))
#> IGRAPH b173595 U--- 10 10 -- 10-ring
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + edges from b173595:
#>  [1] 1-- 2 2-- 3 3-- 4 4-- 5 5-- 6 6-- 7 7-- 8 8-- 9 9--10 1--10
```
