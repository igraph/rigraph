# Create a Turán graph

Turán graphs are complete multipartite graphs with the property that the
sizes of the partitions are as close to equal as possible.

## Usage

``` r
make_turan(n, r)

turan(...)
```

## Arguments

- n:

  Integer, the number of vertices in the graph.

- r:

  Integer, the number of partitions in the graph, must be positive.

- ...:

  Passed to `make_turan()`.

## Value

An igraph graph with a vertex attribute `type` storing the partition
index of each vertex. Partition indices start from 1.

## Details

The Turán graph with `n` vertices and `r` partitions is the densest
graph on `n` vertices that does not contain a clique of size `r+1`.

This function generates undirected graphs. The null graph is returned
when the number of vertices is zero. A complete graph is returned if the
number of partitions is greater than the number of vertices.

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
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md)

## Related documentation in the C library

[`turan()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_turan).

## Examples

``` r
# Create a Turán graph with 10 vertices and 3 partitions
g <- make_turan(10, 3)
plot(g)


# The sizes of the partitions are as balanced as possible
table(V(g)$type)
#> 
#> 1 2 3 
#> 4 3 3 
```
