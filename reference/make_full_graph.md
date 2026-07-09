# Create a full graph

Create a full graph

## Usage

``` r
make_full_graph(n, directed = FALSE, loops = FALSE)

full_graph(n, directed = FALSE, loops = FALSE)
```

## Arguments

- n:

  Number of vertices.

- directed:

  Whether to create a directed graph.

- loops:

  Whether to add self-loops to the graph.

## Value

An igraph graph

## Related documentation in the C library

[`full()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_full)

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
make_full_graph(5)
#> ── <igraph> Full graph ────────────────────────────────────────────── 49ecef9 ──
#> ℹ undirected
#> ℹ 5 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, loops <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 2  1 ─ 3  1 ─ 4  1 ─ 5  2 ─ 3  2 ─ 4  2 ─ 5  3 ─ 4  3 ─ 5  4 ─ 5 
print_all(make_full_graph(4, directed = TRUE))
#> ── <igraph> Full graph ────────────────────────────────────────────── 6a4b832 ──
#> ℹ directed
#> ℹ 4 vertices · 12 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, loops <lgl>
#> 
#> ── Graph attributes ────────────────────────────────────────────────────────────
#> name:
#>   [1] "Full graph"
#> loops:
#>   [1] FALSE
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 → 2  1 → 3  1 → 4  2 → 1  2 → 3  2 → 4  3 → 1  3 → 2  3 → 4  4 → 1 
#> [11] 4 → 2  4 → 3 
```
