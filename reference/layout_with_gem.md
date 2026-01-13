# The GEM layout algorithm

Place vertices on the plane using the GEM force-directed layout
algorithm.

## Usage

``` r
layout_with_gem(
  graph,
  coords = NULL,
  maxiter = 40 * vcount(graph)^2,
  temp.max = max(vcount(graph), 1),
  temp.min = 1/10,
  temp.init = sqrt(max(vcount(graph), 1))
)

with_gem(...)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

- coords:

  If not `NULL`, then the starting coordinates should be given here, in
  a two or three column matrix, depending on the `dim` argument.

- maxiter:

  The maximum number of iterations to perform. Updating a single vertex
  counts as an iteration. A reasonable default is 40 \* n \* n, where n
  is the number of vertices. The original paper suggests 4 \* n \* n,
  but this usually only works if the other parameters are set up
  carefully.

- temp.max:

  The maximum allowed local temperature. A reasonable default is the
  number of vertices.

- temp.min:

  The global temperature at which the algorithm terminates (even before
  reaching `maxiter` iterations). A reasonable default is 1/10.

- temp.init:

  Initial local temperature of all vertices. A reasonable default is the
  square root of the number of vertices.

- ...:

  Passed to `layout_with_gem()`.

## Value

A numeric matrix with two columns, and as many rows as the number of
vertices.

## Details

See the referenced paper below for the details of the algorithm.

## Related documentation in the C library

[`layout_gem()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_gem),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## References

Arne Frick, Andreas Ludwig, Heiko Mehldau: A Fast Adaptive Layout
Algorithm for Undirected Graphs, *Proc. Graph Drawing 1994*, LNCS 894,
pp. 388-403, 1995.

## See also

[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
[`tkplot()`](https://r.igraph.org/reference/tkplot.md)

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
[`layout_nicely()`](https://r.igraph.org/reference/layout_nicely.md),
[`layout_on_grid()`](https://r.igraph.org/reference/layout_on_grid.md),
[`layout_on_sphere()`](https://r.igraph.org/reference/layout_on_sphere.md),
[`layout_randomly()`](https://r.igraph.org/reference/layout_randomly.md),
[`layout_with_dh()`](https://r.igraph.org/reference/layout_with_dh.md),
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
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
set.seed(42)
g <- make_ring(10)
plot(g, layout = layout_with_gem)

```
