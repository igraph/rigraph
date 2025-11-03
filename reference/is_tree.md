# Decide whether a graph is a tree.

`is_tree()` decides whether a graph is a tree, and optionally returns a
possible root vertex if the graph is a tree.

## Usage

``` r
is_tree(graph, mode = c("out", "in", "all", "total"), details = FALSE)
```

## Arguments

- graph:

  An igraph graph object

- mode:

  Whether to consider edge directions in a directed graph. ‘all’ ignores
  edge directions; ‘out’ requires edges to be oriented outwards from the
  root, ‘in’ requires edges to be oriented towards the root.

- details:

  Whether to return only whether the graph is a tree (`FALSE`) or also a
  possible root (`TRUE`)

## Value

When `details` is `FALSE`, a logical value that indicates whether the
graph is a tree. When `details` is `TRUE`, a named list with two
entries:

- res:

  Logical value that indicates whether the graph is a tree.

- root:

  The root vertex of the tree; undefined if the graph is not a tree.

## Details

An undirected graph is a tree if it is connected and has no cycles. In
the directed case, a possible additional requirement is that all edges
are oriented away from a root (out-tree or arborescence) or all edges
are oriented towards a root (in-tree or anti-arborescence). This test
can be controlled using the mode parameter.

By convention, the null graph (i.e. the graph with no vertices) is
considered not to be a tree.

## See also

Other trees:
[`is_forest()`](https://r.igraph.org/reference/is_forest.md),
[`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md),
[`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md),
[`to_prufer()`](https://r.igraph.org/reference/to_prufer.md)

## Related documentation in the C library

[`is_tree()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_tree).

## Examples

``` r
g <- make_tree(7, 2)
is_tree(g)
#> [1] TRUE
is_tree(g, details = TRUE)
#> $res
#> [1] TRUE
#> 
#> $root
#> + 1/7 vertex, from 6686f50:
#> [1] 1
#> 
```
