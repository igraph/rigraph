# Merging graph layouts

Place several graphs on the same layout

## Usage

``` r
merge_coords(graphs, layouts, method = "dla")

layout_components(graph, layout = layout_with_kk, ...)
```

## Arguments

- graphs:

  A list of graph objects.

- layouts:

  A list of two-column matrices.

- method:

  Character constant giving the method to use. Right now only `dla` is
  implemented.

- graph:

  The input graph.

- layout:

  A function object, the layout function to use.

- ...:

  Additional arguments to pass to the `layout` layout function.

## Value

A matrix with two columns and as many lines as the total number of
vertices in the graphs.

## Details

`merge_coords()` takes a list of graphs and a list of coordinates and
places the graphs in a common layout. The method to use is chosen via
the `method` parameter, although right now only the `dla` method is
implemented.

The `dla` method covers the graph with circles. Then it sorts the graphs
based on the number of vertices first and places the largest graph at
the center of the layout. Then the other graphs are placed in decreasing
order via a DLA (diffision limited aggregation) algorithm: the graph is
placed randomly on a circle far away from the center and a random walk
is conducted until the graph walks into the larger graphs already placed
or walks too far from the center of the layout.

The `layout_components()` function disassembles the graph first into
maximal connected components and calls the supplied `layout` function
for each component separately. Finally it merges the layouts via calling
`merge_coords()`.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

[`plot.igraph()`](https://r.igraph.org/reference/plot.igraph.md),
[`tkplot()`](https://r.igraph.org/reference/tkplot.md),
[`layout()`](https://r.igraph.org/reference/layout_.md),
[`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md)

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
[`layout_with_kk()`](https://r.igraph.org/reference/layout_with_kk.md),
[`layout_with_lgl()`](https://r.igraph.org/reference/layout_with_lgl.md),
[`layout_with_mds()`](https://r.igraph.org/reference/layout_with_mds.md),
[`layout_with_sugiyama()`](https://r.igraph.org/reference/layout_with_sugiyama.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# create 20 scale-free graphs and place them in a common layout
graphs <- lapply(sample(5:20, 20, replace = TRUE),
  barabasi.game,
  directed = FALSE
)
layouts <- lapply(graphs, layout_with_kk)
lay <- merge_coords(graphs, layouts)
g <- disjoint_union(graphs)
plot(g, layout = lay, vertex.size = 3, labels = NA, edge.color = "black")
```
