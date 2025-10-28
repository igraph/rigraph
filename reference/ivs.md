# Independent vertex sets

A vertex set is called independent if there no edges between any two
vertices in it. These functions find independent vertex sets in
undirected graphs

## Usage

``` r
ivs(graph, min = NULL, max = NULL)

largest_ivs(graph)

max_ivs(graph)

ivs_size(graph)

independence_number(graph)

is_ivs(graph, candidate)
```

## Arguments

- graph:

  The input graph.

- min:

  Numeric constant, limit for the minimum size of the independent vertex
  sets to find. `NULL` means no limit.

- max:

  Numeric constant, limit for the maximum size of the independent vertex
  sets to find. `NULL` means no limit.

- candidate:

  The vertex set to test for being an independent set.

## Value

`ivs()`, `largest_ivs()` and `max_ivs()` return a list containing
numeric vertex ids, each list element is an independent vertex set.

`ivs_size()` returns an integer constant.

`is_ivs()` returns `TRUE` if the candidate vertex set forms an
independent set.

## Details

`ivs()` finds all independent vertex sets in the network, obeying the
size limitations given in the `min` and `max` arguments.

`largest_ivs()` finds the largest independent vertex sets in the graph.
An independent vertex set is largest if there is no independent vertex
set with more vertices.

`max_ivs()` finds the maximal independent vertex sets in the graph. An
independent vertex set is maximal if it cannot be extended to a larger
independent vertex set. The largest independent vertex sets are maximal,
but the opposite is not always true.

`ivs_size()` calculate the size of the largest independent vertex
set(s).

`independence_number()` is an alias for `ivs_size()`.

These functions use the algorithm described by Tsukiyama et al., see
reference below.

`is_ivs()` tests if no pairs within a vertex set are connected.

## References

S. Tsukiyama, M. Ide, H. Ariyoshi and I. Shirawaka. A new algorithm for
generating all the maximal independent sets. *SIAM J Computing*,
6:505–517, 1977.

## See also

Other cliques: [`cliques()`](https://r.igraph.org/reference/cliques.md),
[`is_complete()`](https://r.igraph.org/reference/is_complete.md),
[`weighted_cliques()`](https://r.igraph.org/reference/weighted_cliques.md)

## Author

Tamas Nepusz <ntamas@gmail.com> ported it from the Very Nauty Graph
Library by Keith Briggs (<https://keithbriggs.info/>) and Gabor Csardi
<csardi.gabor@gmail.com> wrote the R interface and this manual page.

## Related documentation in the C library

[`is_independent_vertex_set()`](https://igraph.org/c/html/latest/igraph-Cliques.html#igraph_is_independent_vertex_set).

## Examples

``` r
# Do not run, takes a couple of seconds

# A quite dense graph
set.seed(42)
g <- sample_gnp(100, 0.9)
ivs_size(g)
#> [1] 4
ivs(g, min = ivs_size(g))
#> [[1]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 37 55 56
#> 
#> [[2]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 55 56 69
#> 
#> [[3]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 56 69 74
#> 
#> [[4]]
#> + 4/100 vertices, from e23c799:
#> [1]  8 15 73 80
#> 
#> [[5]]
#> + 4/100 vertices, from e23c799:
#> [1]  8 15 73 84
#> 
#> [[6]]
#> + 4/100 vertices, from e23c799:
#> [1] 13 16 37 40
#> 
#> [[7]]
#> + 4/100 vertices, from e23c799:
#> [1] 21 32 45 61
#> 
#> [[8]]
#> + 4/100 vertices, from e23c799:
#> [1] 22 55 56 64
#> 
#> [[9]]
#> + 4/100 vertices, from e23c799:
#> [1] 23 69 75 90
#> 
largest_ivs(g)
#> [[1]]
#> + 4/100 vertices, from e23c799:
#> [1] 21 32 45 61
#> 
#> [[2]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 37 55 56
#> 
#> [[3]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 55 56 69
#> 
#> [[4]]
#> + 4/100 vertices, from e23c799:
#> [1]  7 56 69 74
#> 
#> [[5]]
#> + 4/100 vertices, from e23c799:
#> [1]  8 15 73 80
#> 
#> [[6]]
#> + 4/100 vertices, from e23c799:
#> [1]  8 15 73 84
#> 
#> [[7]]
#> + 4/100 vertices, from e23c799:
#> [1] 22 55 56 64
#> 
#> [[8]]
#> + 4/100 vertices, from e23c799:
#> [1] 23 69 75 90
#> 
#> [[9]]
#> + 4/100 vertices, from e23c799:
#> [1] 13 16 37 40
#> 
# Empty graph
induced_subgraph(g, largest_ivs(g)[[1]])
#> IGRAPH 1ec6f2c U--- 4 0 -- Erdos-Renyi (gnp) graph
#> + attr: name (g/c), type (g/c), loops (g/l), p (g/n)
#> + edges from 1ec6f2c:

length(max_ivs(g))
#> [1] 326
```
