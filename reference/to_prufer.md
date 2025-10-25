# Convert a tree graph to its Prüfer sequence

`to_prufer()` converts a tree graph into its Prüfer sequence.

## Usage

``` r
to_prufer(graph)
```

## Arguments

- graph:

  The graph to convert to a Prüfer sequence

## Value

The Prüfer sequence of the graph, represented as a numeric vector of
vertex IDs in the sequence.

## Details

The Prüfer sequence of a tree graph with n labeled vertices is a
sequence of n-2 numbers, constructed as follows. If the graph has more
than two vertices, find a vertex with degree one, remove it from the
tree and add the label of the vertex that it was connected to to the
sequence. Repeat until there are only two vertices in the remaining
graph.

## See also

[`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md)
to construct a graph from its Prüfer sequence

Other trees:
[`is_forest()`](https://r.igraph.org/reference/is_forest.md),
[`is_tree()`](https://r.igraph.org/reference/is_tree.md),
[`make_from_prufer()`](https://r.igraph.org/reference/make_from_prufer.md),
[`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md)

## Related documentation in the C library

[`to_prufer()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_to_prufer).

## Examples

``` r
g <- make_tree(13, 3)
to_prufer(g)
#>  [1] 2 2 2 1 3 3 3 1 4 4 4
```
