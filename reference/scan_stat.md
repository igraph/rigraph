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

  The (numeric) vertex IDs for the vertex with the largest locality
  statistics, at each time step. It is `NA` for the initial `tau + ell`
  time steps.

## Related documentation in the C library

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`local_scan_neighborhood_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_neighborhood_ecount),
[`local_scan_0_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0_them),
[`local_scan_1_ecount_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount_them),
[`local_scan_k_ecount_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount_them),
[`local_scan_0()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0),
[`local_scan_1_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount),
[`local_scan_k_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount),
[`induced_subgraph()`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_induced_subgraph),
[`edges()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

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
#>  [7] -5.4319805  0.6755920 -0.6363961  1.2281328 -0.3646310 -0.5746264
#> [13]  0.1951904  1.4822330  1.4142136 -3.8750000 -0.4374205  6.3447689
#> [19] -0.4238759  4.8008829
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA 17  2 16 10  7  8 16 18 10 10 19  9  2 20
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]          NA          NA          NA          NA          NA          NA
#>  [7] -1.20588018  0.39907761 -0.42426407 -0.69536069  1.23754139 -1.63745861
#> [13]  0.67552109 -0.22493317  0.02451041 -0.87500000  0.37500000  0.00000000
#> [19]  2.25000000  7.07106781
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  5  2 16  5 14  8 16 18 18  1 19  9  6 20
#> 
```
