# Align a vertex layout This function centers a vertex layout on the coordinate system origin and rotates the layout to achieve a visually pleasing alignment with the coordinate axes. Doing this is particularly useful with force-directed layouts such as [`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md).

Align a vertex layout This function centers a vertex layout on the
coordinate system origin and rotates the layout to achieve a visually
pleasing alignment with the coordinate axes. Doing this is particularly
useful with force-directed layouts such as
[`layout_with_fr()`](https://r.igraph.org/reference/layout_with_fr.md).

## Usage

``` r
align_layout(graph, layout)
```

## Arguments

- graph:

  The graph whose layout is to be aligned.

- layout:

  A matrix whose rows are the coordinates of vertices.

## Value

modified layout matrix

## Related documentation in the C library

[`layout_align()`](https://igraph.org/c/html/0.10.17/igraph-Layout.html#igraph_layout_align)

## Examples

``` r
g <- make_lattice(c(3, 3))
l1 <- layout_with_fr(g)
l2 <- align_layout(g,l1)
plot(g, layout = l1)

plot(g, layout = l2)
```
