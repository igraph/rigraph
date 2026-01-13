# The Reingold-Tilford graph layout algorithm

A tree-like layout, it is perfect for trees, acceptable for graphs with
not too many cycles.

## Usage

``` r
layout_as_tree(
  graph,
  root = numeric(),
  circular = FALSE,
  rootlevel = numeric(),
  mode = c("out", "in", "all"),
  flip.y = TRUE
)

as_tree(...)
```

## Arguments

- graph:

  The input graph.

- root:

  The index of the root vertex or root vertices. If this is a non-empty
  vector then the supplied vertex ids are used as the roots of the trees
  (or a single tree if the graph is connected). If it is an empty
  vector, then the root vertices are automatically calculated based on
  topological sorting, performed with the opposite mode than the `mode`
  argument. After the vertices have been sorted, one is selected from
  each component.

- circular:

  Logical scalar, whether to plot the tree in a circular fashion.
  Defaults to `FALSE`, so the tree branches are going bottom-up (or
  top-down, see the `flip.y` argument.

- rootlevel:

  This argument can be useful when drawing forests which are not trees
  (i.e. they are unconnected and have tree components). It specifies the
  level of the root vertices for every tree in the forest. It is only
  considered if the `roots` argument is not an empty vector.

- mode:

  Specifies which edges to consider when building the tree. If it is
  ‘out’, then only the outgoing, if it is ‘in’, then only the incoming
  edges of a parent are considered. If it is ‘all’ then all edges are
  used (this was the behavior in igraph 0.5 and before). This parameter
  also influences how the root vertices are calculated, if they are not
  given. See the `roots` parameter.

- flip.y:

  Logical scalar, whether to flip the ‘y’ coordinates. The default is
  flipping because that puts the root vertex on the top.

- ...:

  Passed to `layout_as_tree()`.

## Value

A numeric matrix with two columns, and one row for each vertex.

## Details

Arranges the nodes in a tree where the given node is used as the root.
The tree is directed downwards and the parents are centered above its
children. For the exact algorithm, the reference below.

If the given graph is not a tree, a breadth-first search is executed
first to obtain a possible spanning tree.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)

## References

Reingold, E and Tilford, J (1981). Tidier drawing of trees. *IEEE Trans.
on Softw. Eng.*, SE-7(2):223–228.

## See also

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`layout_()`](https://r.igraph.org/reference/layout_.md),
[`layout_as_bipartite()`](https://r.igraph.org/reference/layout_as_bipartite.md),
[`layout_as_star()`](https://r.igraph.org/reference/layout_as_star.md),
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

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Examples

``` r
tree <- make_tree(20, 3)
plot(tree, layout = layout_as_tree)

plot(tree, layout = layout_as_tree(tree, flip.y = FALSE))

plot(tree, layout = layout_as_tree(tree, circular = TRUE))


tree2 <- make_tree(10, 3) + make_tree(10, 2)
plot(tree2, layout = layout_as_tree)

plot(tree2, layout = layout_as_tree(tree2,
  root = c(1, 11),
  rootlevel = c(2, 1)
))
```
