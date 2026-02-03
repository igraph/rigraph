# Generate coordinates to place the vertices of a graph in a star-shape

A simple layout generator, that places one vertex in the center of a
circle and the rest of the vertices equidistantly on the perimeter.

## Usage

``` r
layout_as_star(graph, center = V(graph)[1], order = NULL)

as_star(...)
```

## Arguments

- graph:

  The graph to layout.

- center:

  The id of the vertex to put in the center. By default it is the first
  vertex.

- order:

  Numeric vector, the order of the vertices along the perimeter. The
  default ordering is given by the vertex ids.

- ...:

  Arguments to pass to `layout_as_star()`.

## Value

A matrix with two columns and as many rows as the number of vertices in
the input graph.

## Details

It is possible to choose the vertex that will be in the center, and the
order of the vertices can be also given.

## Related documentation in the C library

[`layout_star()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_star),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[`layout_circle()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_circle)

## See also

[`layout()`](https://r.igraph.org/reference/layout_.md) and
[`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md)
for other layout algorithms,
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md) and
[`tkplot()`](https://r.igraph.org/reference/tkplot.md) on how to plot
graphs and [`star()`](https://r.igraph.org/reference/make_star.md) on
how to create ring graphs.

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md),
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md),
[`layout_on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md),
[`layout_randomly()`](https://r.igraph.org/reference/layout_randomly.md),
[`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md),
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
[`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md),
[`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md),
[`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md),
[`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md),
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_star(10)
layout_as_star(g)
#>             [,1]       [,2]
#>  [1,]  0.0000000  0.0000000
#>  [2,]  1.0000000  0.0000000
#>  [3,]  0.7660444  0.6427876
#>  [4,]  0.1736482  0.9848078
#>  [5,] -0.5000000  0.8660254
#>  [6,] -0.9396926  0.3420201
#>  [7,] -0.9396926 -0.3420201
#>  [8,] -0.5000000 -0.8660254
#>  [9,]  0.1736482 -0.9848078
#> [10,]  0.7660444 -0.6427876

## Alternative form
layout_(g, as_star())
#>             [,1]       [,2]
#>  [1,]  0.0000000  0.0000000
#>  [2,]  1.0000000  0.0000000
#>  [3,]  0.7660444  0.6427876
#>  [4,]  0.1736482  0.9848078
#>  [5,] -0.5000000  0.8660254
#>  [6,] -0.9396926  0.3420201
#>  [7,] -0.9396926 -0.3420201
#>  [8,] -0.5000000 -0.8660254
#>  [9,]  0.1736482 -0.9848078
#> [10,]  0.7660444 -0.6427876
```
