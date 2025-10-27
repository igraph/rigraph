# Line graph of a graph

This function calculates the line graph of another graph.

## Usage

``` r
make_line_graph(graph)

line_graph(...)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- ...:

  Passed to `make_line_graph()`.

## Value

A new graph object.

## Details

The line graph `L(G)` of a `G` undirected graph is defined as follows.
`L(G)` has one vertex for each edge in `G` and two vertices in `L(G)`
are connected by an edge if their corresponding edges share an end
point.

The line graph `L(G)` of a `G` directed graph is slightly different,
`L(G)` has one vertex for each edge in `G` and two vertices in `L(G)`
are connected by a directed edge if the target of the first vertex's
corresponding edge is the same as the source of the second vertex's
corresponding edge.

## Author

Gabor Csardi <csardi.gabor@gmail.com>, the first version of the C code
was written by Vincent Matossian.

## Examples

``` r
# generate the first De-Bruijn graphs
g <- make_full_graph(2, directed = TRUE, loops = TRUE)
make_line_graph(g)
#> IGRAPH 72cd32b D--- 4 8 -- Line graph
#> + attr: name (g/c)
#> + edges from 72cd32b:
#> [1] 1->1 3->1 1->2 3->2 2->3 4->3 2->4 4->4
make_line_graph(make_line_graph(g))
#> IGRAPH 6a2d1f5 D--- 8 16 -- Line graph
#> + attr: name (g/c)
#> + edges from 6a2d1f5:
#>  [1] 1->1 2->1 5->2 6->2 1->3 2->3 5->4 6->4 3->5 4->5 7->6 8->6 3->7 4->7 7->8
#> [16] 8->8
make_line_graph(make_line_graph(make_line_graph(g)))
#> IGRAPH 8070bb7 D--- 16 32 -- Line graph
#> + attr: name (g/c)
#> + edges from 8070bb7:
#>  [1]  1-> 1  2-> 1  3-> 2  4-> 2  9-> 3 10-> 3 11-> 4 12-> 4  1-> 5  2-> 5
#> [11]  3-> 6  4-> 6  9-> 7 10-> 7 11-> 8 12-> 8  5-> 9  6-> 9  7->10  8->10
#> [21] 13->11 14->11 15->12 16->12  5->13  6->13  7->14  8->14 13->15 14->15
#> [31] 15->16 16->16
```
