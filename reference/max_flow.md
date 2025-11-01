# Maximum flow in a graph

In a graph where each edge has a given flow capacity the maximal flow
between two vertices is calculated.

## Usage

``` r
max_flow(graph, source, target, capacity = NULL)
```

## Arguments

- graph:

  The input graph.

- source:

  The id of the source vertex.

- target:

  The id of the target vertex (sometimes also called sink).

- capacity:

  Vector giving the capacity of the edges. If this is `NULL` (the
  default) then the `capacity` edge attribute is used. Note that the
  `weight` edge attribute is not used by this function.

## Value

A named list with components:

- value:

  A numeric scalar, the value of the maximum flow.

- flow:

  A numeric vector, the flow itself, one entry for each edge. For
  undirected graphs this entry is bit trickier, since for these the flow
  direction is not predetermined by the edge direction. For these graphs
  the elements of the this vector can be negative, this means that the
  flow goes from the bigger vertex id to the smaller one. Positive
  values mean that the flow goes from the smaller vertex id to the
  bigger one.

- cut:

  A numeric vector of edge ids, the minimum cut corresponding to the
  maximum flow.

- partition1:

  A numeric vector of vertex ids, the vertices in the first partition of
  the minimum cut corresponding to the maximum flow.

- partition2:

  A numeric vector of vertex ids, the vertices in the second partition
  of the minimum cut corresponding to the maximum flow.

- stats:

  A list with some statistics from the push-relabel algorithm. Five
  integer values currently: `nopush` is the number of push operations,
  `norelabel` the number of relabelings, `nogap` is the number of times
  the gap heuristics was used, `nogapnodes` is the total number of gap
  nodes omitted because of the gap heuristics and `nobfs` is the number
  of times a global breadth-first-search update was performed to assign
  better height (=distance) values to the vertices.

## Details

`max_flow()` calculates the maximum flow between two vertices in a
weighted (i.e. valued) graph. A flow from `source` to `target` is an
assignment of non-negative real numbers to the edges of the graph,
satisfying two properties: (1) for each edge the flow (i.e. the assigned
number) is not more than the capacity of the edge (the `capacity`
parameter or edge attribute), (2) for every vertex, except the source
and the target the incoming flow is the same as the outgoing flow. The
value of the flow is the incoming flow of the `target` vertex. The
maximum flow is the flow of maximum value.

## References

A. V. Goldberg and R. E. Tarjan: A New Approach to the Maximum Flow
Problem *Journal of the ACM* 35:921-940, 1988.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Related documentation in the C library

[`maxflow()`](https://igraph.org/c/html/latest/igraph-Flows.html#igraph_maxflow).

## Examples

``` r
E <- rbind(c(1, 3, 3), c(3, 4, 1), c(4, 2, 2), c(1, 5, 1), c(5, 6, 2), c(6, 2, 10))
colnames(E) <- c("from", "to", "capacity")
g1 <- graph_from_data_frame(as.data.frame(E))
max_flow(g1, source = V(g1)["1"], target = V(g1)["2"])
#> $value
#> [1] 2
#> 
#> $flow
#> [1] 1 1 1 1 1 1
#> 
#> $cut
#> + 2/6 edges from 7ff7b61 (vertex names):
#> [1] 3->4 1->5
#> 
#> $partition1
#> + 2/6 vertices, named, from 7ff7b61:
#> [1] 1 3
#> 
#> $partition2
#> + 4/6 vertices, named, from 7ff7b61:
#> [1] 4 5 6 2
#> 
#> $stats
#> $stats$nopush
#> [1] 4
#> 
#> $stats$norelabel
#> [1] 1
#> 
#> $stats$nogap
#> [1] 0
#> 
#> $stats$nogapnodes
#> [1] 0
#> 
#> $stats$nobfs
#> [1] 1
#> 
#> 
```
