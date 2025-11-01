# Weighted graphs

In weighted graphs, a real number is assigned to each (directed or
undirected) edge.

## Usage

``` r
is_weighted(graph)
```

## Arguments

- graph:

  The input graph.

## Value

A logical scalar.

## Details

In igraph edge weights are represented via an edge attribute, called
‘weight’. The `is_weighted()` function only checks that such an
attribute exists. (It does not even checks that it is a numeric edge
attribute.)

Edge weights are used for different purposes by the different functions.
E.g. shortest path functions use it as the cost of the path; community
finding methods use it as the strength of the relationship between two
vertices, etc. Check the manual pages of the functions working with
weighted graphs for details.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
shortest_paths(g, 8, 2)
#> $vpath
#> $vpath[[1]]
#> + 5/10 vertices, from 6f431ab:
#> [1]  8  9 10  1  2
#> 
#> 
#> $epath
#> NULL
#> 
#> $predecessors
#> NULL
#> 
#> $inbound_edges
#> NULL
#> 
E(g)$weight <- seq_len(ecount(g))
shortest_paths(g, 8, 2)
#> $vpath
#> $vpath[[1]]
#> + 7/10 vertices, from 6f431ab:
#> [1] 8 7 6 5 4 3 2
#> 
#> 
#> $epath
#> NULL
#> 
#> $predecessors
#> NULL
#> 
#> $inbound_edges
#> NULL
#> 
```
