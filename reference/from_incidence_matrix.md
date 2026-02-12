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
