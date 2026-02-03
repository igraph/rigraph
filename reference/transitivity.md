# Transitivity of a graph

Transitivity measures the probability that the adjacent vertices of a
vertex are connected. This is sometimes also called the clustering
coefficient.

## Usage

``` r
transitivity(
  graph,
  type = c("undirected", "global", "globalundirected", "localundirected", "local",
    "average", "localaverage", "localaverageundirected", "barrat", "weighted"),
  vids = NULL,
  weights = NULL,
  isolates = c("NaN", "zero")
)
```

## Arguments

- graph:

  The graph to analyze.

- type:

  The type of the transitivity to calculate. Possible values:

  "global"

  :   The global transitivity of an undirected graph. This is simply the
      ratio of the count of triangles and connected triples in the
      graph. In directed graphs, edge directions are ignored.

  "local"

  :   The local transitivity of an undirected graph. It is calculated
      for each vertex given in the `vids` argument. The local
      transitivity of a vertex is the ratio of the count of triangles
      connected to the vertex and the triples centered on the vertex. In
      directed graphs, edge directions are ignored.

  "undirected"

  :   This is the same as `global`.

  "globalundirected"

  :   This is the same as `global`.

  "localundirected"

  :   This is the same as `local`.

  "barrat"

  :   The weighted transitivity as defined by A. Barrat. See details
      below.

  "weighted"

  :   The same as `barrat`.

- vids:

  The vertex ids for the local transitivity will be calculated. This
  will be ignored for global transitivity types. The default value is
  `NULL`, in this case all vertices are considered. It is slightly
  faster to supply `NULL` here than `V(graph)`.

- weights:

  Optional weights for weighted transitivity. It is ignored for other
  transitivity measures. If it is `NULL` (the default) and the graph has
  a `weight` edge attribute, then it is used automatically.

- isolates:

  Character scalar, for local versions of transitivity, it defines how
  to treat vertices with degree zero and one. If it is ‘`NaN`’ then
  their local transitivity is reported as `NaN` and they are not
  included in the averaging, for the transitivity types that calculate
  an average. If there are no vertices with degree two or higher, then
  the averaging will still result `NaN`. If it is ‘`zero`’, then we
  report 0 transitivity for them, and they are included in the
  averaging, if an average is calculated. For the global transitivity,
  it controls how to handle graphs with no connected triplets: `NaN` or
  zero will be returned according to the respective setting.

## Value

For ‘`global`’ a single number, or `NaN` if there are no connected
triples in the graph.

For ‘`local`’ a vector of transitivity scores, one for each vertex in
‘`vids`’.

## Details

Note that there are essentially two classes of transitivity measures,
one is a vertex-level, the other a graph level property.

There are several generalizations of transitivity to weighted graphs,
here we use the definition by A. Barrat, this is a local vertex-level
quantity, its formula is

\$\$C_i^w=\frac{1}{s_i(k_i-1)}\sum\_{j,h}\frac{w\_{ij}+w\_{ih}}{2}a\_{ij}a\_{ih}a\_{jh}\$\$

\\s_i\\ is the strength of vertex \\i\\, see
[`strength()`](https://r.igraph.org/reference/strength.md), \\a\_{ij}\\
are elements of the adjacency matrix, \\k_i\\ is the vertex degree,
\\w\_{ij}\\ are the weights.

This formula gives back the normal not-weighted local transitivity if
all the edge weights are the same.

The `barrat` type of transitivity does not work for graphs with multiple
and/or loop edges. If you want to calculate it for a directed graph,
call [`as_undirected()`](https://r.igraph.org/reference/as_directed.md)
with the `collapse` mode first.

## Related documentation in the C library

[`transitivity_undirected()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_transitivity_undirected),
[`transitivity_local_undirected()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_transitivity_local_undirected),
[`transitivity_avglocal_undirected()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_transitivity_avglocal_undirected),
[`transitivity_barrat()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_transitivity_barrat),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## References

Wasserman, S., and Faust, K. (1994). *Social Network Analysis: Methods
and Applications.* Cambridge: Cambridge University Press.

Alain Barrat, Marc Barthelemy, Romualdo Pastor-Satorras, Alessandro
Vespignani: The architecture of complex weighted networks, Proc. Natl.
Acad. Sci. USA 101, 3747 (2004)

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
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`topo_sort()`](https://r.igraph.org/reference/topo_sort.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
transitivity(g)
#> [1] 0
g2 <- sample_gnp(1000, 10 / 1000)
transitivity(g2) # this is about 10/1000
#> [1] 0.008699099

# Weighted version, the figure from the Barrat paper
gw <- graph_from_literal(A - B:C:D:E, B - C:D, C - D)
E(gw)$weight <- 1
E(gw)[V(gw)[name == "A"] %--% V(gw)[name == "E"]]$weight <- 5
transitivity(gw, vids = "A", type = "local")
#>   A 
#> 0.5 
transitivity(gw, vids = "A", type = "weighted")
#>    A 
#> 0.25 

# Weighted reduces to "local" if weights are the same
gw2 <- sample_gnp(1000, 10 / 1000)
E(gw2)$weight <- 1
t1 <- transitivity(gw2, type = "local")
t2 <- transitivity(gw2, type = "weighted")
all(is.na(t1) == is.na(t2))
#> [1] TRUE
all(na.omit(t1 == t2))
#> [1] FALSE
```
