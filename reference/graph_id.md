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
#> [1] "9383431c-900e-4d68-80d4-47ec1fae7d9f"
graph_id(V(g))
#> [1] "9383431c-900e-4d68-80d4-47ec1fae7d9f"
graph_id(E(g))
#> [1] "9383431c-900e-4d68-80d4-47ec1fae7d9f"

g2 <- g + 1
graph_id(g2)
#> [1] "9ab6a1b5-7bab-4f20-b510-8668f4adde8c"
```
