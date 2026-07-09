# Constructor modifier to drop multiple edges

Constructor modifier to drop multiple edges

## Usage

``` r
without_multiples()
```

## See also

Constructor modifiers (and related functions):
[`make_()`](https://r.igraph.org/reference/make_.md),
[`sample_()`](https://r.igraph.org/reference/sample_.md),
[`simplified()`](https://r.igraph.org/reference/simplified.md),
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md),
[`with_graph_()`](https://r.igraph.org/reference/with_graph_.md),
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md),
[`without_attr()`](https://r.igraph.org/reference/without_attr.md),
[`without_loops()`](https://r.igraph.org/reference/without_loops.md)

## Examples

``` r
sample_(pa(10, m = 3, algorithm = "bag"))
#> ── <igraph> Barabasi graph ────────────────────────────────────────── 509e44a ──
#> ℹ directed
#> ℹ 10 vertices · 27 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, power <dbl>, m <dbl>, zero.appeal <dbl>, algorithm <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 2 → 1   2 → 1   2 → 1   3 → 2   3 → 2   3 → 1   4 → 1   4 → 3   4 → 1  
#> [10] 5 → 3   5 → 1   5 → 3   6 → 1   6 → 3   6 → 1   7 → 1   7 → 3   7 → 3  
#> [19] 8 → 1   8 → 1   8 → 3   9 → 1   9 → 3   9 → 1   10 → 1  10 → 1  10 → 2 
sample_(pa(10, m = 3, algorithm = "bag"), without_multiples())
#> ── <igraph> Barabasi graph ────────────────────────────────────────── 8d9bb20 ──
#> ℹ directed
#> ℹ 10 vertices · 16 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, power <dbl>, m <dbl>, zero.appeal <dbl>, algorithm <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 2 → 1   3 → 1   4 → 1   4 → 2   4 → 3   5 → 1   5 → 2   6 → 3   7 → 1  
#> [10] 7 → 3   8 → 1   8 → 6   9 → 1   9 → 2   9 → 8   10 → 1 
```
