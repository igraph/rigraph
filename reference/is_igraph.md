# Is this object an igraph graph?

Is this object an igraph graph?

## Usage

``` r
is_igraph(graph)
```

## Arguments

- graph:

  An R object.

## Value

A logical constant, `TRUE` if argument `graph` is a graph object.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
is_igraph(g)
#> [1] TRUE
is_igraph(numeric(10))
#> [1] FALSE
```
