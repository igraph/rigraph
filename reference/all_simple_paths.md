# List all simple paths from one source

This function lists all simple paths from one source vertex to another
vertex or vertices. A path is simple if contains no repeated vertices.

## Usage

``` r
all_simple_paths(
  graph,
  from,
  to = V(graph),
  mode = c("out", "in", "all", "total"),
  cutoff = -1
)
```

## Arguments

- graph:

  The input graph.

- from:

  The source vertex.

- to:

  The target vertex of vertices. Defaults to all vertices.

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the corresponding undirected
  graph will be used, i.e. not directed paths are searched. This
  argument is ignored for undirected graphs.

- cutoff:

  Maximum length of the paths that are considered. If negative, no
  cutoff is used.

## Value

A list of integer vectors, each integer vector is a path from the source
vertex to one of the target vertices. A path is given by its vertex ids.

## Details

Note that potentially there are exponentially many paths between two
vertices of a graph, and you may run out of memory when using this
function, if your graph is lattice-like.

This function ignores multiple and loop edges.

## See also

Other paths: [`diameter()`](https://r.igraph.org/reference/diameter.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`eccentricity()`](https://r.igraph.org/reference/eccentricity.md),
[`graph_center()`](https://r.igraph.org/reference/graph_center.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

## Examples

``` r
g <- make_ring(10)
all_simple_paths(g, 1, 5)
#> [[1]]
#> + 5/10 vertices, from 435d5e2:
#> [1] 1 2 3 4 5
#> 
#> [[2]]
#> + 7/10 vertices, from 435d5e2:
#> [1]  1 10  9  8  7  6  5
#> 
all_simple_paths(g, 1, c(3, 5))
#> [[1]]
#> + 3/10 vertices, from 435d5e2:
#> [1] 1 2 3
#> 
#> [[2]]
#> + 5/10 vertices, from 435d5e2:
#> [1] 1 2 3 4 5
#> 
#> [[3]]
#> + 7/10 vertices, from 435d5e2:
#> [1]  1 10  9  8  7  6  5
#> 
#> [[4]]
#> + 9/10 vertices, from 435d5e2:
#> [1]  1 10  9  8  7  6  5  4  3
#> 
```
