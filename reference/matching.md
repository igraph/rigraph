# Matching

A matching in a graph means the selection of a set of edges that are
pairwise non-adjacent, i.e. they have no common incident vertices. A
matching is maximal if it is not a proper subset of any other matching.

## Usage

``` r
is_matching(graph, matching, types = NULL)

is_max_matching(graph, matching, types = NULL)

max_bipartite_match(
  graph,
  types = NULL,
  weights = NULL,
  eps = .Machine$double.eps
)
```

## Arguments

- graph:

  The input graph. It might be directed, but edge directions will be
  ignored.

- matching:

  A potential matching. An integer vector that gives the pair in the
  matching for each vertex. For vertices without a pair, supply `NA`
  here.

- types:

  Vertex types, if the graph is bipartite. By default they are taken
  from the ‘`type`’ vertex attribute, if present.

- weights:

  Potential edge weights. If the graph has an edge attribute called
  ‘`weight`’, and this argument is `NULL`, then the edge attribute is
  used automatically. In weighted matching, the weights of the edges
  must match as much as possible.

- eps:

  A small real number used in equality tests in the weighted bipartite
  matching algorithm. Two real numbers are considered equal in the
  algorithm if their difference is smaller than `eps`. This is required
  to avoid the accumulation of numerical errors. By default it is set to
  the smallest \\x\\, such that \\1+x \ne 1\\ holds. If you are running
  the algorithm with no weights, this argument is ignored.

## Value

`is_matching()` and `is_max_matching()` return a logical scalar.

`max_bipartite_match()` returns a list with components:

- matching_size:

  The size of the matching, i.e. the number of edges connecting the
  matched vertices.

- matching_weight:

  The weights of the matching, if the graph was weighted. For unweighted
  graphs this is the same as the size of the matching.

- matching:

  The matching itself. Numeric vertex id, or vertex names if the graph
  was named. Non-matched vertices are denoted by `NA`.

## Details

`is_matching()` checks a matching vector and verifies whether its length
matches the number of vertices in the given graph, its values are
between zero (inclusive) and the number of vertices (inclusive), and
whether there exists a corresponding edge in the graph for every matched
vertex pair. For bipartite graphs, it also verifies whether the matched
vertices are in different parts of the graph.

`is_max_matching()` checks whether a matching is maximal. A matching is
maximal if and only if there exists no unmatched vertex in a graph such
that one of its neighbors is also unmatched.

`max_bipartite_match()` calculates a maximum matching in a bipartite
graph. A matching in a bipartite graph is a partial assignment of
vertices of the first kind to vertices of the second kind such that each
vertex of the first kind is matched to at most one vertex of the second
kind and vice versa, and matched vertices must be connected by an edge
in the graph. The size (or cardinality) of a matching is the number of
edges. A matching is a maximum matching if there exists no other
matching with larger cardinality. For weighted graphs, a maximum
matching is a matching whose edges have the largest possible total
weight among all possible matchings.

Maximum matchings in bipartite graphs are found by the push-relabel
algorithm with greedy initialization and a global relabeling after every
\\n/2\\ steps where \\n\\ is the number of vertices in the graph.

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
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
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

## Author

Tamas Nepusz <ntamas@gmail.com>

## Examples

``` r
g <- graph_from_literal(a - b - c - d - e - f)
m1 <- c("b", "a", "d", "c", "f", "e") # maximal matching
m2 <- c("b", "a", "d", "c", NA, NA) # non-maximal matching
m3 <- c("b", "c", "d", "c", NA, NA) # not a matching
is_matching(g, m1)
#> [1] TRUE
is_matching(g, m2)
#> [1] TRUE
is_matching(g, m3)
#> [1] FALSE
is_max_matching(g, m1)
#> [1] TRUE
is_max_matching(g, m2)
#> [1] FALSE
is_max_matching(g, m3)
#> [1] FALSE

V(g)$type <- rep(c(FALSE, TRUE), 3)
print_all(g, v = TRUE)
#> IGRAPH 99e5e31 UN-B 6 5 -- 
#> + attr: name (v/c), type (v/l)
#> + vertex attributes:
#> |     name  type
#> | [1]    a FALSE
#> | [2]    b  TRUE
#> | [3]    c FALSE
#> | [4]    d  TRUE
#> | [5]    e FALSE
#> | [6]    f  TRUE
#> + edges from 99e5e31 (vertex names):
#> [1] a--b b--c c--d d--e e--f
max_bipartite_match(g)
#> $matching_size
#> [1] 3
#> 
#> $matching_weight
#> [1] 3
#> 
#> $matching
#>   a   b   c   d   e   f 
#> "b" "a" "d" "c" "f" "e" 
#> 

g2 <- graph_from_literal(a - b - c - d - e - f - g)
V(g2)$type <- rep(c(FALSE, TRUE), length.out = vcount(g2))
print_all(g2, v = TRUE)
#> IGRAPH de8c6fd UN-B 7 6 -- 
#> + attr: name (v/c), type (v/l)
#> + vertex attributes:
#> |     name  type
#> | [1]    a FALSE
#> | [2]    b  TRUE
#> | [3]    c FALSE
#> | [4]    d  TRUE
#> | [5]    e FALSE
#> | [6]    f  TRUE
#> | [7]    g FALSE
#> + edges from de8c6fd (vertex names):
#> [1] a--b b--c c--d d--e e--f f--g
max_bipartite_match(g2)
#> $matching_size
#> [1] 3
#> 
#> $matching_weight
#> [1] 3
#> 
#> $matching
#>   a   b   c   d   e   f   g 
#> "b" "a" "d" "c" "f" "e"  NA 
#> 
#' @keywords graphs
```
