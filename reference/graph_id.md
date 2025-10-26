# Get the id of a graph

Graph ids are used to check that a vertex or edge sequence belongs to a
graph. If you create a new graph by changing the structure of a graph,
the new graph will have a new id. Changing the attributes will not
change the id.

## Usage

``` r
graph_id(x, ...)
```

## Arguments

- x:

  A graph or a vertex sequence or an edge sequence.

- ...:

  Not used currently.

## Value

The id of the graph, a character scalar. For vertex and edge sequences
the id of the graph they were created from.

## Examples

``` r
g <- make_ring(10)
graph_id(g)
#> [1] "5fe1e086-4150-4ddc-8b01-66f5a687f7ff"
graph_id(V(g))
#> [1] "5fe1e086-4150-4ddc-8b01-66f5a687f7ff"
graph_id(E(g))
#> [1] "5fe1e086-4150-4ddc-8b01-66f5a687f7ff"

g2 <- g + 1
graph_id(g2)
#> [1] "2b70d8a4-9248-4953-87e4-dc2e3b05ab42"
```
