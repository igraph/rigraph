# Project a bipartite graph

**\[deprecated\]**

`bipartite.projection()` was renamed to
[`bipartite_projection()`](https://r.igraph.org/reference/bipartite_projection.md)
to create a more consistent API.

## Usage

``` r
bipartite.projection(
  graph,
  types = NULL,
  multiplicity = TRUE,
  probe1 = NULL,
  which = c("both", "true", "false"),
  remove.type = TRUE
)
```

## Arguments

- graph:

  The input graph. It can be directed, but edge directions are ignored
  during the computation.

- types:

  An optional vertex type vector to use instead of the ‘`type`’ vertex
  attribute. You must supply this argument if the graph has no ‘`type`’
  vertex attribute.

- multiplicity:

  If `TRUE`, then igraph keeps the multiplicity of the edges as an edge
  attribute called ‘weight’. E.g. if there is an A-C-B and also an A-D-B
  triple in the bipartite graph (but no more X, such that A-X-B is also
  in the graph), then the multiplicity of the A-B edge in the projection
  will be 2.

- probe1:

  This argument can be used to specify the order of the projections in
  the resulting list. If given, then it is considered as a vertex id (or
  a symbolic vertex name); the projection containing this vertex will be
  the first one in the result list. This argument is ignored if only one
  projection is requested in argument `which`.

- which:

  A character scalar to specify which projection(s) to calculate. The
  default is to calculate both.

- remove.type:

  Logical scalar, whether to remove the `type` vertex attribute from the
  projections. This makes sense because these graphs are not bipartite
  any more. However if you want to combine them with each other (or
  other bipartite graphs), then it is worth keeping this attribute. By
  default it will be removed.
