# Graph from incidence matrix

**\[deprecated\]**

[`graph_from_incidence_matrix()`](https://r.igraph.org/reference/graph_from_incidence_matrix.md)
was renamed to
[`graph_from_biadjacency_matrix()`](https://r.igraph.org/reference/graph_from_biadjacency_matrix.md)
to create a more consistent API.

## Usage

``` r
from_incidence_matrix(...)
```

## Details

Some authors refer to the bipartite adjacency matrix as the "bipartite
incidence matrix". igraph 1.6.0 and later does not use this naming to
avoid confusion with the edge-vertex incidence matrix.

## Related documentation in the C library

[`biadjacency()`](https://igraph.org/c/html/0.10.17/igraph-Bipartite.html#igraph_biadjacency),
[`create()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_create),
[`empty()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_empty),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`famous()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_famous),
[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
