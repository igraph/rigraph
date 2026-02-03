# Dyad census of a graph

Classify dyads in a directed graphs. The relationship between each pair
of vertices is measured. It can be in three states: mutual, asymmetric
or non-existent.

## Usage

``` r
dyad_census(graph)
```

## Arguments

- graph:

  The input graph. A warning is given if it is not directed.

## Value

A named numeric vector with three elements:

- mut:

  The number of pairs with mutual connections.

- asym:

  The number of pairs with non-mutual connections.

- null:

  The number of pairs with no connection between them.

## Related documentation in the C library

[`dyad_census()`](https://igraph.org/c/html/0.10.17/igraph-Motifs.html#igraph_dyad_census),
[[`is_directed()`](https://r.igraph.org/reference/is_directed.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_is_directed)

## References

Holland, P.W. and Leinhardt, S. A Method for Detecting Structure in
Sociometric Data. *American Journal of Sociology*, 76, 492–513. 1970.

Wasserman, S., and Faust, K. *Social Network Analysis: Methods and
Applications.* Cambridge: Cambridge University Press. 1994.

## See also

[`triad_census()`](https://r.igraph.org/reference/triad_census.md) for
the same classification, but with triples.

Other graph motifs:
[`count_motifs()`](https://r.igraph.org/reference/count_motifs.md),
[`motifs()`](https://r.igraph.org/reference/motifs.md),
[`motifs_randesu_callback()`](https://r.igraph.org/reference/motifs_randesu_callback.md),
[`sample_motifs()`](https://r.igraph.org/reference/sample_motifs.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
g <- sample_pa(100)
dyad_census(g)
#> $mut
#> [1] 0
#> 
#> $asym
#> [1] 99
#> 
#> $null
#> [1] 4851
#> 
```
