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
#> [1] "13b3667d-d525-4ef9-a6ec-9e1f751b8d6e"
graph_id(V(g))
#> [1] "13b3667d-d525-4ef9-a6ec-9e1f751b8d6e"
graph_id(E(g))
#> [1] "13b3667d-d525-4ef9-a6ec-9e1f751b8d6e"

g2 <- g + 1
graph_id(g2)
#> [1] "bb5d5276-06bf-4b86-bdce-59f3dd6e8379"
```
