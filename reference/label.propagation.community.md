# Finding communities based on propagating labels

**\[deprecated\]**

`label.propagation.community()` was renamed to
[`cluster_label_prop()`](https://r.igraph.org/reference/cluster_label_prop.md)
to create a more consistent API.

## Usage

``` r
label.propagation.community(
  graph,
  weights = NULL,
  ...,
  mode = c("out", "in", "all"),
  initial = NULL,
  fixed = NULL
)
```

## Arguments

- graph:

  The input graph. Note that the algorithm was originally defined for
  undirected graphs. You are advised to set ‘mode’ to `all` if you pass
  a directed graph here to treat it as undirected.

- weights:

  The weights of the edges. It must be a positive numeric vector, `NULL`
  or `NA`. If it is `NULL` and the input graph has a ‘weight’ edge
  attribute, then that attribute will be used. If `NULL` and no such
  attribute is present, then the edges will have equal weights. Set this
  to `NA` if the graph was a ‘weight’ edge attribute, but you don't want
  to use it for community detection. A larger edge weight means a
  stronger connection for this function.

- ...:

  These dots are for future extensions and must be empty.

- mode:

  Logical, whether to consider edge directions for the label
  propagation, and if so, in which direction the labels should
  propagate. Ignored for undirected graphs. "all" means to ignore edge
  directions (even in directed graphs). "out" means to propagate labels
  along the natural direction of the edges. "in" means to propagate
  labels backwards (i.e. from head to tail).

- initial:

  The initial state. If `NULL`, every vertex will have a different label
  at the beginning. Otherwise it must be a vector with an entry for each
  vertex. Non-negative values denote different labels, negative entries
  denote vertices without labels.

- fixed:

  Logical vector denoting which labels are fixed. Of course this makes
  sense only if you provided an initial state, otherwise this element
  will be ignored. Also note that vertices without labels cannot be
  fixed.

## Related documentation in the C library

[`community_label_propagation()`](https://igraph.org/c/html/latest/igraph-Community.html#igraph_community_label_propagation),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/latest/igraph-Basic.html#igraph_edges)
