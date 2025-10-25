# Sequential palette

This is the ‘OrRd’ palette from <https://colorbrewer2.org/>. It has at
most nine colors.

## Usage

``` r
sequential_pal(n)
```

## Arguments

- n:

  The number of colors in the palette. The maximum is nine currently.

## Value

A character vector of RGB color codes.

## Details

Use this palette, if vertex colors mark some ordinal quantity, e.g. some
centrality measure, or some ordinal vertex covariate, like the age of
people, or their seniority level.

## See also

Other palettes:
[`categorical_pal()`](https://r.igraph.org/reference/categorical_pal.md),
[`diverging_pal()`](https://r.igraph.org/reference/diverging_pal.md),
[`r_pal()`](https://r.igraph.org/reference/r_pal.md)

## Examples

``` r
library(igraphdata)
data(karate)
karate <- karate %>%
  add_layout_(with_kk()) %>%
  set_vertex_attr("size", value = 10)
#> This graph was created by an old(er) igraph version.
#> ℹ Call `igraph::upgrade_graph()` on it to use with the current igraph version.
#> For now we convert it on the fly...

V(karate)$color <- scales::dscale(degree(karate) %>% cut(5), sequential_pal)
plot(karate)
```
