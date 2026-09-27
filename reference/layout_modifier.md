# Create a layout modifier

This is a constructor function for creating custom layout modifiers.
Layout modifiers can be used with
[`layout_()`](https://r.igraph.org/reference/layout_.md) to modify how
layouts are calculated or to transform the resulting coordinates.

## Usage

``` r
layout_modifier(...)
```

## Arguments

- ...:

  Named arguments that define the modifier. Must include:

  id

  :   A unique identifier string for the modifier

  type

  :   Either `"pre"` for pre-layout or `"post"` for post-layout

  args

  :   A list of arguments to pass to the apply function

  apply

  :   A function with signature `function(graph, layout, modifier_args)`
      that performs the modification

## Value

An object of class `igraph_layout_modifier`.

## See also

[`layout_()`](https://r.igraph.org/reference/layout_.md) for using
modifiers,
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md) for
examples of built-in modifiers.

Other layout modifiers:
[`component_wise()`](https://r.igraph.org/reference/component_wise.md),
[`normalize()`](https://r.igraph.org/reference/normalize.md)

## Examples

``` r
# Create a custom post-layout modifier that scales coordinates
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

# Use the custom modifier
g <- make_ring(10)
coords <- layout_(g, in_circle(), scale_by(2))
plot(g, layout = coords)
```
