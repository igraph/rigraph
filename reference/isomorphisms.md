# Calculate all isomorphic mappings between the vertices of two graphs

Calculate all isomorphic mappings between the vertices of two graphs

## Usage

``` r
isomorphisms(graph1, graph2, method = "vf2", ..., callback = NULL)
```

## Arguments

- graph1:

  The first graph.

- graph2:

  The second graph.

- method:

  Currently only ‘vf2’ is supported, see
  [`isomorphic()`](https://r.igraph.org/reference/isomorphic.md) for
  details about it and extra arguments.

- ...:

  Extra arguments, passed to the various methods.

- callback:

  Optional callback function to call for each isomorphism found. If
  provided, the function should accept two arguments: `map12` (integer
  vector mapping vertex IDs from graph1 to graph2, 1-based indexing) and
  `map21` (integer vector mapping vertex IDs from graph2 to graph1,
  1-based indexing). The function should return `FALSE` to continue the
  search or `TRUE` to stop it. If `NULL` (the default), all isomorphisms
  are collected and returned as a list. Only supported for
  `method = "vf2"`.

  **Important limitation:** Callback functions must NOT call any igraph
  functions (including simple queries like
  [`vcount()`](https://r.igraph.org/reference/gorder.md) or
  [`ecount()`](https://r.igraph.org/reference/gsize.md)). Doing so will
  cause R to crash due to reentrancy issues. Extract any needed graph
  information before calling the function with a callback, or use
  collector mode (the default) and process results afterward.

## Value

If `callback` is `NULL`, returns a list of vertex sequences,
corresponding to all mappings from the first graph to the second. If
`callback` is provided, returns `NULL` invisibly.

## See also

Other graph isomorphism:
[`canonical_permutation()`](https://r.igraph.org/reference/canonical_permutation.md),
[`count_isomorphisms()`](https://r.igraph.org/reference/count_isomorphisms.md),
[`count_subgraph_isomorphisms()`](https://r.igraph.org/reference/count_subgraph_isomorphisms.md),
[`graph_from_isomorphism_class()`](https://r.igraph.org/reference/graph_from_isomorphism_class.md),
[`isomorphic()`](https://r.igraph.org/reference/isomorphic.md),
[`isomorphism_class()`](https://r.igraph.org/reference/isomorphism_class.md),
[`subgraph_isomorphic()`](https://r.igraph.org/reference/subgraph_isomorphic.md),
[`subgraph_isomorphisms()`](https://r.igraph.org/reference/subgraph_isomorphisms.md)
