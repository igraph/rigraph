# Palette for categories

This is a color blind friendly palette from
<https://jfly.uni-koeln.de/color/>. It has 8 colors.

## Usage

``` r
categorical_pal(n)
```

## Arguments

- n:

  The number of colors in the palette. We simply take the first `n`
  colors from the total 8.

## Value

A character vector of RGB color codes.

## Details

This is the suggested palette for visualizations where vertex colors
mark categories, e.g. community membership.

## Examples

    library(igraphdata)
    data(karate)
    karate <- karate 
      add_layout_(with_fr()) 
      set_vertex_attr("size", value = 10)

    cl_k <- cluster_optimal(karate)

    V(karate)$color <- membership(cl_k)
    karate$palette <- categorical_pal(length(cl_k))
    plot(karate)

## See also

Other palettes:
[`diverging_pal()`](https://r.igraph.org/reference/diverging_pal.md),
[`r_pal()`](https://r.igraph.org/reference/r_pal.md),
[`sequential_pal()`](https://r.igraph.org/reference/sequential_pal.md)
