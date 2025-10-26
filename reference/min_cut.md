# Minimum cut in a graph

`min_cut()` calculates the minimum st-cut between two vertices in a
graph (if the `source` and `target` arguments are given) or the minimum
cut of the graph (if both `source` and `target` are `NULL`).

## Usage

``` r
min_cut(
  graph,
  source = NULL,
  target = NULL,
  capacity = NULL,
  value.only = TRUE
)
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
  default) then the `capacity` edge attribute is used.

- value.only:

  Logical scalar, if `TRUE` only the minimum cut value is returned, if
  `FALSE` the edges in the cut and a the two (or more) partitions are
  also returned.

## Value

For `min_cut()` a nuieric constant, the value of the minimum cut, except
if `value.only = FALSE`. In this case a named list with components:

- value:

  Numeric scalar, the cut value.

- cut:

  Numeric vector, the edges in the cut.

- partition1:

  The vertices in the first partition after the cut edges are removed.
  Note that these vertices might be actually in different components
  (after the cut edges are removed), as the graph may fall apart into
  more than two components.

- partition2:

  The vertices in the second partition after the cut edges are removed.
  Note that these vertices might be actually in different components
  (after the cut edges are removed), as the graph may fall apart into
  more than two components.

## Details

The minimum st-cut between `source` and `target` is the minimum total
weight of edges needed to remove to eliminate all paths from `source` to
`target`.

The minimum cut of a graph is the minimum total weight of the edges
needed to remove to separate the graph into (at least) two components.
(Which is to make the graph *not* strongly connected in the directed
case.)

The maximum flow between two vertices in a graph is the same as the
minimum st-cut, so
[`max_flow()`](https://r.igraph.org/reference/max_flow.md) and
`min_cut()` essentially calculate the same quantity, the only difference
is that `min_cut()` can be invoked without giving the `source` and
`target` arguments and then minimum of all possible minimum cuts is
calculated.

For undirected graphs the Stoer-Wagner algorithm (see reference below)
is used to calculate the minimum cut.

## References

M. Stoer and F. Wagner: A simple min-cut algorithm, *Journal of the
ACM*, 44 585-591, 1997.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Examples

``` r
g <- make_ring(100)
min_cut(g, capacity = rep(1, vcount(g)))
#> [1] 2
min_cut(g, value.only = FALSE, capacity = rep(1, vcount(g)))
#> $value
#> [1] 2
#> 
#> $cut
#> + 2/100 edges from 60025db:
#> [1] 1--2 2--3
#> 
#> $partition1
#> + 1/100 vertex, from 60025db:
#> [1] 2
#> 
#> $partition2
#> + 99/100 vertices, from 60025db:
#>  [1]   1   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17  18  19  20
#> [20]  21  22  23  24  25  26  27  28  29  30  31  32  33  34  35  36  37  38  39
#> [39]  40  41  42  43  44  45  46  47  48  49  50  51  52  53  54  55  56  57  58
#> [58]  59  60  61  62  63  64  65  66  67  68  69  70  71  72  73  74  75  76  77
#> [77]  78  79  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95  96
#> [96]  97  98  99 100
#> 

g2 <- make_graph(c(1, 2, 2, 3, 3, 4, 1, 6, 6, 5, 5, 4, 4, 1))
E(g2)$capacity <- c(3, 1, 2, 10, 1, 3, 2)
min_cut(g2, value.only = FALSE)
#> $value
#> [1] 1
#> 
#> $cut
#> + 1/7 edge from 4c5e5b3:
#> [1] 2->3
#> 
#> $partition1
#> + 1/6 vertex, from 4c5e5b3:
#> [1] 2
#> 
#> $partition2
#> + 5/6 vertices, from 4c5e5b3:
#> [1] 1 3 4 5 6
#> 
```
