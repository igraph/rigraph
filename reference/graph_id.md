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
#> [1] "70078a5e-b7de-4e90-8c6f-b96ab26bd671"
graph_id(V(g))
#> [1] "70078a5e-b7de-4e90-8c6f-b96ab26bd671"
graph_id(E(g))
#> [1] "70078a5e-b7de-4e90-8c6f-b96ab26bd671"

g2 <- g + 1
graph_id(g2)
#> [1] "c4981bfd-37a6-4c2c-ace8-2ed2036d9108"
```
