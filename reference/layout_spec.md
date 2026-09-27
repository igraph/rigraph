# Layout specifications for `layout_()` and `add_layout_()`

Each of these functions builds a lazy layout specification for the given
layout function, to be used with
[`layout_()`](https://r.igraph.org/reference/layout_.md) or
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md). The
specification is only evaluated when the layout is actually computed, so
it can be combined with layout modifiers such as
[`component_wise()`](https://r.igraph.org/reference/component_wise.md)
or [`normalize()`](https://r.igraph.org/reference/normalize.md).

`as_bipartite()`, `as_star()` and `as_tree()` wrap
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md)
and
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md)
respectively. `in_circle()`, `nicely()`, `on_grid()`, `on_sphere()` and
`randomly()` wrap
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md),
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md),
[`layout_on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md)
and
[`layout_randomly()`](https://r.igraph.org/reference/layout_randomly.md).
`with_dh()`, `with_fr()`, `with_gem()`, `with_graphopt()`, `with_kk()`,
`with_lgl()`, `with_mds()`, `with_sugiyama()` and `with_drl()` wrap
[`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md),
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
[`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md),
[`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md),
[`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md),
[`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md),
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)
and
[`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md).

## Usage

``` r
as_bipartite(...)

as_star(...)

as_tree(...)

in_circle(...)

nicely(...)

on_grid(...)

on_sphere(...)

randomly(...)

with_dh(...)

with_fr(...)

with_gem(...)

with_graphopt(...)

with_kk(...)

with_lgl(...)

with_mds(...)

with_sugiyama(...)

with_drl(...)
```

## Arguments

- ...:

  Forwarded to the corresponding `layout_*()` function.

## Value

An object of class `igraph_layout_spec`.

## See also

[`layout_()`](https://r.igraph.org/reference/layout_.md) and
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md) to
apply a layout specification to a graph.

## Examples

``` r
g <- make_ring(10)

# Pass a layout specification to layout_() ...
layout_(g, in_circle())
#>            [,1]          [,2]
#>  [1,]  1.000000  0.000000e+00
#>  [2,]  0.809017  5.877853e-01
#>  [3,]  0.309017  9.510565e-01
#>  [4,] -0.309017  9.510565e-01
#>  [5,] -0.809017  5.877853e-01
#>  [6,] -1.000000  1.224647e-16
#>  [7,] -0.809017 -5.877853e-01
#>  [8,] -0.309017 -9.510565e-01
#>  [9,]  0.309017 -9.510565e-01
#> [10,]  0.809017 -5.877853e-01

# ... or store the layout in the graph with add_layout_()
g <- add_layout_(g, with_fr())
g$layout
#>             [,1]      [,2]
#>  [1,]  2.1589144 5.0455664
#>  [2,]  0.6153014 5.5901174
#>  [3,] -0.9613473 5.0937165
#>  [4,] -1.9602256 3.7750304
#>  [5,] -2.0241154 2.1178486
#>  [6,] -1.1213869 0.7424174
#>  [7,]  0.4242262 0.1852660
#>  [8,]  2.0005392 0.6732554
#>  [9,]  3.0006237 2.0049026
#> [10,]  3.0596746 3.6628926

# Specifications take the arguments of the layout function they wrap
layout_(make_star(10), as_star(center = 5))
#>             [,1]       [,2]
#>  [1,]  1.0000000  0.0000000
#>  [2,]  0.7660444  0.6427876
#>  [3,]  0.1736482  0.9848078
#>  [4,] -0.5000000  0.8660254
#>  [5,]  0.0000000  0.0000000
#>  [6,] -0.9396926  0.3420201
#>  [7,] -0.9396926 -0.3420201
#>  [8,] -0.5000000 -0.8660254
#>  [9,]  0.1736482 -0.9848078
#> [10,]  0.7660444 -0.6427876

# and can be combined with layout modifiers
layout_(make_ring(10) + make_ring(5), with_fr(), component_wise())
#>              [,1]       [,2]
#>  [1,]   2.2726310  3.3459645
#>  [2,]   3.8908190  1.4414705
#>  [3,]   3.9931438 -1.0449162
#>  [4,]   2.5486627 -3.1041705
#>  [5,]   0.1808773 -3.9594923
#>  [6,]  -2.2711595 -3.3148546
#>  [7,]  -3.8867528 -1.4043254
#>  [8,]  -3.9931438  1.0738821
#>  [9,]  -2.5509091  3.1195990
#> [10,]  -0.1711416  3.9594923
#> [11,] -11.1463682  2.8128001
#> [12,]  -9.6713544  0.2448092
#> [13,]  -6.7676000  0.8401237
#> [14,]  -6.4439238  3.7885464
#> [15,]  -9.1493723  4.9996359
```
