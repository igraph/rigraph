# Find the multiple or loop edges in a graph

A loop edge is an edge from a vertex to itself. An edge is a multiple
edge if it has exactly the same head and tail vertices as another edge.
A graph without multiple and loop edges is called a simple graph.

## Usage

``` r
which_multiple(graph, eids = E(graph))

any_multiple(graph)

count_multiple(graph, eids = E(graph))

which_loop(graph, eids = E(graph))

any_loop(graph)

count_loops(graph)
```

## Arguments

- graph:

  The input graph.

- eids:

  The edges to which the query is restricted. By default this is all
  edges in the graph.

## Value

`any_loop()` and `any_multiple()` return a logical scalar.
`which_loop()` and `which_multiple()` return a logical vector.
`count_loops()` returns a numeric scalar with the total number of loop
edges. `count_multiple()` returns a numeric vector.

## Details

`any_loop()` decides whether the graph has any loop edges.

`which_loop()` decides whether the edges of the graph are loop edges.

`count_loops()` counts the total number of loop edges in the graph.

`any_multiple()` decides whether the graph has any multiple edges.

`which_multiple()` decides whether the edges of the graph are multiple
edges.

`count_multiple()` counts the multiplicity of each edge of a graph.

Note that the semantics for `which_multiple()` and `count_multiple()` is
different. `which_multiple()` gives `TRUE` for all occurrences of a
multiple edge except for one. I.e. if there are three `i-j` edges in the
graph then `which_multiple()` returns `TRUE` for only two of them while
`count_multiple()` returns ‘3’ for all three.

See the examples for getting rid of multiple edges while keeping their
original multiplicity as an edge attribute.

## See also

[`simplify()`](https://r.igraph.org/reference/simplify.md) to eliminate
loop and multiple edges.

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
[`girth()`](https://r.igraph.org/reference/girth.md),
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
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`is_multiple()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_multiple),
[`has_multiple()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_has_multiple),
[`count_multiple()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_count_multiple),
[`is_loop()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_loop),
[`has_loop()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_has_loop),
[`count_loops()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_count_loops).

## Examples

``` r
# Loops
g <- make_graph(c(1, 1, 2, 2, 3, 3, 4, 5))
any_loop(g)
#> [1] TRUE
which_loop(g)
#> [1]  TRUE  TRUE  TRUE FALSE
count_loops(g)
#> [1] 3

# Multiple edges
g <- sample_pa(10, m = 3, algorithm = "bag")
any_multiple(g)
#> [1] TRUE
which_multiple(g)
#>  [1] FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
#> [25] FALSE FALSE  TRUE
count_multiple(g)
#>  [1] 3 3 3 1 2 2 3 3 3 2 2 1 1 1 1 1 1 1 2 1 2 1 1 1 2 1 2
which_multiple(simplify(g))
#>  [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#> [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
all(count_multiple(simplify(g)) == 1)
#> [1] TRUE

# Direction of the edge is important
which_multiple(make_graph(c(1, 2, 2, 1)))
#> [1] FALSE FALSE
which_multiple(make_graph(c(1, 2, 2, 1), dir = FALSE))
#> [1] FALSE  TRUE

# Remove multiple edges but keep multiplicity
g <- sample_pa(10, m = 3, algorithm = "bag")
E(g)$weight <- count_multiple(g)
g <- simplify(g, edge.attr.comb = list(weight = "min"))
any(which_multiple(g))
#> [1] FALSE
E(g)$weight
#>  [1] 3 2 1 2 1 1 1 1 2 1 1 1 1 1 1 1 3 1 1 1
```
