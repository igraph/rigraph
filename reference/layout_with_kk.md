# The Kamada-Kawai layout algorithm

Place the vertices on the plane, or in 3D space, based on a physical
model of springs.

## Usage

``` r
layout_with_kk(
  graph,
  coords = NULL,
  dim = c(2, 3),
  maxiter = 50 * vcount(graph),
  epsilon = 0,
  kkconst = max(vcount(graph), 1),
  weights = NULL,
  minx = NULL,
  maxx = NULL,
  miny = NULL,
  maxy = NULL,
  minz = NULL,
  maxz = NULL,
  niter = deprecated(),
  sigma = deprecated(),
  initemp = deprecated(),
  coolexp = deprecated(),
  start = deprecated()
)

with_kk(...)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored.

- coords:

  If not `NULL`, then the starting coordinates should be given here, in
  a two or three column matrix, depending on the `dim` argument.

- dim:

  Integer scalar, 2 or 3, the dimension of the layout. Two dimensional
  layouts are places on a plane, three dimensional ones in the 3d space.

- maxiter:

  The maximum number of iterations to perform. The algorithm might
  terminate earlier, see the `epsilon` argument.

- epsilon:

  Numeric scalar, the algorithm terminates, if the maximal delta is less
  than this. (See the reference below for what delta means.) If you set
  this to zero, then the function always performs `maxiter` iterations.

- kkconst:

  Numeric scalar, the Kamada-Kawai vertex attraction constant. Typical
  (and default) value is the number of vertices.

- weights:

  Edge weights, larger values will result in longer edges. Note that
  this is the opposite of
  [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md),
  which produces shorter edges for larger weights. Weights must be
  positive.

- minx:

  If not `NULL`, then it must be a numeric vector that gives lower
  boundaries for the ‘x’ coordinates of the vertices. The length of the
  vector must match the number of vertices in the graph.

- maxx:

  Similar to `minx`, but gives the upper boundaries.

- miny:

  Similar to `minx`, but gives the lower boundaries of the ‘y’
  coordinates.

- maxy:

  Similar to `minx`, but gives the upper boundaries of the ‘y’
  coordinates.

- minz:

  Similar to `minx`, but gives the lower boundaries of the ‘z’
  coordinates.

- maxz:

  Similar to `minx`, but gives the upper boundaries of the ‘z’
  coordinates.

- niter, sigma, initemp, coolexp:

  **\[deprecated\]** These arguments are not supported from igraph
  version 0.8.0 and are ignored (with a warning).

- start:

  Deprecated synonym for `coords`, for compatibility.

- ...:

  Passed to `layout_with_kk()`.

## Value

A numeric matrix with two (dim=2) or three (dim=3) columns, and as many
rows as the number of vertices, the x, y and potentially z coordinates
of the vertices.

## Details

See the referenced paper below for the details of the algorithm.

This function was rewritten from scratch in igraph version 0.8.0 and it
follows truthfully the original publication by Kamada and Kawai now.

## Related documentation in the C library

[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Kamada, T. and Kawai, S.: An Algorithm for Drawing General Undirected
Graphs. *Information Processing Letters*, 31/1, 7–15, 1989.

## See also

[`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md),
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
[`layout_with_gem()`](https://r.igraph.org/reference/layout_with_gem.md),
[`layout_with_graphopt()`](https://r.igraph.org/reference/layout_with_graphopt.md),
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
g <- make_ring(10)
E(g)$weight <- rep(1:2, length.out = ecount(g))
plot(g, layout = layout_with_kk, edge.label = E(g)$weight)

```
