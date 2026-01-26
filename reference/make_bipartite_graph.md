# Create a bipartite graph

A bipartite graph has two kinds of vertices and connections are only
allowed between different kinds.

## Usage

``` r
make_bipartite_graph(types, edges, directed = FALSE)

bipartite_graph(types, edges, directed = FALSE)
```

## Arguments

- types:

  A vector giving the vertex types. It will be coerced into boolean. The
  length of the vector gives the number of vertices in the graph. When
  the vector is a named vector, the names will be attached to the graph
  as the `name` vertex attribute.

- edges:

  A vector giving the edges of the graph, the same way as for the
  regular [`make_graph()`](https://r.igraph.org/reference/make_graph.md)
  function. It is checked that the edges indeed connect vertices of
  different kind, according to the supplied `types` vector. The vector
  may be a string vector if `types` is a named vector.

- directed:

  Whether to create a directed graph, boolean constant. Note that by
  default undirected graphs are created, as this is more common for
  bipartite graphs.

## Value

`make_bipartite_graph()` returns a bipartite igraph graph. In other
words, an igraph graph that has a vertex attribute named `type`.

[`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md)
returns a logical scalar.

## Details

Bipartite graphs have a `type` vertex attribute in igraph, this is
boolean and `FALSE` for the vertices of the first kind and `TRUE` for
vertices of the second kind.

`make_bipartite_graph()` basically does three things. First it checks
the `edges` vector against the vertex `types`. Then it creates a graph
using the `edges` vector and finally it adds the `types` vector as a
vertex attribute called `type`. `edges` may contain strings as vertex
names; in this case, `types` must be a named vector that specifies the
type for each vertex name that occurs in `edges`.

## See also

[`make_graph()`](https://r.igraph.org/reference/make_graph.md) to create
one-mode networks

Bipartite graphs
[`bipartite_mapping()`](https://r.igraph.org/reference/bipartite_mapping.md),
[`bipartite_projection()`](https://r.igraph.org/reference/bipartite_projection.md),
[`is_bipartite()`](https://r.igraph.org/reference/is_bipartite.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_bipartite_graph(rep(0:1, length.out = 10), c(1:10))
print(g, v = TRUE)
#> IGRAPH 54c8870 U--B 10 5 -- 
#> + attr: type (v/l)
#> + edges from 54c8870:
#> [1] 1-- 2 3-- 4 5-- 6 7-- 8 9--10
```
