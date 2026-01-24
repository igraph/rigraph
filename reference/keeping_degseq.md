# Graph rewiring while preserving the degree distribution

This function can be used together with
[`rewire()`](https://r.igraph.org/reference/rewire.md) to randomly
rewire the edges while preserving the original graph's degree
distribution.

## Usage

``` r
keeping_degseq(loops = FALSE, niter = 100)
```

## Arguments

- loops:

  Whether to allow destroying and creating loop edges.

- niter:

  Number of rewiring trials to perform.

## Details

The rewiring algorithm chooses two arbitrary edges in each step ((a,b)
and (c,d)) and substitutes them with (a,d) and (c,b), if they not
already exists in the graph. The algorithm does not create multiple
edges.

## See also

[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md)

Other rewiring functions:
[`each_edge()`](https://r.igraph.org/reference/each_edge.md),
[`rewire()`](https://r.igraph.org/reference/rewire.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com>

## Examples

``` r
g <- make_ring(10)
g %>%
  rewire(keeping_degseq(niter = 20)) %>%
  degree()
#>  [1] 2 2 2 2 2 2 2 2 2 2
print_all(rewire(g, with = keeping_degseq(niter = vcount(g) * 10)))
#> IGRAPH 7f79e26 U--- 10 10 -- Ring graph
#> + attr: name (g/c), mutual (g/l), circular (g/l)
#> + graph attributes:
#> | + name:
#> |   [1] "Ring graph"
#> | + mutual:
#> |   [1] FALSE
#> | + circular:
#> |   [1] TRUE
#> + edges from 7f79e26:
#>  [1] 4-- 7 3-- 6 1-- 8 3-- 5 8-- 9 2--10 6-- 9 1-- 7 2-- 4 5--10
```
