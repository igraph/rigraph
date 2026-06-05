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
#> [1] "a0ca1897-2b09-4b8a-b21f-37566f65ef2e"
graph_id(V(g))
#> [1] "a0ca1897-2b09-4b8a-b21f-37566f65ef2e"
graph_id(E(g))
#> [1] "a0ca1897-2b09-4b8a-b21f-37566f65ef2e"

g2 <- g + 1
graph_id(g2)
#> [1] "11ce1c38-b3e8-4f63-af4e-163f737e0c8b"
```
