# Create an undirected tree graph from its Prüfer sequence

`make_from_prufer()` creates an undirected tree graph from its Prüfer
sequence.

## Usage

``` r
make_from_prufer(prufer)

from_prufer(prufer)
```

## Arguments

- prufer:

  The Prüfer sequence to convert into a graph

## Value

A graph object.

## Details

The Prüfer sequence of a tree graph with n labeled vertices is a
sequence of n-2 numbers, constructed as follows. If the graph has more
than two vertices, find a vertex with degree one, remove it from the
tree and add the label of the vertex that it was connected to to the
sequence. Repeat until there are only two vertices in the remaining
graph.

## See also

[`to_prufer()`](https://r.igraph.org/reference/to_prufer.md) to convert
a graph into its Prüfer sequence

Other trees:
[`is_forest()`](https://r.igraph.org/reference/is_forest.md),
[`is_tree()`](https://r.igraph.org/reference/is_tree.md),
[`sample_spanning_tree()`](https://r.igraph.org/reference/sample_spanning_tree.md),
[`to_prufer()`](https://r.igraph.org/reference/to_prufer.md)

## Related documentation in the C library

[`from_prufer()`](https://igraph.org/c/html/latest/igraph-Generators.html#igraph_from_prufer).

## Examples

``` r
g <- make_tree(13, 3)
to_prufer(g)
#>  [1] 2 2 2 1 3 3 3 1 4 4 4
```
