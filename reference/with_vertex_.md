# Constructor modifier to add vertex attributes

Constructor modifier to add vertex attributes

## Usage

``` r
with_vertex_(...)
```

## Arguments

- ...:

  The attributes to add. They must be named.

## See also

Constructor modifiers (and related functions)
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
make_(
  ring(10),
  with_vertex_(
    color = "#7fcdbb",
    frame.color = "#7fcdbb",
    name = LETTERS[1:10]
  )
) %>%
  plot()
```
