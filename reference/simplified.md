# Constructor modifier to drop multiple and loop edges

Constructor modifier to drop multiple and loop edges

## Usage

``` r
simplified()
```

## See also

Constructor modifiers (and related functions):
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md),
[`without_multiples()`](https://r.igraph.org/reference/without_multiples.md)

## Examples

``` r
sample_(pa(10, m = 3, algorithm = "bag"))
#> ── <igraph> Barabasi graph ────────────────────────────────────────── 27482a2 ──
#> ℹ directed
#> ℹ 10 vertices · 27 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, power <dbl>, m <dbl>, zero.appeal <dbl>, algorithm <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 2 → 1   2 → 1   2 → 1   3 → 1   3 → 1   3 → 2   4 → 1   4 → 1   4 → 1  
#> [10] 5 → 1   5 → 1   5 → 1   6 → 1   6 → 1   6 → 2   7 → 1   7 → 1   7 → 1  
#> [19] 8 → 2   8 → 1   8 → 1   9 → 1   9 → 6   9 → 2   10 → 2  10 → 8  10 → 1 
sample_(pa(10, m = 3, algorithm = "bag"), simplified())
#> ── <igraph> Barabasi graph ────────────────────────────────────────── f197e54 ──
#> ℹ directed
#> ℹ 10 vertices · 13 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, power <dbl>, m <dbl>, zero.appeal <dbl>, algorithm <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 2 → 1   3 → 1   3 → 2   4 → 1   4 → 2   5 → 1   5 → 4   6 → 1   7 → 1  
#> [10] 8 → 1   8 → 2   9 → 1   10 → 1 
```
