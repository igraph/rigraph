# Simple two-row layout for bipartite graphs

Minimize edge-crossings in a simple two-row (or column) layout for
bipartite graphs.

## Usage

``` r
layout_as_bipartite(graph, types = NULL, hgap = 1, vgap = 1, maxiter = 100)

as_bipartite(...)
```

## Arguments

- graph:

  The bipartite input graph. It should have a logical ‘`type`’ vertex
  attribute, or the `types` argument must be given.

- types:

  A logical vector, the vertex types. If this argument is `NULL` (the
  default), then the ‘`type`’ vertex attribute is used.

- hgap:

  Real scalar, the minimum horizontal gap between vertices in the same
  layer.

- vgap:

  Real scalar, the distance between the two layers.

- maxiter:

  Integer scalar, the maximum number of iterations in the crossing
  minimization stage. 100 is a reasonable default; if you feel that you
  have too many edge crossings, increase this.

- ...:

  Arguments to pass to `layout_as_bipartite()`.

## Value

A matrix with two columns and as many rows as the number of vertices in
the input graph.

## Details

The layout is created by first placing the vertices in two rows,
according to their types. Then the positions within the rows are
optimized to minimize edge crossings, using the Sugiyama algorithm (see
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)).

## Related documentation in the C library

[`layout_bipartite()`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_bipartite),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md)

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
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
# Random bipartite graph
inc <- matrix(sample(0:1, 50, replace = TRUE, prob = c(2, 1)), 10, 5)
g <- graph_from_biadjacency_matrix(inc)
plot(g,
  layout = layout_as_bipartite,
  vertex.color = c("green", "cyan")[V(g)$type + 1]
)


# Two columns
g %>%
  add_layout_(as_bipartite()) %>%
  plot()
```
