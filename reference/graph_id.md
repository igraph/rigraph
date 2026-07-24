# Get the ID of a graph

Graph IDs are used to check that a vertex or edge sequence belongs to a
graph. If you create a new graph by changing the structure of a graph,
the new graph will have a new ID. Changing the attributes will not
change the ID.

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

The ID of the graph, a character scalar. For vertex and edge sequences
the ID of the graph they were created from.

## Examples

``` r
g <- make_ring(10)
graph_id(g)
#> [1] "9a352c7f-bef7-4f31-b4a1-6c6f50ac9367"
graph_id(V(g))
#> [1] "9a352c7f-bef7-4f31-b4a1-6c6f50ac9367"
graph_id(E(g))
#> [1] "9a352c7f-bef7-4f31-b4a1-6c6f50ac9367"

g2 <- g + 1
graph_id(g2)
#> [1] "330918f1-a980-443e-8bf0-9968fed89347"
```
