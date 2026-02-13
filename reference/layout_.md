# Graph layouts

This is a generic function to apply a layout function to a graph.

## Usage

``` r
layout_(graph, layout, ...)

# S3 method for class 'igraph_layout_spec'
print(x, ...)

# S3 method for class 'igraph_layout_modifier'
print(x, ...)
```

## Arguments

- graph:

  The input graph.

- layout:

  The layout specification. It must be a call to a layout specification
  function.

- ...:

  Further modifiers, see a complete list below. For the
  [`print()`](https://rdrr.io/r/base/print.html) methods, it is ignored.

- x:

  The layout specification

## Value

The return value of the layout function, usually a two column matrix.
For 3D layouts a three column matrix.

## Details

There are two ways to calculate graph layouts in igraph. The first way
is to call a layout function (they all have prefix `layout_()` on a
graph, to get the vertex coordinates.

The second way (new in igraph 0.8.0), has two steps, and it is more
flexible. First you call a layout specification function (the one
without the `layout_()` prefix, and then `layout_()` (or
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md)) to
perform the layouting.

The second way is preferred, as it is more flexible. It allows
operations before and after the layouting. E.g. using the
[`component_wise()`](https://r.igraph.org/reference/component_wise.md)
argument, the layout can be calculated separately for each component,
and then merged to get the final results.

## Modifiers

Modifiers modify how a layout calculation is performed. Modifiers are
applied in the order they are specified as arguments to `layout_()`.

There are two types of modifiers:

- **Pre-layout modifiers** affect how the layout is calculated. Only one
  pre-layout modifier can be used at a time.

- **Post-layout modifiers** transform the resulting coordinates.
  Multiple post-layout modifiers can be chained together.

Currently implemented modifiers:

- [`component_wise()`](https://r.igraph.org/reference/component_wise.md)
  (pre-layout) calculates the layout separately for each component of
  the graph, and then merges them.

- [`normalize()`](https://r.igraph.org/reference/normalize.md)
  (post-layout) scales the layout to a square.

Custom modifiers can be created using the
[`layout_modifier()`](https://r.igraph.org/reference/layout_modifier.md)
function. A custom modifier must specify:

- `id`: A unique identifier string for the modifier

- `type`: Either `"pre"` for pre-layout or `"post"` for post-layout

- `args`: A list of arguments to pass to the apply function

- `apply`: A function with signature
  `function(graph, layout, modifier_args)` that performs the
  modification. For pre-layout modifiers, `layout` is the layout
  specification. For post-layout modifiers, `layout` is the coordinate
  matrix to transform.

## See also

[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md) to add
the layout to the graph as an attribute.

Other graph layouts:
[`add_layout_()`](https://r.igraph.org/reference/add_layout_.md),
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
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
[`merge_coords()`](https://r.igraph.org/reference/merge_coords.md),
[`norm_coords()`](https://r.igraph.org/reference/norm_coords.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Examples

``` r
g <- make_ring(10) + make_full_graph(5)
coords <- layout_(g, as_star())
plot(g, layout = coords)


# Using modifiers
g <- make_ring(10) + make_ring(5)
coords <- layout_(g, in_circle(), component_wise(), normalize())
plot(g, layout = coords)


# Creating a custom post-layout modifier
scale_by <- function(factor) {
  layout_modifier(
    id = "scale_by",
    type = "post",
    args = list(factor = factor),
    apply = function(graph, layout, modifier_args) {
      layout * modifier_args$factor
    }
  )
}
coords <- layout_(make_ring(10), in_circle(), scale_by(3))
plot(make_ring(10), layout = coords)
```
