# Compute local scan statistics on graphs

The scan statistic is a summary of the locality statistics that is
computed from the local neighborhood of each vertex. The `local_scan()`
function computes the local statistics for each vertex for a given
neighborhood size and the statistic function.

## Usage

``` r
local_scan(
  graph.us,
  graph.them = NULL,
  k = 1,
  FUN = NULL,
  weighted = FALSE,
  mode = c("out", "in", "all"),
  neighborhoods = NULL,
  weights = NULL,
  ...
)
```

## Arguments

- graph.us, graph:

  An igraph object, the graph for which the scan statistics will be
  computed

- graph.them:

  An igraph object or `NULL`, if not `NULL`, then the ‘them’ statistics
  is computed, i.e. the neighborhoods calculated from `graph.us` are
  evaluated on `graph.them`.

- k:

  An integer scalar, the size of the local neighborhood for each vertex.
  Should be non-negative.

- FUN:

  Character, a function name, or a function object itself, for computing
  the local statistic in each neighborhood. If `NULL`(the default
  value), [`ecount()`](https://r.igraph.org/reference/gsize.md) is used
  for unweighted graphs (if `weighted=FALSE`) and a function that
  computes the sum of edge weights is used for weighted graphs (if
  `weighted=TRUE`). This argument is ignored if `k` is zero.

- weighted:

  Logical scalar, TRUE if the edge weights should be used for
  computation of the scan statistic. If TRUE, the graph should be
  weighted. Note that this argument is ignored if `FUN` is not `NULL`,
  `"ecount"` and `"sumweights"`.

- mode:

  Character scalar, the kind of neighborhoods to use for the
  calculation. One of ‘`out`’, ‘`in`’, ‘`all`’ or ‘`total`’. This
  argument is ignored for undirected graphs.

- neighborhoods:

  A list of neighborhoods, one for each vertex, or `NULL`. If it is not
  `NULL`, then the function is evaluated on the induced subgraphs
  specified by these neighborhoods.

  In theory this could be useful if the same `graph.us` graph is used
  for multiple `graph.them` arguments. Then the neighborhoods can be
  calculated on `graph.us` and used with multiple graphs. In practice,
  this is currently slower than simply using `graph.them` multiple
  times.

- weights:

  Numeric vector, edge weights to use for the scan instead of the edge
  attribute weight. If `NULL` (the default) the edge weight attribute is
  used.

- ...:

  Arguments passed to `FUN`, the function that computes the local
  statistics.

## Value

For `local_scan()` typically a numeric vector containing the computed
local statistics for each vertex. In general a list or vector of
objects, as returned by `FUN`.

## Details

See the given reference below for the details on the local scan
statistics.

`local_scan()` calculates exact local scan statistics.

If `graph.them` is `NULL`, then `local_scan()` computes the ‘us’ variant
of the scan statistics. Otherwise, `graph.them` should be an igraph
object and the ‘them’ variant is computed using `graph.us` to extract
the neighborhood information, and applying `FUN` on these neighborhoods
in `graph.them`.

## Related documentation in the C library

[`local_scan_0`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0),
[`local_scan_0_them`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_0_them),
[`local_scan_1_ecount`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount),
[`local_scan_1_ecount_them`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_1_ecount_them),
[`local_scan_k_ecount`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount),
[`local_scan_k_ecount_them`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_k_ecount_them),
[`local_scan_neighborhood_ecount`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_local_scan_neighborhood_ecount),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`induced_subgraph`](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_induced_subgraph),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## References

Priebe, C. E., Conroy, J. M., Marchette, D. J., Park, Y. (2005). Scan
Statistics on Enron Graphs. *Computational and Mathematical Organization
Theory*.

## See also

Other scan statistics:
[`scan_stat()`](https://r.igraph.org/reference/scan_stat.md)

## Examples

``` r
pair <- sample_correlated_gnp_pair(n = 10^3, corr = 0.8, p = 0.1)
local_0_us <- local_scan(graph.us = pair$graph1, k = 0)
local_1_us <- local_scan(graph.us = pair$graph1, k = 1)

local_0_them <- local_scan(
  graph.us = pair$graph1,
  graph.them = pair$graph2, k = 0
)
local_1_them <- local_scan(
  graph.us = pair$graph1,
  graph.them = pair$graph2, k = 1
)

Neigh_1 <- neighborhood(pair$graph1, order = 1)
local_1_them_nhood <- local_scan(
  graph.us = pair$graph1,
  graph.them = pair$graph2,
  neighborhoods = Neigh_1
)
```
