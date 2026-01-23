# Create a full multipartite graph

A multipartite graph contains multiple types of vertices and connections
are only possible between vertices of different types. This function
creates a complete multipartite graph where all possible edges between
different partitions are present.

## Usage

``` r
make_full_multipartite(n, directed = FALSE, mode = c("all", "out", "in"))

full_multipartite(n, directed = FALSE, mode = c("all", "out", "in"))
```

## Arguments

- n:

  A numeric vector giving the number of vertices in each partition.

- directed:

  Logical scalar, whether to create a directed graph.

- mode:

  Character scalar, the type of connections for directed graphs. If
  `"out"`, then edges point from vertices of partitions with lower
  indices to partitions with higher indices; if `"in"`, then the
  opposite direction is realized; `"all"` creates mutual edges. This
  parameter is ignored for undirected graphs.

## Value

An igraph graph with a vertex attribute `type` storing the partition
index of each vertex. Partition indices start from 1.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Related documentation in the C library

[`full_multipartite()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_full_multipartite).

## Examples

``` r
# Create a multipartite graph with partitions of size 2, 3, and 4
g <- make_full_multipartite(c(2, 3, 4))
plot(g)


# Create a directed multipartite graph
g2 <- make_full_multipartite(c(2, 2, 2), directed = TRUE, mode = "out")
plot(g2)
```
