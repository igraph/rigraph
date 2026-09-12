# Constructor specifications for `graph_()`, `make_()` and `sample_()`

Each of these functions builds a lazy constructor specification for the
given graph constructor, to be used with
[`graph_()`](https://r.igraph.org/reference/graph_.md),
[`make_()`](https://r.igraph.org/reference/make_.md) or
[`sample_()`](https://r.igraph.org/reference/sample_.md). The
specification is only evaluated when the graph is actually constructed,
so it can be combined with constructor modifiers such as
[`with_vertex_()`](https://r.igraph.org/reference/with_vertex_.md) or
[`with_edge_()`](https://r.igraph.org/reference/with_edge_.md).

`from_data_frame()`, `from_edgelist()`, `tree()` and `degseq()` wrap
[`graph_from_data_frame()`](https://r.igraph.org/reference/graph_from_data_frame.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md) (or
[`sample_tree()`](https://r.igraph.org/reference/sample_tree.md)) and
[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md) (or
[`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)),
respectively.

The other constructors have specification functions as well; they are
documented together with the constructor they wrap, e.g.
[`ring()`](https://r.igraph.org/reference/make_ring.md) on the
[`make_ring()`](https://r.igraph.org/reference/make_ring.md) page.

## Usage

``` r
from_data_frame(...)

from_edgelist(...)

degseq(..., deterministic = FALSE)

tree(...)
```

## Arguments

- ...:

  Forwarded to the corresponding constructor function.

- deterministic:

  For `degseq()`, whether the construction should be deterministic; if
  `TRUE`, wraps
  [`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
  instead of
  [`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md).

## Value

An object of class `igraph_constructor_spec`.

## See also

[`graph_()`](https://r.igraph.org/reference/graph_.md),
[`make_()`](https://r.igraph.org/reference/make_.md) and
[`sample_()`](https://r.igraph.org/reference/sample_.md) to apply a
constructor specification.

## Examples

``` r
# Pass a constructor specification to graph_(), make_() or sample_()
el <- cbind(1:5, c(2:5, 1))
graph_(el, from_edgelist(directed = FALSE))
#> Warning: `graph_()` was deprecated in igraph 2.1.0.
#> ℹ Please use constructors directly, for instance graph_from_edgelist().
#> ℹ graph_() will be removed in a future version of igraph.
#> ── <igraph> ───────────────────────────────────────────────────────── 42efae4 ──
#> ℹ undirected
#> ℹ 5 vertices · 5 edges
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 ─ 2  2 ─ 3  3 ─ 4  4 ─ 5  1 ─ 5 

make_(tree(7))
#> ── <igraph> Tree ──────────────────────────────────────────────────── 19f7061 ──
#> ℹ directed
#> ℹ 7 vertices · 6 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, children <dbl>, mode <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  1 → 3  2 → 4  2 → 5  3 → 6  3 → 7 

# Specifications can be combined with constructor modifiers
make_(tree(7), with_vertex_(color = "red"))
#> ── <igraph> Tree ──────────────────────────────────────────────────── fc159df ──
#> ℹ directed
#> ℹ 7 vertices · 6 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, children <dbl>, mode <chr>
#> → vertex: color <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#> [1] 1 → 2  1 → 3  2 → 4  2 → 5  3 → 6  3 → 7 
```
