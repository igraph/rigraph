# Project a bipartite graph

A bipartite graph is projected into two one-mode networks

## Usage

``` r
bipartite_projection(
  graph,
  types = NULL,
  multiplicity = TRUE,
  probe1 = NULL,
  which = c("both", "true", "false"),
  remove.type = TRUE
)

bipartite_projection_size(graph, types = NULL)
```

## Arguments

- graph:

  The input graph. It can be directed, but edge directions are ignored
  during the computation.

- types:

  An optional vertex type vector to use instead of the ‘`type`’ vertex
  attribute. You must supply this argument if the graph has no ‘`type`’
  vertex attribute.

- multiplicity:

  If `TRUE`, then igraph keeps the multiplicity of the edges as an edge
  attribute called ‘weight’. E.g. if there is an A-C-B and also an A-D-B
  triple in the bipartite graph (but no more X, such that A-X-B is also
  in the graph), then the multiplicity of the A-B edge in the projection
  will be 2.

- probe1:

  This argument can be used to specify the order of the projections in
  the resulting list. If given, then it is considered as a vertex id (or
  a symbolic vertex name); the projection containing this vertex will be
  the first one in the result list. This argument is ignored if only one
  projection is requested in argument `which`.

- which:

  A character scalar to specify which projection(s) to calculate. The
  default is to calculate both.

- remove.type:

  Logical scalar, whether to remove the `type` vertex attribute from the
  projections. This makes sense because these graphs are not bipartite
  any more. However if you want to combine them with each other (or
  other bipartite graphs), then it is worth keeping this attribute. By
  default it will be removed.

## Value

A list of two undirected graphs. See details above.

## Details

Bipartite graphs have a `type` vertex attribute in igraph, this is
boolean and `FALSE` for the vertices of the first kind and `TRUE` for
vertices of the second kind.

`bipartite_projection_size()` calculates the number of vertices and
edges in the two projections of the bipartite graphs, without
calculating the projections themselves. This is useful to check how much
memory the projections would need if you have a large bipartite graph.

`bipartite_projection()` calculates the actual projections. You can use
the `probe1` argument to specify the order of the projections in the
result. By default vertex type `FALSE` is the first and `TRUE` is the
second.

`bipartite_projection()` keeps vertex attributes.

## Related documentation in the C library

[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount),
[`bipartite_projection_size()`](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_bipartite_projection_size)

## See also

Bipartite graphs
[`bipartite_mapping()`](https://r.igraph.org/reference/bipartite_mapping.md),
[`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md),
[`make_bipartite_graph()`](https://r.igraph.org/reference/make_bipartite_graph.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
## Projection of a full bipartite graph is a full graph
g <- make_full_bipartite_graph(10, 5)
proj <- bipartite_projection(g)
isomorphic(proj[[1]], make_full_graph(10))
#> [1] TRUE
isomorphic(proj[[2]], make_full_graph(5))
#> [1] TRUE

## The projection keeps the vertex attributes
M <- matrix(0, nrow = 5, ncol = 3)
rownames(M) <- c("Alice", "Bob", "Cecil", "Dan", "Ethel")
colnames(M) <- c("Party", "Skiing", "Badminton")
M[] <- sample(0:1, length(M), replace = TRUE)
M
#>       Party Skiing Badminton
#> Alice     0      1         1
#> Bob       1      1         0
#> Cecil     0      0         0
#> Dan       1      1         0
#> Ethel     1      0         0
g2 <- graph_from_biadjacency_matrix(M)
g2$name <- "Event network"
proj2 <- bipartite_projection(g2)
print(proj2[[1]], g = TRUE, e = TRUE)
#> IGRAPH e081a47 UNW- 5 5 -- Event network
#> + attr: name (g/c), name (v/c), weight (e/n)
#> + edges from e081a47 (vertex names):
#> [1] Alice--Bob   Alice--Dan   Bob  --Dan   Bob  --Ethel Dan  --Ethel
print(proj2[[2]], g = TRUE, e = TRUE)
#> IGRAPH cff7c6f UNW- 3 2 -- Event network
#> + attr: name (g/c), name (v/c), weight (e/n)
#> + edges from cff7c6f (vertex names):
#> [1] Party --Skiing    Skiing--Badminton
```
