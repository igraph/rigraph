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
#>  [7] -0.3663352  1.0897620  1.4350900 -1.9583026  0.6596101 -0.5503353
#> [13]  0.2232686 -1.3261758  1.0001285 -0.5137072  1.2027638  1.6573034
#> [19] -2.3056519  6.6291261
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA 12  1 10 18 17 16 20  1  4 18 17  7  6 19
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]           NA           NA           NA           NA           NA
#>  [6]           NA  1.123611625  0.707106781 -0.169872981 -0.665063509
#> [11] -0.799693160 -0.009500163  0.886972320 -0.867842506  0.125000000
#> [16]  0.625000000  5.375000000 -0.832221876 -0.406551245  5.049621202
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  2  3 13 18 17 10  8  1 20 18 17  7  4 20
#> 
```
