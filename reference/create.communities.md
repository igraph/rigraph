# Creates a communities object.

**\[deprecated\]**

`create.communities()` was renamed to
[`make_clusters()`](https://r.igraph.org/reference/make_clusters.md) to
create a more consistent API.

## Usage

``` r
create.communities(
  graph,
  membership = NULL,
  algorithm = NULL,
  merges = NULL,
  modularity = TRUE
)
```

## Arguments

- graph:

  The graph of the community structure.

- membership:

  The membership vector of the community structure, a numeric vector
  denoting the id of the community for each vertex. It might be `NULL`
  for hierarchical community structures.

- algorithm:

  Character string, the algorithm that generated the community
  structure, it can be arbitrary.

- merges:

  A merge matrix, for hierarchical community structures (or `NULL`
  otherwise.

- modularity:

  Modularity value of the community structure. If this is `TRUE` and the
  membership vector is available, then it the modularity values is
  calculated automatically.
