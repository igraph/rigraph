# Create a full bipartite graph

Bipartite graphs are also called two-mode by some. This function creates
a bipartite graph in which every possible edge is present.

## Usage

``` r
make_full_bipartite_graph(
  n1,
  n2,
  directed = FALSE,
  mode = c("all", "out", "in")
)

full_bipartite_graph(n1, n2, directed = FALSE, mode = c("all", "out", "in"))
```

## Arguments

- n1:

  The number of vertices of the first kind.

- n2:

  The number of vertices of the second kind.

- directed:

  Logical scalar, whether the graphs is directed.

- mode:

  Scalar giving the kind of edges to create for directed graphs. If this
  is ‘`out`’ then all vertices of the first kind are connected to the
  others; ‘`in`’ specifies the opposite direction; ‘`all`’ creates
  mutual edges. This argument is ignored for undirected graphs.x

## Value

An igraph graph, with the ‘`type`’ vertex attribute set.

## Details

Bipartite graphs have a ‘`type`’ vertex attribute in igraph, this is
boolean and `FALSE` for the vertices of the first kind and `TRUE` for
vertices of the second kind.

## See also

[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md)
for creating one-mode full graphs

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_full_bipartite_graph(2, 3)
g2 <- make_full_bipartite_graph(2, 3, directed = TRUE)
g3 <- make_full_bipartite_graph(2, 3, directed = TRUE, mode = "in")
g4 <- make_full_bipartite_graph(2, 3, directed = TRUE, mode = "all")
```
