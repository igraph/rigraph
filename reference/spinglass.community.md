# Finding communities in graphs based on statistical meachanics

**\[deprecated\]**

`spinglass.community()` was renamed to
[`cluster_spinglass()`](https://r.igraph.org/reference/cluster_spinglass.md)
to create a more consistent API.

## Usage

``` r
spinglass.community(
  graph,
  weights = NULL,
  vertex = NULL,
  spins = 25,
  parupdate = FALSE,
  start.temp = 1,
  stop.temp = 0.01,
  cool.fact = 0.99,
  update.rule = c("config", "random", "simple"),
  gamma = 1,
  implementation = c("orig", "neg"),
  gamma.minus = 1
)
```

## Arguments

- graph:

  The input graph. Edge directions are ignored in directed graphs.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- vertex:

  This parameter can be used to calculate the community of a given
  vertex without calculating all communities. Note that if this argument
  is present then some other arguments are ignored.

- spins:

  Integer constant, the number of spins to use. This is the upper limit
  for the number of communities. It is not a problem to supply a
  (reasonably) big number here, in which case some spin states will be
  unpopulated.

- parupdate:

  Logical constant, whether to update the spins of the vertices in
  parallel (synchronously) or not. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present). It is also not implemented in the “neg” implementation.

- start.temp:

  Real constant, the start temperature. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present).

- stop.temp:

  Real constant, the stop temperature. The simulation terminates if the
  temperature lowers below this level. This argument is ignored if the
  second form of the function is used (i.e. the ‘`vertex`’ argument is
  present).

- cool.fact:

  Cooling factor for the simulated annealing. This argument is ignored
  if the second form of the function is used (i.e. the ‘`vertex`’
  argument is present).

- update.rule:

  Character constant giving the ‘null-model’ of the simulation. Possible
  values: “simple” and “config”. “simple” uses a random graph with the
  same number of edges as the baseline probability and “config” uses a
  random graph with the same vertex degrees as the input graph.

- gamma:

  Real constant, the gamma argument of the algorithm. This specifies the
  balance between the importance of present and non-present edges in a
  community. Roughly, a comunity is a set of vertices having many edges
  inside the community and few edges outside the community. The default
  1.0 value makes existing and non-existing links equally important.
  Smaller values make the existing links, greater values the missing
  links more important.

- implementation:

  Character scalar. Currently igraph contains two implementations for
  the Spin-glass community finding algorithm. The faster original
  implementation is the default. The other implementation, that takes
  into account negative weights, can be chosen by supplying ‘neg’ here.

- gamma.minus:

  Real constant, the gamma.minus parameter of the algorithm. This
  specifies the balance between the importance of present and
  non-present negative weighted edges in a community. Smaller values of
  gamma.minus, leads to communities with lesser negative
  intra-connectivity. If this argument is set to zero, the algorithm
  reduces to a graph coloring algorithm, using the number of spins as
  the number of colors. This argument is ignored if the ‘orig’
  implementation is chosen.

## Related documentation in the C library

[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[[`ecount()`](https://r.igraph.org/reference/gsize.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)
