# Generate random graphs using preferential attachment

**\[deprecated\]**

`ba.game()` was renamed to
[`sample_pa()`](https://r.igraph.org/reference/sample_pa.md) to create a
more consistent API.

## Usage

``` r
ba.game(
  n,
  power = 1,
  m = NULL,
  out.dist = NULL,
  out.seq = NULL,
  out.pref = FALSE,
  zero.appeal = 1,
  directed = TRUE,
  algorithm = c("psumtree", "psumtree-multiple", "bag"),
  start.graph = NULL
)
```

## Arguments

- n:

  Number of vertices.

- power:

  The power of the preferential attachment, the default is one, i.e.
  linear preferential attachment.

- m:

  Numeric constant, the number of edges to add in each time step This
  argument is only used if both `out.dist` and `out.seq` are omitted or
  NULL.

- out.dist:

  Numeric vector, the distribution of the number of edges to add in each
  time step. This argument is only used if the `out.seq` argument is
  omitted or NULL.

- out.seq:

  Numeric vector giving the number of edges to add in each time step.
  Its first element is ignored as no edges are added in the first time
  step.

- out.pref:

  Logical, if true the total degree is used for calculating the citation
  probability, otherwise the in-degree is used.

- zero.appeal:

  The ‘attractiveness’ of the vertices with no adjacent edges. See
  details below.

- directed:

  Whether to create a directed graph.

- algorithm:

  The algorithm to use for the graph generation. `psumtree` uses a
  partial prefix-sum tree to generate the graph, this algorithm can
  handle any `power` and `zero.appeal` values and never generates
  multiple edges. `psumtree-multiple` also uses a partial prefix-sum
  tree, but the generation of multiple edges is allowed. Before the 0.6
  version igraph used this algorithm if `power` was not one, or
  `zero.appeal` was not one. `bag` is the algorithm that was previously
  (before version 0.6) used if `power` was one and `zero.appeal` was one
  as well. It works by putting the ids of the vertices into a bag
  (multiset, really), exactly as many times as their (in-)degree, plus
  once more. Then the required number of cited vertices are drawn from
  the bag, with replacement. This method might generate multiple edges.
  It only works if `power` and `zero.appeal` are equal one.

- start.graph:

  `NULL` or an igraph graph. If a graph, then the supplied graph is used
  as a starting graph for the preferential attachment algorithm. The
  graph should have at least one vertex. If a graph is supplied here and
  the `out.seq` argument is not `NULL`, then it should contain the out
  degrees of the new vertices only, not the ones in the `start.graph`.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount)
