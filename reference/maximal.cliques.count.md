# Functions to find cliques, i.e. complete subgraphs in a graph

**\[deprecated\]**

`maximal.cliques.count()` was renamed to
[`count_max_cliques()`](https://r.igraph.org/reference/cliques.md) to
create a more consistent API.

## Usage

``` r
maximal.cliques.count(graph, min = NULL, max = NULL, subset = NULL)
```

## Arguments

- graph:

  The input graph.

- min:

  Numeric constant, lower limit on the size of the cliques to find.
  `NULL` means no limit, i.e. it is the same as 0.

- max:

  Numeric constant, upper limit on the size of the cliques to find.
  `NULL` means no limit.

- subset:

  If not `NULL`, then it must be a vector of vertex ids, numeric or
  symbolic if the graph is named. The algorithm is run from these
  vertices only, so only a subset of all maximal cliques is returned.
  See the Eppstein paper for details. This argument makes it possible to
  easily parallelize the finding of maximal cliques.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)
