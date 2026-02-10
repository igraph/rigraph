# Named graphs

An igraph graph is named, if there is a symbolic name associated with
its vertices.

## Usage

``` r
is_named(graph)
```

## Arguments

- graph:

  The input graph.

## Value

A logical scalar.

## Details

In igraph vertices can always be identified and specified via their
numeric vertex ids. This is, however, not always convenient, and in many
cases there exist symbolic ids that correspond to the vertices. To allow
this more flexible identification of vertices, one can assign a vertex
attribute called ‘name’ to an igraph graph. After doing this, the
symbolic vertex names can be used in all igraph functions, instead of
the numeric ids.

Note that the uniqueness of vertex names are currently not enforced in
igraph, you have to check that for yourself, when assigning the vertex
names.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
is_named(g)
#> [1] FALSE
V(g)$name <- letters[1:10]
is_named(g)
#> [1] TRUE
neighbors(g, "a")
#> + 2/10 vertices, named, from aafc952:
#> [1] b j
```
