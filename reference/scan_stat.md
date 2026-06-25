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

[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`local_scan_0()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0),
[`local_scan_0_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0_them),
[`local_scan_1_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount),
[`local_scan_1_ecount_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount_them),
[`local_scan_k_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount),
[`local_scan_k_ecount_them()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount_them),
[`local_scan_neighborhood_ecount()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_neighborhood_ecount),
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
#>  [1]          NA          NA          NA          NA          NA          NA
#>  [7] -0.05439283 -4.42143833  0.70710678 -0.12194311 -0.44521538  0.52735168
#> [13]  7.17382416 -0.55300697 -1.04651804 -0.47140452  0.62500000  2.00000000
#> [19] -2.12132034  7.67715934
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  5 16  6 10  1  3  2 20  5 10 16  3  9 17
#> 
scan_stat(graphs = tsg, locality = "them", k = 1, tau = 4, ell = 2)
#> $stat
#>  [1]         NA         NA         NA         NA         NA         NA
#>  [7] -0.7500000 -0.7500000  1.0000000  3.8750000 -0.1631785  0.1767767
#> [13] -0.6250000 -2.5936848  0.1683409  0.8593424 -0.3750000  3.0710678
#> [19] -1.0264800  2.6721932
#> 
#> $arg_max_v
#>  [1] NA NA NA NA NA NA  3 16 17  6  1  3 19 14  2 10 18 13  1 17
#> 
```
