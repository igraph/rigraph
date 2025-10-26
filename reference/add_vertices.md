# Add vertices to a graph

If attributes are supplied, and they are not present in the graph, their
values for the original vertices of the graph are set to `NA`.

## Usage

``` r
add_vertices(graph, nv, ..., attr = list())
```

## Arguments

- graph:

  The input graph.

- nv:

  The number of vertices to add.

- ...:

  Additional arguments, they must be named, and they will be added as
  vertex attributes, for the newly added vertices. See also details
  below.

- attr:

  A named list, its elements will be added as vertex attributes, for the
  newly added vertices. See also details below.

## Value

The graph, with the vertices (and attributes) added.

## See also

Other functions for manipulating graph structure:
[`+.igraph()`](https://r.igraph.org/reference/plus-.igraph.md),
[`add_edges()`](https://r.igraph.org/reference/add_edges.md),
[`complementer()`](https://r.igraph.org/reference/complementer.md),
[`compose()`](https://r.igraph.org/reference/compose.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`contract()`](https://r.igraph.org/reference/contract.md),
[`delete_edges()`](https://r.igraph.org/reference/delete_edges.md),
[`delete_vertices()`](https://r.igraph.org/reference/delete_vertices.md),
[`difference()`](https://r.igraph.org/reference/difference.md),
[`difference.igraph()`](https://r.igraph.org/reference/difference.igraph.md),
[`disjoint_union()`](https://r.igraph.org/reference/disjoint_union.md),
[`edge()`](https://r.igraph.org/reference/edge.md),
[`igraph-minus`](https://r.igraph.org/reference/igraph-minus.md),
[`intersection()`](https://r.igraph.org/reference/intersection.md),
[`intersection.igraph()`](https://r.igraph.org/reference/intersection.igraph.md),
[`path()`](https://r.igraph.org/reference/path.md),
[`permute()`](https://r.igraph.org/reference/permute.md),
[`rep.igraph()`](https://r.igraph.org/reference/rep.igraph.md),
[`reverse_edges()`](https://r.igraph.org/reference/reverse_edges.md),
[`simplify()`](https://r.igraph.org/reference/simplify.md),
[`union()`](https://r.igraph.org/reference/union.md),
[`union.igraph()`](https://r.igraph.org/reference/union.igraph.md),
[`vertex()`](https://r.igraph.org/reference/vertex.md)

## Examples

``` r
g <- make_empty_graph() %>%
  add_vertices(3, color = "red") %>%
  add_vertices(2, color = "green") %>%
  add_edges(c(
    1, 2,
    2, 3,
    3, 4,
    4, 5
  ))
g
#> IGRAPH 85adbc0 D--- 5 4 -- 
#> + attr: color (v/c)
#> + edges from 85adbc0:
#> [1] 1->2 2->3 3->4 4->5
V(g)[[]]
#> + 5/5 vertices, from 85adbc0:
#>   color
#> 1   red
#> 2   red
#> 3   red
#> 4 green
#> 5 green
plot(g)
```
