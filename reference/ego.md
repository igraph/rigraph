# Neighborhood of graph vertices

These functions find the vertices not farther than a given limit from
another fixed vertex, these are called the neighborhood of the vertex.
Note that `ego()` and `neighborhood()`, `ego_size()` and
`neighborhood_size()`, `make_ego_graph()` and
`make_neighborhood()_graph()`, are synonyms (aliases).

## Usage

``` r
connect(graph, order, mode = c("all", "out", "in", "total"))

ego_size(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)

neighborhood_size(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)

ego(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)

neighborhood(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)

make_ego_graph(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)

make_neighborhood_graph(
  graph,
  order = 1,
  nodes = V(graph),
  mode = c("all", "out", "in"),
  mindist = 0
)
```

## Arguments

- graph:

  The input graph.

- order:

  Integer giving the order of the neighborhood. Negative values indicate
  an infinite order.

- mode:

  Character constant, it specifies how to use the direction of the edges
  if a directed graph is analyzed. For ‘out’ only the outgoing edges are
  followed, so all vertices reachable from the source vertex in at most
  `order` steps are counted. For ‘"in"’ all vertices from which the
  source vertex is reachable in at most `order` steps are counted.
  ‘"all"’ ignores the direction of the edges. This argument is ignored
  for undirected graphs.

- nodes:

  The vertices for which the calculation is performed.

- mindist:

  The minimum distance to include the vertex in the result.

## Value

- `ego_size()`/`neighborhood_size()` returns with an integer vector.

- `ego()`/`neighborhood()` (synonyms) returns A list of `igraph.vs` or a
  list of numeric vectors depending on the value of
  `igraph_opt("return.vs.es")`, see details for performance
  characteristics.

- `make_ego_graph()`/`make_neighborhood_graph()` returns with a list of
  graphs.

- `connect()` returns with a new graph object.

## Details

The neighborhood of a given order `r` of a vertex `v` includes all
vertices which are closer to `v` than the order. I.e. order 0 is always
`v` itself, order 1 is `v` plus its immediate neighbors, order 2 is
order 1 plus the immediate neighbors of the vertices in order 1, etc.

`ego_size()`/`neighborhood_size()` (synonyms) returns the size of the
neighborhoods of the given order, for each given vertex.

`ego()`/`neighborhood()` (synonyms) returns the vertices belonging to
the neighborhoods of the given order, for each given vertex.

`make_ego_graph()`/`make_neighborhood()_graph()` (synonyms) is creates
(sub)graphs from all neighborhoods of the given vertices with the given
order parameter. This function preserves the vertex, edge and graph
attributes.

`connect()` creates a new graph by connecting each vertex to all other
vertices in its neighborhood.

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`add_vertices()`](https://r.igraph.org/reference/add_vertices.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`contract()`](https://r.igraph.org/reference/contract.md),
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md),
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md),
[`difference()`](https://r.igraph.org/reference/difference.md),
[`difference.igraph()`](https://r.igraph.org/reference/difference.igraph.md),
[`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md),
[`edge()`](https://r.igraph.org/reference/edge.md),
[`igraph-minus`](https://r.igraph.org/reference/igraph-minus.md),
[`intersection()`](https://r.igraph.org/reference/intersection.md),
[`intersection.igraph()`](https://r.igraph.org/reference/intersection.igraph.md),
[`path()`](https://r.igraph.org/reference/path.md),
[`permute()`](https://r.igraph.org/reference/permute.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`transitive_closure()`](https://r.igraph.org/reference/transitive_closure.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
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
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>, the first version was done by
Vincent Matossian

## Examples

``` r
g <- make_ring(10)

ego_size(g, order = 0, 1:3)
#> [1] 1 1 1
ego_size(g, order = 1, 1:3)
#> [1] 3 3 3
ego_size(g, order = 2, 1:3)
#> [1] 5 5 5

# neighborhood_size() is an alias of ego_size()
neighborhood_size(g, order = 0, 1:3)
#> [1] 1 1 1
neighborhood_size(g, order = 1, 1:3)
#> [1] 3 3 3
neighborhood_size(g, order = 2, 1:3)
#> [1] 5 5 5

ego(g, order = 0, 1:3)
#> [[1]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 1
#> 
#> [[2]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 2
#> 
#> [[3]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 3
#> 
ego(g, order = 1, 1:3)
#> [[1]]
#> + 3/10 vertices, from 3c4ff70:
#> [1]  1  2 10
#> 
#> [[2]]
#> + 3/10 vertices, from 3c4ff70:
#> [1] 2 1 3
#> 
#> [[3]]
#> + 3/10 vertices, from 3c4ff70:
#> [1] 3 2 4
#> 
ego(g, order = 2, 1:3)
#> [[1]]
#> + 5/10 vertices, from 3c4ff70:
#> [1]  1  2 10  3  9
#> 
#> [[2]]
#> + 5/10 vertices, from 3c4ff70:
#> [1]  2  1  3 10  4
#> 
#> [[3]]
#> + 5/10 vertices, from 3c4ff70:
#> [1] 3 2 4 1 5
#> 

# neighborhood() is an alias of ego()
neighborhood(g, order = 0, 1:3)
#> [[1]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 1
#> 
#> [[2]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 2
#> 
#> [[3]]
#> + 1/10 vertex, from 3c4ff70:
#> [1] 3
#> 
neighborhood(g, order = 1, 1:3)
#> [[1]]
#> + 3/10 vertices, from 3c4ff70:
#> [1]  1  2 10
#> 
#> [[2]]
#> + 3/10 vertices, from 3c4ff70:
#> [1] 2 1 3
#> 
#> [[3]]
#> + 3/10 vertices, from 3c4ff70:
#> [1] 3 2 4
#> 
neighborhood(g, order = 2, 1:3)
#> [[1]]
#> + 5/10 vertices, from 3c4ff70:
#> [1]  1  2 10  3  9
#> 
#> [[2]]
#> + 5/10 vertices, from 3c4ff70:
#> [1]  2  1  3 10  4
#> 
#> [[3]]
#> + 5/10 vertices, from 3c4ff70:
#> [1] 3 2 4 1 5
#> 

# attributes are preserved
V(g)$name <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
make_ego_graph(g, order = 2, 1:3)
#> [[1]]
#> IGRAPH a74bfbf UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from a74bfbf (vertex names):
#> [1] a--b b--c a--j i--j
#> 
#> [[2]]
#> IGRAPH 3085880 UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 3085880 (vertex names):
#> [1] a--b b--c c--d a--j
#> 
#> [[3]]
#> IGRAPH 8817f07 UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 8817f07 (vertex names):
#> [1] a--b b--c c--d d--e
#> 
# make_neighborhood_graph() is an alias of make_ego_graph()
make_neighborhood_graph(g, order = 2, 1:3)
#> [[1]]
#> IGRAPH 8eeb668 UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 8eeb668 (vertex names):
#> [1] a--b b--c a--j i--j
#> 
#> [[2]]
#> IGRAPH 9d2b980 UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from 9d2b980 (vertex names):
#> [1] a--b b--c c--d a--j
#> 
#> [[3]]
#> IGRAPH c5575df UN-- 5 4 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l), name (v/c)
#> + edges from c5575df (vertex names):
#> [1] a--b b--c c--d d--e
#> 

# connecting to the neighborhood
g <- make_ring(10)
g <- connect(g, 2)
```
