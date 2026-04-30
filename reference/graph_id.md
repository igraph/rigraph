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
#> [1] "c5b5a72d-3ca1-43c5-bc27-16b17dc00b3f"
graph_id(V(g))
#> [1] "c5b5a72d-3ca1-43c5-bc27-16b17dc00b3f"
graph_id(E(g))
#> [1] "c5b5a72d-3ca1-43c5-bc27-16b17dc00b3f"

g2 <- g + 1
graph_id(g2)
#> [1] "4d21f746-47f8-4f8c-bb31-430c61b2f853"
```
