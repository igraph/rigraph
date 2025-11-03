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
#> [1] "3f58e9ef-6c31-4390-b02c-86b585a9008b"
graph_id(V(g))
#> [1] "3f58e9ef-6c31-4390-b02c-86b585a9008b"
graph_id(E(g))
#> [1] "3f58e9ef-6c31-4390-b02c-86b585a9008b"

g2 <- g + 1
graph_id(g2)
#> [1] "74aad9fb-688f-407b-a7f8-fa8920c66157"
```
