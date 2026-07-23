# Construtor modifier to remove all attributes from a graph

Construtor modifier to remove all attributes from a graph

## Usage

``` r
without_attr()
```

## See also

Constructor modifiers (and related functions):
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
g1 <- make_ring(10)
g1
#> ── <igraph> Ring graph ────────────────────────────────────────────── 211d614 ──
#> ℹ undirected
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 2   2 ─ 3   3 ─ 4   4 ─ 5   5 ─ 6   6 ─ 7   7 ─ 8   8 ─ 9   9 ─ 10 
#> [10] 1 ─ 10 

g2 <- make_(ring(10), without_attr())
g2
#> ── <igraph> ───────────────────────────────────────────────────────── fabbd21 ──
#> ℹ undirected
#> ℹ 10 vertices · 10 edges
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 2   2 ─ 3   3 ─ 4   4 ─ 5   5 ─ 6   6 ─ 7   7 ─ 8   8 ─ 9   9 ─ 10 
#> [10] 1 ─ 10 
```
