# Create a complete (full) citation graph

`make_full_citation_graph()` creates a full citation graph. This is a
directed graph, where every `i->j` edge is present if and only if
\\j\<i\\. If `directed=FALSE` then the graph is just a full graph.

## Usage

``` r
make_full_citation_graph(n, directed = TRUE)

full_citation_graph(n, directed = TRUE)
```

## Arguments

- n:

  The number of vertices.

- directed:

  Whether to create a directed graph.

## Value

An igraph graph.

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_graph()`](https://r.igraph.org/reference/make_graph.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Examples

``` r
print_all(make_full_citation_graph(10))
#> IGRAPH 50fceee D--- 10 45 -- Full citation graph
#> + attr: name (g/c)
#> + graph attributes:
#> | + name:
#> |   [1] "Full citation graph"
#> + edges:
#>  1 ->                      2 -> 1                    3 -> 1 2              
#>  4 -> 1 2 3                5 -> 1 2 3 4              6 -> 1 2 3 4 5        
#>  7 -> 1 2 3 4 5 6          8 -> 1 2 3 4 5 6 7        9 -> 1 2 3 4 5 6 7 8  
#> 10 -> 1 2 3 4 5 6 7 8 9
```
