# Decide whether a graph is a forest.

`is_forest()` decides whether a graph is a forest, and optionally
returns a set of possible root vertices for its components.

## Usage

``` r
is_forest(graph, mode = c("out", "in", "all", "total"), details = FALSE)
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

An undirected graph is a forest if it has no cycles. In the directed
case, a possible additional requirement is that edges in each tree are
oriented away from the root (out-trees or arborescences) or all edges
are oriented towards the root (in-trees or anti-arborescences). This
test can be controlled using the mode parameter.

By convention, the null graph (i.e. the graph with no vertices) is
considered to be a forest.

## See also

Other trees: [`is_tree()`](https://r.igraph.org/reference/is_tree.md),
[`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md),
[`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md),
[`to_prufer()`](https://r.igraph.org/reference/to_prufer.md)

## Related documentation in the C library

[`is_forest()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_is_forest).

## Examples

``` r
g <- make_tree(3) + make_tree(5, 3)
is_forest(g)
#> [1] TRUE
is_forest(g, details = TRUE)
#> $res
#> [1] TRUE
#> 
#> $roots
#> + 2/8 vertices, from 263e69c:
#> [1] 1 4
#> 
```
