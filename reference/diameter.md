# Diameter of a graph

The diameter of a graph is the length of the longest geodesic.

## Usage

``` r
diameter(graph, directed = TRUE, unconnected = TRUE, weights = NULL)

get_diameter(graph, directed = TRUE, unconnected = TRUE, weights = NULL)

farthest_vertices(graph, directed = TRUE, unconnected = TRUE, weights = NULL)
```

## Arguments

- graph:

  The graph to analyze.

- directed:

  Logical, whether directed or undirected paths are to be considered.
  This is ignored for undirected graphs.

- unconnected:

  Logical, what to do if the graph is unconnected. If FALSE, the
  function will return a number that is one larger the largest possible
  diameter, which is always the number of vertices. If TRUE, the
  diameters of the connected components will be calculated and the
  largest one will be returned.

- weights:

  Optional positive weight vector for calculating weighted distances. If
  the graph has a `weight` edge attribute, then this is used by default.

## Value

A numeric constant for `diameter()`, a numeric vector for
`get_diameter()`. `farthest_vertices()` returns a list with two entries:

- `vertices`:

  The two vertices that are the farthest.

- `distance`:

  Their distance.

## Details

The diameter is calculated by using a breadth-first search like method.

`get_diameter()` returns a path with the actual diameter. If there are
many shortest paths of the length of the diameter, then it returns the
first one found.

`farthest_vertices()` returns two vertex ids, the vertices which are
connected by the diameter path.

## See also

[`distances()`](https://r.igraph.org/reference/distances.md)

Other paths:
[`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`eccentricity()`](https://r.igraph.org/reference/eccentricity.md),
[`graph_center()`](https://r.igraph.org/reference/graph_center.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
g2 <- delete_edges(g, c(1, 2, 1, 10))
diameter(g2, unconnected = TRUE)
#> [1] 7
diameter(g2, unconnected = FALSE)
#> [1] Inf

## Weighted diameter
set.seed(1)
g <- make_ring(10)
E(g)$weight <- sample(seq_len(ecount(g)))
diameter(g)
#> [1] 27
get_diameter(g)
#> + 5/10 vertices, from 9bdcb0b:
#> [1]  1 10  9  8  7
diameter(g, weights = NA)
#> [1] 5
get_diameter(g, weights = NA)
#> + 6/10 vertices, from 9bdcb0b:
#> [1] 1 2 3 4 5 6
```
