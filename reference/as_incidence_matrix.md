# As incidence matrix

**\[deprecated\]**

`as_incidence_matrix()` was renamed to
[`as_biadjacency_matrix()`](https://r.igraph.org/reference/as_biadjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
as_incidence_matrix(...)
```

## Details

Some authors refer to the bipartite adjacency matrix as the "bipartite
incidence matrix". igraph 1.6.0 and later does not use this naming to
avoid confusion with the edge-vertex incidence matrix.

## Related documentation in the C library

[`get_biadjacency`](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_get_biadjacency),
[`get_edgelist`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_get_edgelist),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
