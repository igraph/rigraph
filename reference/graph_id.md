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
#> [1] "00c9d6a0-d61c-42b2-9be3-c2ed29ec893d"
graph_id(V(g))
#> [1] "00c9d6a0-d61c-42b2-9be3-c2ed29ec893d"
graph_id(E(g))
#> [1] "00c9d6a0-d61c-42b2-9be3-c2ed29ec893d"

g2 <- g + 1
graph_id(g2)
#> [1] "dffc03fd-9357-4c5e-8c14-ed38bad5a7e9"
```
