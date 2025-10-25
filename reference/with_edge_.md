# Constructor modifier to add edge attributes

Constructor modifier to add edge attributes

## Usage

``` r
with_edge_(...)
```

## Arguments

- ...:

  The attributes to add. They must be named.

## See also

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
make_(
  ring(10),
  with_edge_(
    color = "red",
    weight = rep(1:2, 5)
  )
) %>%
  plot()
```
