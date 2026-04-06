# Matching

**\[deprecated\]**

`is.matching()` was renamed to
[`is_matching()`](https://r.igraph.org/reference/matching.md) to create
a more consistent API.

## Usage

``` r
is.matching(graph, matching, types = NULL)
```

## Arguments

- graph:

  The input graph. It might be directed, but edge directions will be
  ignored.

- matching:

  A potential matching. An integer vector that gives the pair in the
  matching for each vertex. For vertices without a pair, supply `NA`
  here.

- types:

  Vertex types, if the graph is bipartite. By default they are taken
  from the ‘`type`’ vertex attribute, if present.
