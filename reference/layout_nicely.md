# Choose an appropriate graph layout algorithm automatically

This function tries to choose an appropriate graph layout algorithm for
the graph, automatically, based on a simple algorithm. See details
below.

## Usage

``` r
layout_nicely(graph, dim = 2, ...)

nicely(...)
```

## Arguments

- graph:

  The input graph

- dim:

  Dimensions, should be 2 or 3.

- ...:

  For `layout_nicely()` the extra arguments are passed to the real
  layout function. For `nicely()` all argument are passed to
  `layout_nicely()`.

## Value

A numeric matrix with two or three columns.

## Details

`layout_nicely()` tries to choose an appropriate layout function for the
supplied graph, and uses that to generate the layout. The current
implementation works like this:

1.  If the graph has a graph attribute called ‘layout’, then this is
    used. If this attribute is an R function, then it is called, with
    the graph and any other extra arguments.

2.  Otherwise, if the graph has vertex attributes called ‘x’ and ‘y’,
    then these are used as coordinates. If the graph has an additional
    ‘z’ vertex attribute, that is also used.

3.  Otherwise, if the graph is a forest and has less than 30 vertices,
    [`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md)
    is used.

4.  Otherwise, if the graph is connected and has less than 1000
    vertices, the Fruchterman-Reingold layout is used, by calling
    [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md).

5.  Otherwise the DrL layout is used,
    [`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md)
    is called.

In layout algorithm implementations, an argument named ‘weights’ is
typically used to specify the weights of the edges if the layout
algorithm supports them. In this case, omitting ‘weights’ or setting it
to `NULL` will make igraph use the 'weight' edge attribute from the
graph if it is present. However, most layout algorithms do not support
non-positive weights, so `layout_nicely()` would fail if you simply
called it on your graph without specifying explicit weights and the
weights happened to include non-positive numbers. We strive to ensure
that `layout_nicely()` works out-of-the-box for most graphs, so the rule
is that if you omit ‘weights’ or set it to `NULL` and `layout_nicely()`
would end up calling
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md)
or
[`layout_with_drl()`](https://r.igraph.org/reference/layout_with_drl.md),
we do not forward the weights to these functions and issue a warning
about this. You can use `weights = NA` to silence the warning.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[`layout_align()`](https://igraph.org/c/html/latest/igraph-Layout.html#igraph_layout_align),
[[`is_forest()`](https://r.igraph.org/reference/is_forest.md)](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_forest),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md)

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
[`layout_as_tree()`](https://r.igraph.org/reference/layout_as_tree.md),
[`layout_in_circle()`](https://r.igraph.org/reference/layout_in_circle.md),
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
