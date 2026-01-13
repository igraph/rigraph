# Community structure detection based on edge betweenness

**\[deprecated\]**

`edge.betweenness.community()` was renamed to
[`cluster_edge_betweenness()`](https://r.igraph.org/reference/cluster_edge_betweenness.md)
to create a more consistent API.

## Usage

``` r
edge.betweenness.community(
  graph,
  weights = NULL,
  directed = TRUE,
  edge.betweenness = TRUE,
  merges = TRUE,
  bridges = TRUE,
  modularity = TRUE,
  membership = TRUE
)
```

## Arguments

- graph:

  The graph to analyze.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. Edge weights are used to calculate
  weighted edge betweenness. This means that edges are interpreted as
  distances, not as connection strengths.

- directed:

  Logical constant, whether to calculate directed edge betweenness for
  directed graphs. It is ignored for undirected graphs.

- edge.betweenness:

  Logical constant, whether to return the edge betweenness of the edges
  at the time of their removal.

- merges:

  Logical constant, whether to return the merge matrix representing the
  hierarchical community structure of the network. This argument is
  called `merges`, even if the community structure algorithm itself is
  divisive and not agglomerative: it builds the tree from top to bottom.
  There is one line for each merge (i.e. split) in matrix, the first
  line is the first merge (last split). The communities are identified
  by integer number starting from one. Community ids smaller than or
  equal to \\N\\, the number of vertices in the graph, belong to
  singleton communities, i.e. individual vertices. Before the first
  merge we have \\N\\ communities numbered from one to \\N\\. The first
  merge, the first line of the matrix creates community \\N+1\\, the
  second merge creates community \\N+2\\, etc.

- bridges:

  Logical constant, whether to return a list the edge removals which
  actually splitted a component of the graph.

- modularity:

  Logical constant, whether to calculate the maximum modularity score,
  considering all possibly community structures along the
  edge-betweenness based edge removals.

- membership:

  Logical constant, whether to calculate the membership vector
  corresponding to the highest possible modularity score.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
