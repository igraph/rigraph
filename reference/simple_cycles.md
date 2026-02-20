# Finds all simple cycles in a graph.

**\[experimental\]**

This function lists all simple cycles in a graph within a range of cycle
lengths. A cycle is called simple if it has no repeated vertices.

Multi-edges and self-loops are taken into account. Note that typical
graphs have exponentially many cycles and the presence of multi-edges
exacerbates this combinatorial explosion.

## Usage

``` r
simple_cycles(
  graph,
  mode = c("out", "in", "all", "total"),
  min = NULL,
  max = NULL,
  ...,
  callback = NULL
)
```

## Arguments

- graph:

  The input graph.

- mode:

  Character constant specifying how to handle directed graphs. `out`
  follows edge directions, `in` follows edges in the reverse direction,
  and `all` ignores edge directions. Ignored in undirected graphs.

- min:

  Lower limit on cycle lengths to consider. `NULL` means no limit.

- max:

  Upper limit on cycle lengths to consider. `NULL` means no limit.

- ...:

  These dots are for future extensions and must be empty.

- callback:

  Optional function to call for each cycle found. If provided, the
  function should accept two arguments: `vertices` (integer vector of
  vertex IDs in the cycle) and `edges` (integer vector of edge IDs in
  the cycle). The function should return `FALSE` to continue the search
  or `TRUE` to stop it. If `NULL` (the default), all cycles are
  collected and returned as a list.

  **Important limitation:** Callback functions must NOT call any igraph
  functions (including simple queries like
  [`vcount()`](https://r.igraph.org/reference/gorder.md) or
  [`ecount()`](https://r.igraph.org/reference/gsize.md)). Doing so will
  cause R to crash due to nested
  [`.Call()`](https://rdrr.io/r/base/CallExternal.html) state
  corruption. Extract any needed graph information before calling the
  function with a callback, or use collector mode (the default) and
  process results afterward.

## Value

If `callback` is `NULL`, returns a list with two elements: `vertices`
(list of integer vectors with vertex IDs) and `edges` (list of integer
vectors with edge IDs). If `callback` is provided, returns `NULL`
invisibly.

If `callback` is `NULL`, returns a list with two elements: `vertices`
(list of integer vectors with vertex IDs) and `edges` (list of integer
vectors with edge IDs). If `callback` is provided, returns `NULL`
invisibly.

## Related documentation in the C library

[`simple_cycles`](https://igraph.org/c/html/0.10.17/igraph-Cycles.html#igraph_simple_cycles),
[`vcount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[`edges`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges),
[`get_eids`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_get_eids),
[`ecount`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_ecount)

## See also

Graph cycles
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`find_cycle()`](https://r.igraph.org/reference/find_cycle.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`has_eulerian_path()`](https://r.igraph.org/reference/has_eulerian_path.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md)

## Examples

``` r
g <- graph_from_literal(A -+ B -+ C -+ A -+ D -+ E +- F -+ A, E -+ E, A -+ F, simplify = FALSE)
simple_cycles(g)
#> $vertices
#> $vertices[[1]]
#> + 3/6 vertices, named, from 58581c1:
#> [1] A B C
#> 
#> $vertices[[2]]
#> + 2/6 vertices, named, from 58581c1:
#> [1] A F
#> 
#> $vertices[[3]]
#> + 1/6 vertex, named, from 58581c1:
#> [1] E
#> 
#> 
#> $edges
#> $edges[[1]]
#> + 3/9 edges from 58581c1 (vertex names):
#> [1] A->B B->C C->A
#> 
#> $edges[[2]]
#> + 2/9 edges from 58581c1 (vertex names):
#> [1] A->F F->A
#> 
#> $edges[[3]]
#> + 1/9 edge from 58581c1 (vertex names):
#> [1] E->E
#> 
#> 
simple_cycles(g, mode = "all") # ignore edge directions
#> $vertices
#> $vertices[[1]]
#> + 3/6 vertices, named, from 58581c1:
#> [1] A B C
#> 
#> $vertices[[2]]
#> + 4/6 vertices, named, from 58581c1:
#> [1] A D E F
#> 
#> $vertices[[3]]
#> + 4/6 vertices, named, from 58581c1:
#> [1] A D E F
#> 
#> $vertices[[4]]
#> + 2/6 vertices, named, from 58581c1:
#> [1] A F
#> 
#> $vertices[[5]]
#> + 1/6 vertex, named, from 58581c1:
#> [1] E
#> 
#> 
#> $edges
#> $edges[[1]]
#> + 3/9 edges from 58581c1 (vertex names):
#> [1] A->B B->C C->A
#> 
#> $edges[[2]]
#> + 4/9 edges from 58581c1 (vertex names):
#> [1] A->D D->E F->E F->A
#> 
#> $edges[[3]]
#> + 4/9 edges from 58581c1 (vertex names):
#> [1] A->D D->E F->E A->F
#> 
#> $edges[[4]]
#> + 2/9 edges from 58581c1 (vertex names):
#> [1] F->A A->F
#> 
#> $edges[[5]]
#> + 1/9 edge from 58581c1 (vertex names):
#> [1] E->E
#> 
#> 
simple_cycles(g, mode = "all", min = 2, max = 3) # limit cycle lengths
#> $vertices
#> $vertices[[1]]
#> + 3/6 vertices, named, from 58581c1:
#> [1] A B C
#> 
#> $vertices[[2]]
#> + 2/6 vertices, named, from 58581c1:
#> [1] A F
#> 
#> 
#> $edges
#> $edges[[1]]
#> + 3/9 edges from 58581c1 (vertex names):
#> [1] A->B B->C C->A
#> 
#> $edges[[2]]
#> + 2/9 edges from 58581c1 (vertex names):
#> [1] F->A A->F
#> 
#> 
```
