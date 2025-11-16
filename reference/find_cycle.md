# Finds a cycle in a graph, if there is one

**\[experimental\]**

This function returns a cycle of the graph, in terms of both its
vertices and edges. If the graph is acyclic, it returns empty vertex and
edge sequences.

Use [`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md) to
determine if a graph has cycles, without returning a specific cycle.

## Usage

``` r
find_cycle(graph, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  The input graph.

- mode:

  Character constant specifying how to handle directed graphs. `out`
  follows edge directions, `in` follows edges in the reverse direction,
  and `all` ignores edge directions. Ignored in undirected graphs.

## Value

A list of integer vectors, each integer vector is a path from the source
vertex to one of the target vertices. A path is given by its vertex ids.

## See also

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

## Related documentation in the C library

[`find_cycle()`](https://igraph.org/c/html/latest/igraph-Cycles.html#igraph_find_cycle).

## Examples

``` r
g <- make_lattice(c(3, 3))
find_cycle(g)
#> $vertices
#> + 4/9 vertices, from 94e0b65:
#> [1] 9 6 5 8
#> 
#> $edges
#> + 4/12 edges from 94e0b65:
#> [1] 8--9 6--9 5--6 5--8
#> 

# Empty results are returned for acyclic graphs
find_cycle(sample_tree(5))
#> $vertices
#> + 0/5 vertices, from cba0da4:
#> 
#> $edges
#> + 0/4 edges from cba0da4:
#> 
```
