# Topological sorting of vertices in a graph

A topological sorting of a directed acyclic graph is a linear ordering
of its nodes where each node comes before all nodes to which it has
edges.

## Usage

``` r
topo_sort(graph, mode = c("out", "all", "in"))
```

## Arguments

- graph:

  The input graph, should be directed

- mode:

  Specifies how to use the direction of the edges. For “`out`”, the
  sorting order ensures that each node comes before all nodes to which
  it has edges, so nodes with no incoming edges go first. For “`in`”, it
  is quite the opposite: each node comes before all nodes from which it
  receives edges. Nodes with no outgoing edges go first.

## Value

A vertex sequence (by default, but see the `return.vs.es` option of
[`igraph_options()`](https://r.igraph.org/reference/igraph_options.md))
containing vertices in topologically sorted order.

## Details

Every DAG has at least one topological sort, and may have many. This
function returns a possible topological sort among them. If the graph is
not acyclic (it has at least one cycle), a partial topological sort is
returned and a warning is issued.

## Related documentation in the C library

[`topological_sorting()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_topological_sorting),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

Other structural.properties:
[`bfs()`](https://r.igraph.org/reference/bfs.md),
[`component_distribution()`](https://r.igraph.org/reference/components.md),
[`connect()`](https://r.igraph.org/reference/ego.md),
[`constraint()`](https://r.igraph.org/reference/constraint.md),
[`coreness()`](https://r.igraph.org/reference/coreness.md),
[`degree()`](https://r.igraph.org/reference/degree.md),
[`dfs()`](https://r.igraph.org/reference/dfs.md),
[`distance_table()`](https://r.igraph.org/reference/distances.md),
[`edge_density()`](https://r.igraph.org/reference/edge_density.md),
[`feedback_arc_set()`](https://r.igraph.org/reference/feedback_arc_set.md),
[`feedback_vertex_set()`](https://r.igraph.org/reference/feedback_vertex_set.md),
[`girth()`](https://r.igraph.org/reference/girth.md),
[`is_acyclic()`](https://r.igraph.org/reference/is_acyclic.md),
[`is_dag()`](https://r.igraph.org/reference/is_dag.md),
[`is_matching()`](https://r.igraph.org/reference/matching.md),
[`k_shortest_paths()`](https://r.igraph.org/reference/k_shortest_paths.md),
[`knn()`](https://r.igraph.org/reference/knn.md),
[`reciprocity()`](https://r.igraph.org/reference/reciprocity.md),
[`subcomponent()`](https://r.igraph.org/reference/subcomponent.md),
[`subgraph()`](https://r.igraph.org/reference/subgraph.md),
[`transitivity()`](https://r.igraph.org/reference/transitivity.md),
[`unfold_tree()`](https://r.igraph.org/reference/unfold_tree.md),
[`which_multiple()`](https://r.igraph.org/reference/which_multiple.md),
[`which_mutual()`](https://r.igraph.org/reference/which_mutual.md)

## Author

Tamas Nepusz <ntamas@gmail.com> and Gabor Csardi
<csardi.gabor@gmail.com> for the R interface

## Examples

``` r
g <- sample_pa(100)
topo_sort(g)
#> + 100/100 vertices, from 040f536:
#>   [1]   6   9  12  13  18  19  20  22  23  24  30  31  32  34  35  36  37  38
#>  [19]  39  40  41  44  46  47  50  51  52  53  54  55  56  60  61  62  63  64
#>  [37]  66  68  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84
#>  [55]  85  86  87  88  89  90  91  92  93  94  95  97  98  99 100  14  28  15
#>  [73]  45  10  48   4  67  17  29  16  59  33  58  49  43  42  65  11  96  57
#>  [91]   3  21  26   8  25  27   7   5   2   1
```
