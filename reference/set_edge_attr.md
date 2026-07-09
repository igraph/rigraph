# Set edge attributes

Set edge attributes

## Usage

``` r
set_edge_attr(graph, name, index = E(graph), value)
```

## Arguments

- graph:

  The graph

- name:

  The name of the attribute to set.

- index:

  An optional edge sequence to set the attributes of a subset of edges.

- value:

  The new value of the attribute for all (or `index`) edges. If `NULL`,
  the input is returned unchanged.

## Value

The graph, with the edge attribute added or set.

## Related documentation in the C library

[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

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
[`set_graph_attr()`](https://r.igraph.org/reference/set_graph_attr.md),
[`set_vertex_attr()`](https://r.igraph.org/reference/set_vertex_attr.md),
[`set_vertex_attrs()`](https://r.igraph.org/reference/set_vertex_attrs.md),
[`vertex_attr()`](https://r.igraph.org/reference/vertex_attr.md),
[`vertex_attr<-()`](https://r.igraph.org/reference/vertex_attr-set.md),
[`vertex_attr_names()`](https://r.igraph.org/reference/vertex_attr_names.md)

## Examples

``` r
g <- make_ring(10) %>%
  set_edge_attr("label", value = LETTERS[1:10])
g
#> ── <igraph> Ring graph ────────────────────────────────────────────── 49837f1 ──
#> ℹ undirected
#> ℹ 10 vertices · 10 edges
#> 
#> ── Attributes ──────────────────────────────────────────────────────────────────
#> → graph:  name <chr>, mutual <lgl>, circular <lgl>
#> → edge:   label <chr>
#> 
#> ── Edges ───────────────────────────────────────────────────────────────────────
#>  [1] 1 ─ 2   2 ─ 3   3 ─ 4   4 ─ 5   5 ─ 6   6 ─ 7   7 ─ 8   8 ─ 9   9 ─ 10 
#> [10] 1 ─ 10 
plot(g)
```
