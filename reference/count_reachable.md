# Count reachable vertices

**\[experimental\]**

## Usage

``` r
count_reachable(graph, mode = c("out", "in", "all", "total"))
```

## Arguments

- graph:

  The input graph.

- mode:

  Character constant, defines how edge directions are considered in
  directed graphs. `"out"` counts vertices reachable via outgoing edges,
  `"in"` counts vertices from which the current vertex is reachable via
  incoming edges, `"all"` or `"total"` ignores edge directions. This
  parameter is ignored for undirected graphs.

## Value

An integer vector of length `vcount(graph)`. The i-th element is the
number of vertices reachable from vertex i (including vertex i itself).

## Details

Counts the number of vertices reachable from each vertex in the graph.

For each vertex in the graph, this function counts how many vertices are
reachable from it, including the vertex itself. A vertex is reachable
from another if there is a directed path between them. For undirected
graphs, two vertices are reachable from each other if they are in the
same connected component.

## See also

[`components()`](https://r.igraph.org/reference/components.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`is_connected()`](https://r.igraph.org/reference/components.md)

Connected components
[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`decompose()`](https://r.igraph.org/reference/decompose.md),
[`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`count_reachable()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_count_reachable).

## Examples

``` r
# In a directed path graph, the reachability depends on direction
g <- make_graph(~ 1 -+ 2 -+ 3 -+ 4 -+ 5)
count_reachable(g, mode = "out")
#> [1] 5 4 3 2 1
count_reachable(g, mode = "in")
#> [1] 1 2 3 4 5

# In an undirected graph, reachability is the same in all directions
g2 <- make_graph(~ 1 - 2 - 3 - 4 - 5)
count_reachable(g2, mode = "out")
#> [1] 5 5 5 5 5

# A graph with multiple components
g3 <- make_graph(~ 1 - 2 - 3, 4 - 5, 6)
count_reachable(g3, mode = "all")
#> [1] 3 3 3 2 2 1
```
