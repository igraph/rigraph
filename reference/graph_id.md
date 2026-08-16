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
#> [1] "c3be1bad-1133-461f-8314-716e7c1be24a"
graph_id(V(g))
#> [1] "c3be1bad-1133-461f-8314-716e7c1be24a"
graph_id(E(g))
#> [1] "c3be1bad-1133-461f-8314-716e7c1be24a"

g2 <- g + 1
graph_id(g2)
#> [1] "d56349c9-0a74-4dcf-9af2-87b348b9a0db"
```
