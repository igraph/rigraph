# Rewiring edges of a graph

See the links below for the implemented rewiring methods.

## Usage

``` r
rewire(graph, with)
```

## Arguments

- graph:

  The graph to rewire

- with:

  A function call to one of the rewiring methods, see details below.

## Value

The rewired graph.

## See also

Other rewiring functions:
[`each_edge()`](https://r.igraph.org/reference/each_edge.md),
[`keeping_degseq()`](https://r.igraph.org/reference/keeping_degseq.md)

## Examples

``` r
g <- make_ring(10)
g %>%
  rewire(each_edge(p = .1, loops = FALSE)) %>%
  plot(layout = layout_in_circle)

print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))
#> IGRAPH 03bb3c5 U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + graph attributes:
#> | + name:
#> |   [1] "Ring graph"
#> | + mutual:
#> |   [1] FALSE
#> | + circular:
#> |   [1] TRUE
#> + edges from 03bb3c5:
#>  [1] 5-- 9 3-- 7 8-- 9 5-- 7 1-- 4 3--10 4-- 6 2--10 6-- 8 1-- 2
```
