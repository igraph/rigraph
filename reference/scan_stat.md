# Scan statistics on a time series of graphs

Calculate scan statistics on a time series of graphs. This is done by
calculating the local scan statistics for each graph and each vertex,
and then normalizing across the vertices and across the time steps.

## Usage

``` r
scan_stat(graphs, tau = 1, ell = 0, locality = c("us", "them"), ...)
```

## Arguments

- graphs:

  A list of igraph graph objects. They must be all directed or all
  undirected and they must have the same number of vertices.

- tau:

  The number of previous time steps to consider for the time-dependent
  normalization for individual vertices. In other words, the current
  locality statistics of each vertex will be compared to this many
  previous time steps of the same vertex to decide whether it is
  significantly larger.

- ell:

  The number of previous time steps to consider for the aggregated scan
  statistics. This is essentially a smoothing parameter.

- locality:

  Whether to calculate the ‘us’ or ‘them’ statistics.

- ...:

  Extra arguments are passed to
  [`local_scan()`](https://r.igraph.org/reference/local_scan.md).

## Value

A list with entries:

- stat:

  The scan statistics in each time step. It is `NA` for the initial
  `tau + ell` time steps.

- arg_max_v:

  The (numeric) vertex ids for the vertex with the largest locality
  statistics, at each time step. It is `NA` for the initial `tau + ell`
  time steps.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[`local_scan_0()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_0),
[`local_scan_0_them()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_0_them),
[`local_scan_1_ecount()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_1_ecount),
[`local_scan_1_ecount_them()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_1_ecount_them),
[`local_scan_k_ecount()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_k_ecount),
[`local_scan_k_ecount_them()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_k_ecount_them),
[`local_scan_neighborhood_ecount()`](https://igraph.org/c/html/latest/igraph-Structural.html#igraph_local_scan_neighborhood_ecount),
[[`induced_subgraph()`](https://r.igraph.org/reference/subgraph.md)](https://igraph.org/c/html/latest/igraph-Operators.html#igraph_induced_subgraph),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)

## See also

Other scan statistics:
[`local_scan()`](https://r.igraph.org/reference/local_scan.md)

## Examples

``` r
## Generate a bunch of SBMs, with the last one being different
num_t <- 20
block_sizes <- c(10, 5, 5)
p_ij <- list(p = 0.1, h = 0.9, q = 0.9)

P0 <- matrix(p_ij$p, 3, 3)
P0[2, 2] <- p_ij$h
PA <- P0
PA[3, 3] <- p_ij$q
num_v <- sum(block_sizes)

tsg <- replicate(num_t - 1, P0, simplify = FALSE) %>%
  append(list(PA)) %>%
  lapply(sample_sbm, n = num_v, block.sizes = block_sizes, directed = TRUE)

scan_stat(graphs = tsg, k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]         NA         NA         NA         NA         NA         NA
#>  [7] -1.1697700 -0.2651650  0.6250000  1.2602817 -1.4446625  1.7225186
#> [13]  0.3896089 -3.4982335  0.6159267  0.2313290  0.9336938  1.5069829
#> [19] -3.6615845  1.0355234
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA 19  5 19  1 18  6  7  2 12  8  5  6  1 17
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]         NA         NA         NA         NA         NA         NA
#>  [7] -2.6501648  0.5246276 -0.3435426  1.3416350 -0.8989103  0.5785419
#> [13]  0.2886589 -1.6301408  1.6198592  0.3928371 -0.7500000 -1.7889117
#> [19] -0.2118632  6.8527892
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  2  9 19  4 16 11  7  3  4 10 17  4  2 19
#> 
```
