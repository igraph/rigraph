# Decompose a graph into components

Creates a separate graph for each connected component of a graph.

## Usage

``` r
decompose(graph, mode = c("weak", "strong"), max.comps = NA, min.vertices = 0)
```

## Arguments

- graph:

  The original graph.

- mode:

  Character constant giving the type of the components, wither `weak`
  for weakly connected components or `strong` for strongly connected
  components.

- max.comps:

  The maximum number of components to return. The first `max.comps`
  components will be returned (which hold at least `min.vertices`
  vertices, see the next parameter), the others will be ignored. Supply
  `NA` here if you don't want to limit the number of components.

- min.vertices:

  The minimum number of vertices a component should contain in order to
  place it in the result list. E.g. supply 2 here to ignore isolate
  vertices.

## Value

A list of graph objects.

## Related documentation in the C library

[`decompose()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_decompose)

## See also

[`is_connected()`](https://r.igraph.org/reference/components.md) to
decide whether a graph is connected,
[`components()`](https://r.igraph.org/reference/components.md) to
calculate the connected components of a graph.

Connected components
[`articulation_points()`](https://r.igraph.org/reference/articulation_points.md),
[`biconnected_components()`](https://r.igraph.org/reference/biconnected_components.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`count_reachable()`](https://r.igraph.org/reference/count_reachable.md),
[`is_biconnected()`](https://r.igraph.org/reference/is_biconnected.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# the diameter of each component in a random graph
g <- sample_gnp(1000, 1 / 1000)
components <- decompose(g, min.vertices = 2)
sapply(components, diameter)
#>   [1] 23  3  9  9  1  6 12  2  4  2  4  4  6  2  4  2  3  1  1  1  2  4  5  4  2
#>  [26]  3  3  7  3  2  9  5  1  2  6  1  3  2  2  1  4 12  3  4  6  1  1  4  2  2
#>  [51]  3  2  2  2  9  2  1  1  4  3  1  2  2  2  6  3  2  2  2  3  1  1  5  2  2
#>  [76]  2  2  1  2  1  2  3  1  1  1  4  1  3  1  1  3  1  5  1  1  2  2  1  2  1
#> [101]  1  1  2  1  4  1  1  2  1  1  1  1  1  1  4  1  1  2  2  2  1  2  1  1  1
#> [126]  1
```
