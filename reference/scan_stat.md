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
#>  [1]         NA         NA         NA         NA         NA         NA
#>  [7] -0.4107949  0.3396761 -1.2467787  4.8807274 -0.6143971 -0.8718242
#> [13]  0.1806200  4.2597269 -0.9641438 -0.2499335  3.4373546  1.8997444
#> [19] -3.5675655  1.8114701
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  2  1  7  3 13 17 15 20  2 19  3  8 20 17
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]          NA          NA          NA          NA          NA          NA
#>  [7]  4.62500000  0.00000000 -1.08604416 -1.12952960  1.31716954  0.50088900
#> [13] -0.79487298  0.08493649 -1.04006351  1.37500000 -0.70710678 -0.53033009
#> [19] -0.87500000  7.25000000
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  2  1  7  3 13  1 14 12  2  5  5  8 18 18
#> 
```
