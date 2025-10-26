# Girth of a graph

The girth of a graph is the length of the shortest circle in it.

## Usage

``` r
girth(graph, circle = TRUE)
```

## Arguments

- graph:

  The input graph. It may be directed, but the algorithm searches for
  undirected circles anyway.

- circle:

  Logical scalar, whether to return the shortest circle itself.

## Value

A named list with two components:

- girth:

  Integer constant, the girth of the graph, or `Inf` if the graph is
  acyclic.

- circle:

  Numeric vector with the vertex ids in the shortest circle.

## Details

The current implementation works for undirected graphs only, directed
graphs are treated as undirected graphs. Loop edges and multiple edges
are ignored. If the graph is a forest (i.e. acyclic), then `Inf` is
returned.

This implementation is based on Alon Itai and Michael Rodeh: Finding a
minimum circuit in a graph *Proceedings of the ninth annual ACM
symposium on Theory of computing*, 1-10, 1977. The first implementation
of this function was done by Keith Briggs, thanks Keith.

## References

Alon Itai and Michael Rodeh: Finding a minimum circuit in a graph
*Proceedings of the ninth annual ACM symposium on Theory of computing*,
1-10, 1977

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`edge_density()`](https://r.igraph.org/reference/edge_density.md),
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`simple_cycles()`](https://r.igraph.org/reference/simple_cycles.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# No circle in a tree
g <- make_tree(1000, 3)
girth(g)
#> $girth
#> [1] Inf
#> 
#> $circle
#> + 0/1000 vertices, from 6b5059f:
#> 

# The worst case running time is for a ring
g <- make_ring(100)
girth(g)
#> $girth
#> [1] 100
#> 
#> $circle
#> + 100/100 vertices, from 58f4c3d:
#>   [1]  51  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
#>  [19]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85  86
#>  [37]  87  88  89  90  91  92  93  94  95  96  97  98  99 100   1   2   3   4
#>  [55]   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20  21  22
#>  [73]  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39  40
#>  [91]  41  42  43  44  45  46  47  48  49  50
#> 

# What about a random graph?
g <- sample_gnp(1000, 1 / 1000)
girth(g)
#> $girth
#> [1] Inf
#> 
#> $circle
#> + 0/1000 vertices, from 95c8955:
#> 
```
