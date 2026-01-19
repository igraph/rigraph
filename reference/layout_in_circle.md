# Graph layout with vertices on a circle.

Place vertices on a circle, in the order of their vertex ids.

## Usage

``` r
layout_in_circle(graph, order = V(graph))

in_circle(...)
```

## Arguments

- graph:

  The input graph.

- order:

  The vertices to place on the circle, in the order of their desired
  placement. Vertices that are not included here will be placed at
  (0,0).

- ...:

  Passed to `layout_in_circle()`.

## Value

A numeric matrix with two columns, and one row for each vertex.

## Details

If you want to order the vertices differently, then permute them using
the [`permute()`](https://r.igraph.org/reference/permute.md) function.

## See also

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
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
## Place vertices on a circle, order them according to their
## community
library(igraphdata)
data(karate)
karate_groups <- cluster_optimal(karate)
#> This graph was created by an old(er) igraph version.
#> ℹ Call `igraph::upgrade_graph()` on it to use with the current igraph version.
#> For now we convert it on the fly...
coords <- layout_in_circle(karate,
  order =
    order(membership(karate_groups))
)
V(karate)$label <- sub("Actor ", "", V(karate)$name)
V(karate)$label.color <- membership(karate_groups)
V(karate)$shape <- "none"
plot(karate, layout = coords)
```
