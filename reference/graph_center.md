# Central vertices of a graph

**\[experimental\]**

The center of a graph is the set of its vertices with minimal
eccentricity.

## Usage

``` r
graph_center(graph, ..., weights = NULL, mode = c("all", "out", "in", "total"))
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- ...:

  These dots are for future extensions and must be empty.

- weights:

  Possibly a numeric vector giving edge weights. If this is `NULL` and
  the graph has a `weight` edge attribute, then the attribute is used.
  If this is `NA` then no weights are used (even if the graph has a
  `weight` attribute). In a weighted graph, the length of a path is the
  sum of the weights of its constituent edges.

- mode:

  Character constant, gives whether the shortest paths to or from the
  given vertices should be calculated for directed graphs. If `out` then
  the shortest paths *from* the vertex, if `in` then *to* it will be
  considered. If `all`, the default, then the graph is treated as
  undirected, i.e. edge directions are not taken into account. This
  argument is ignored for undirected graphs.

## Value

The vertex IDs of the central vertices.

## See also

[`eccentricity()`](https://r.igraph.org/reference/eccentricity.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

Other paths:
[`all_simple_paths()`](https://r.igraph.org/reference/all_simple_paths.md),
[`diameter()`](https://r.igraph.org/reference/diameter.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`eccentricity()`](https://r.igraph.org/reference/eccentricity.md),
[`radius()`](https://r.igraph.org/reference/radius.md)

## Related documentation in the C library

[`graph_center_dijkstra()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_graph_center_dijkstra).

## Examples

``` r
tree <- make_tree(100, 7)
graph_center(tree)
#> + 2/100 vertices, from a5e128b:
#> [1] 1 2
graph_center(tree, mode = "in")
#> + 1/100 vertex, from a5e128b:
#> [1] 1
graph_center(tree, mode = "out")
#> + 85/100 vertices, from a5e128b:
#>  [1]  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
#> [20]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51  52  53
#> [39]  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68  69  70  71  72
#> [58]  73  74  75  76  77  78  79  80  81  82  83  84  85  86  87  88  89  90  91
#> [77]  92  93  94  95  96  97  98  99 100

# Without and with weights
ring <- make_ring(10)
graph_center(ring)
#> + 10/10 vertices, from fd9b237:
#>  [1]  1  2  3  4  5  6  7  8  9 10
# Add weights
E(ring)$weight <- seq_len(ecount(ring))
graph_center(ring)
#> + 1/10 vertex, from fd9b237:
#> [1] 7
```
