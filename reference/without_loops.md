# Constructor modifier to drop loop edges

Constructor modifier to drop loop edges

## Usage

``` r
without_loops()
```

## See also

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
# An artificial example
make_(full_graph(5, loops = TRUE))
#> IGRAPH 177cd15 U--- 5 15 -- Full graph
#> + attr: name (g/c), loops (g/l)
#> + edges from 177cd15:
#>  [1] 1--1 1--2 1--3 1--4 1--5 2--2 2--3 2--4 2--5 3--3 3--4 3--5 4--4 4--5 5--5
make_(full_graph(5, loops = TRUE), without_loops())
#> IGRAPH 6defcc7 U--- 5 10 -- Full graph
#> + attr: name (g/c), loops (g/l)
#> + edges from 6defcc7:
#>  [1] 1--2 1--3 1--4 1--5 2--3 2--4 2--5 3--4 3--5 4--5
```
