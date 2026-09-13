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
#> [1] "c166cbb6-45e6-4520-9688-414a17b2dfad"
graph_id(V(g))
#> [1] "c166cbb6-45e6-4520-9688-414a17b2dfad"
graph_id(E(g))
#> [1] "c166cbb6-45e6-4520-9688-414a17b2dfad"

g2 <- g + 1
graph_id(g2)
#> [1] "9ef7beab-a31e-4f4d-bc4c-9a354142d72b"
```
