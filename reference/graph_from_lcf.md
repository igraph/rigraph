# Creating a graph from LCF notation

LCF is short for Lederberg-Coxeter-Frucht, it is a concise notation for
3-regular Hamiltonian graphs. It constists of three parameters, the
number of vertices in the graph, a list of shifts giving additional
edges to a cycle backbone and another integer giving how many times the
shifts should be performed. See
<https://mathworld.wolfram.com/LCFNotation.html> for details.

## Usage

``` r
graph_from_lcf(shifts, ..., n = NULL, repeats = 1L)
```

## Arguments

- shifts:

  Integer vector, the shifts.

- ...:

  These dots are for future extensions and must be empty.

- n:

  Integer, the number of vertices in the graph. If `NULL` (default), it
  is set to `len(shifts) * repeats`.

- repeats:

  Integer constant, how many times to repeat the shifts.

## Value

A graph object.

## See also

[`make_graph()`](https://r.igraph.org/reference/make_graph.md) can
create arbitrary graphs, see also the other functions on the its manual
page for creating special graphs.

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`lcf_vector()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_lcf_vector).

## Examples

``` r
# This is the Franklin graph:
g1 <- graph_from_lcf(shifts = c(5L, -5L), n = 12L, repeats = 6L)
g2 <- make_graph("Franklin")
isomorphic(g1, g2)
#> [1] TRUE
```
