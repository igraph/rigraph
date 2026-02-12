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
#>  [1]          NA          NA          NA          NA          NA          NA
#>  [7] -0.61509890  3.25000000 -0.60658251  2.11242679 -0.40894749 -1.23697715
#> [13]  0.46618808 -0.02210365  0.68385192  2.03226081 -1.17851130  1.76776695
#> [19]  1.41421356 15.25330342
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  4 19  2  4  9  2  7 20 10 19 17 18  5 20
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]          NA          NA          NA          NA          NA          NA
#>  [7]  0.12500000 -0.25000000  0.00000000  4.12500000  0.08838835 -2.15033062
#> [13]  0.70710678 -1.66852709 -0.23570226  2.50000000 -1.03851698  0.42067622
#> [19]  0.16834091 14.37500000
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  9  3 20  4  9  2 11  2 16 19  2 18  5 16
#> 
```
