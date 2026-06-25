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

## Related documentation in the C library

[`full_citation()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_full_citation)

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
#> ── <igraph> Full citation graph ───────────────────────────────────── c5a76b7 ──
#> ℹ directed
#> ℹ 10 vertices · 45 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>
#> 
#> ── Graph attributes ────────────────────────────────────────────────────────────
#> name:
#>   [1] "Full citation graph"
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 2 → 1   3 → 1   3 → 2   4 → 1   4 → 2   4 → 3   5 → 1   5 → 2   5 → 3  
#> [10] 5 → 4   6 → 1   6 → 2   6 → 3   6 → 4   6 → 5   7 → 1   7 → 2   7 → 3  
#> [19] 7 → 4   7 → 5   7 → 6   8 → 1   8 → 2   8 → 3   8 → 4   8 → 5   8 → 6  
#> [28] 8 → 7   9 → 1   9 → 2   9 → 3   9 → 4   9 → 5   9 → 6   9 → 7   9 → 8  
#> [37] 10 → 1  10 → 2  10 → 3  10 → 4  10 → 5  10 → 6  10 → 7  10 → 8  10 → 9 
```
