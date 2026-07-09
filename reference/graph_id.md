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
#> [1] "7ca9276d-f4cd-4652-83e6-b33e3350ba3a"
graph_id(V(g))
#> [1] "7ca9276d-f4cd-4652-83e6-b33e3350ba3a"
graph_id(E(g))
#> [1] "7ca9276d-f4cd-4652-83e6-b33e3350ba3a"

g2 <- g + 1
graph_id(g2)
#> [1] "bf98ab43-08c8-4791-bd27-8ffc5ee04477"
```
