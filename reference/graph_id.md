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
#> [1] "73278394-f242-41a7-9984-336378b7377e"
graph_id(V(g))
#> [1] "73278394-f242-41a7-9984-336378b7377e"
graph_id(E(g))
#> [1] "73278394-f242-41a7-9984-336378b7377e"

g2 <- g + 1
graph_id(g2)
#> [1] "e35a6287-cf8a-4e62-89e1-3c43e6d57ae5"
```
