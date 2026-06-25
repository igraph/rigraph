# Set multiple vertex attributes

Set multiple vertex attributes

## Usage

``` r
set_vertex_attrs(graph, ..., index = V(graph))
```

## Arguments

- graph:

  The graph.

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Named arguments, where the names are the attributes

- index:

  An optional vertex sequence to set the attributes of a subset of
  vertices.

## Value

The graph, with the vertex attributes added or set.

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

Vertex, edge and graph attributes:
[`delete_edge_attr()`](https://r.igraph.org/reference/delete_edge_attr.md),
[`delete_graph_attr()`](https://r.igraph.org/reference/delete_graph_attr.md),
[`delete_vertex_attr()`](https://r.igraph.org/reference/delete_vertex_attr.md),
[`edge_attr()`](https://r.igraph.org/reference/edge_attr.md),
[`edge_attr<-()`](https://r.igraph.org/reference/edge_attr-set.md),
[`edge_attr_names()`](https://r.igraph.org/reference/edge_attr_names.md),
[`graph_attr()`](https://r.igraph.org/reference/graph_attr.md),
[`graph_attr<-()`](https://r.igraph.org/reference/graph_attr-set.md),
[`graph_attr_names()`](https://r.igraph.org/reference/graph_attr_names.md),
[`igraph-attribute-combination`](https://r.igraph.org/reference/igraph-attribute-combination.md),
[`igraph-dollar`](https://r.igraph.org/reference/igraph-dollar.md),
[`igraph-vs-attributes`](https://r.igraph.org/reference/igraph-vs-attributes.md),
[`set_edge_attr()`](https://r.igraph.org/reference/set_edge_attr.md),
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
[`vertex_attr<-()`](https://r.igraph.org/reference/vertex_attr-set.md),
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_ring(10)
set_vertex_attrs(g, color = "blue", size = 10, name = LETTERS[1:10])
#> ── <igraph> Ring graph ────────────────────────────────────────────── f676fc9 ──
#> ℹ undirected · named
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> → vertex: color <chr>, size <dbl>, name <chr>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#>  [1] A ─ B  B ─ C  C ─ D  D ─ E  E ─ F  F ─ G  G ─ H  H ─ I  I ─ J  A ─ J 
# use splicing if suplying a list
x <- list(color = "red", name = LETTERS[1:10])
set_vertex_attrs(g, !!!x)
#> ── <igraph> Ring graph ────────────────────────────────────────────── f676fc9 ──
#> ℹ undirected · named
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> → vertex: color <chr>, name <chr>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#>  [1] A ─ B  B ─ C  C ─ D  D ─ E  E ─ F  F ─ G  G ─ H  H ─ I  I ─ J  A ─ J 
# to set an attribute named "index" use `:=`
set_vertex_attrs(g, color = "blue", index := 10, name = LETTERS[1:10])
#> ── <igraph> Ring graph ────────────────────────────────────────────── f676fc9 ──
#> ℹ undirected · named
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> → vertex: color <chr>, index <dbl>, name <chr>
#> 
#> ── Edges (vertex names) ────────────────────────────────────────────────────────
#>  [1] A ─ B  B ─ C  C ─ D  D ─ E  E ─ F  F ─ G  G ─ H  H ─ I  I ─ J  A ─ J 
```
