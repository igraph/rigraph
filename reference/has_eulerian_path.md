# Find Eulerian paths or cycles in a graph

`has_eulerian_path()` and `has_eulerian_cycle()` checks whether there is
an Eulerian path or cycle in the input graph. `eulerian_path()` and
`eulerian_cycle()` return such a path or cycle if it exists, and throws
an error otherwise.

## Usage

``` r
has_eulerian_path(graph)

has_eulerian_cycle(graph)

eulerian_path(graph)

eulerian_cycle(graph)
```

## Arguments

- graph:

  An igraph graph object

## Value

For `has_eulerian_path()` and `has_eulerian_cycle()`, a logical value
that indicates whether the graph contains an Eulerian path or cycle. For
`eulerian_path()` and `eulerian_cycle()`, a named list with two entries:

- epath:

  A vector containing the edge ids along the Eulerian path or cycle.

- vpath:

  A vector containing the vertex ids along the Eulerian path or cycle.

## Details

`has_eulerian_path()` decides whether the input graph has an Eulerian
*path*, i.e. a path that passes through every edge of the graph exactly
once, and returns a logical value as a result. `eulerian_path()` returns
a possible Eulerian path, described with its edge and vertex sequence,
or throws an error if no such path exists.

`has_eulerian_cycle()` decides whether the input graph has an Eulerian
*cycle*, i.e. a path that passes through every edge of the graph exactly
once and that returns to its starting point, and returns a logical value
as a result. `eulerian_cycle()` returns a possible Eulerian cycle,
described with its edge and vertex sequence, or throws an error if no
such cycle exists.

## See also

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

## Related documentation in the C library

[`is_eulerian()`](https://igraph.org/c/html/latest/igraph-Cycles.html#igraph_is_eulerian),
[`eulerian_path()`](https://igraph.org/c/html/latest/igraph-Cycles.html#igraph_eulerian_path),
[`eulerian_cycle()`](https://igraph.org/c/html/latest/igraph-Cycles.html#igraph_eulerian_cycle).

## Examples

``` r
g <- make_graph(~ A - B - C - D - E - A - F - D - B - F - E)

has_eulerian_path(g)
#> [1] TRUE
eulerian_path(g)
#> $epath
#> + 10/10 edges from f0e2c11 (vertex names):
#>  [1] A--B B--C C--D B--D B--F A--F A--E D--E D--F E--F
#> 
#> $vpath
#> + 11/6 vertices, named, from f0e2c11:
#>  [1] A B C D B F A E D F E
#> 

has_eulerian_cycle(g)
#> [1] FALSE
try(eulerian_cycle(g))
#> Error in eulerian_cycle_impl(graph = graph) : 
#>   At vendor/cigraph/src/paths/eulerian.c:615 : The graph does not have an Eulerian cycle. Input problem has no solution
```
