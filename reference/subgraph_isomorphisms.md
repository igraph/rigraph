# All isomorphic mappings between a graph and subgraphs of another graph

All isomorphic mappings between a graph and subgraphs of another graph

## Usage

``` r
subgraph_isomorphisms(pattern, target, method = c("lad", "vf2"), ...)
```

## Arguments

- pattern:

  The smaller graph, it might be directed or undirected. Undirected
  graphs are treated as directed graphs with mutual edges.

- target:

  The bigger graph, it might be directed or undirected. Undirected
  graphs are treated as directed graphs with mutual edges.

- method:

  The method to use. Possible values: ‘auto’, ‘lad’, ‘vf2’. See their
  details below.

- ...:

  Additional arguments, passed to the various methods.

## Value

A list of vertex sequences, corresponding to all mappings from the first
graph to the second.

## ‘lad’ method

This is the LAD algorithm by Solnon, see the reference below. It has the
following extra arguments:

- domains:

  If not `NULL`, then it specifies matching restrictions. It must be a
  list of `target` vertex sets, given as numeric vertex ids or symbolic
  vertex names. The length of the list must be `vcount(pattern)` and for
  each vertex in `pattern` it gives the allowed matching vertices in
  `target`. Defaults to `NULL`.

- induced:

  Logical scalar, whether to search for an induced subgraph. It is
  `FALSE` by default.

- time.limit:

  The processor time limit for the computation, in seconds. It defaults
  to `Inf`, which means no limit.

## ‘vf2’ method

This method uses the VF2 algorithm by Cordella, Foggia et al., see
references below. It supports vertex and edge colors and have the
following extra arguments:

- vertex.color1, vertex.color2:

  Optional integer vectors giving the colors of the vertices for colored
  graph isomorphism. If they are not given, but the graph has a “color”
  vertex attribute, then it will be used. If you want to ignore these
  attributes, then supply `NULL` for both of these arguments. See also
  examples below.

- edge.color1, edge.color2:

  Optional integer vectors giving the colors of the edges for
  edge-colored (sub)graph isomorphism. If they are not given, but the
  graph has a “color” edge attribute, then it will be used. If you want
  to ignore these attributes, then supply `NULL` for both of these
  arguments.

## Related documentation in the C library

[`get_subisomorphisms_vf2()`](https://igraph.org/c/html/0.10.17/igraph-Isomorphism.html#igraph_get_subisomorphisms_vf2),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`isomorphisms()`](https://r.igraph.org/reference/isomorphisms.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md)
