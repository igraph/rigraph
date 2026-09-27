# Magrittr's pipes

igraph re-exports the `%>%` operator of magrittr, because we find it
very useful. Please see the documentation in the `magrittr` package.

## Arguments

- lhs:

  Left hand side of the pipe.

- rhs:

  Right hand side of the pipe.

## Value

Result of applying the right hand side to the result of the left hand
side.

## Examples

``` r
make_ring(10) %>%
  add_edges(c(1, 6)) %>%
  plot()
```
