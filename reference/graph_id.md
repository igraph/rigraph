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
#> [1] "7ec24dfb-9935-4126-aa57-34da862a287f"
graph_id(V(g))
#> [1] "7ec24dfb-9935-4126-aa57-34da862a287f"
graph_id(E(g))
#> [1] "7ec24dfb-9935-4126-aa57-34da862a287f"

g2 <- g + 1
graph_id(g2)
#> [1] "df0e7758-cd7a-44ba-a1eb-b364f9da95bc"
```
