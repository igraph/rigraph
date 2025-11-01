# List all minimum \\(s,t)\\-cuts of a graph

Listing all minimum \\(s,t)\\-cuts of a directed graph, for given \\s\\
and \\t\\.

## Usage

``` r
st_min_cuts(graph, source, target, capacity = NULL)
```

## Arguments

- graph:

  The input graph. It must be directed.

- source:

  The id of the source vertex.

- target:

  The id of the target vertex.

- capacity:

  Numeric vector giving the edge capacities. If this is `NULL` and the
  graph has a `weight` edge attribute, then this attribute defines the
  edge capacities. For forcing unit edge capacities, even for graphs
  that have a `weight` edge attribute, supply `NA` here.

## Value

A list with entries:

- value:

  Numeric scalar, the size of the minimum cut(s).

- cuts:

  A list of numeric vectors containing edge ids. Each vector is a
  minimum \\(s,t)\\-cut.

- partition1s:

  A list of numeric vectors containing vertex ids, they correspond to
  the edge cuts. Each vertex set is a generator of the corresponding
  cut, i.e. in the graph \\G=(V,E)\\, the vertex set \\X\\ and its
  complementer \\V-X\\, generates the cut that contains exactly the
  edges that go from \\X\\ to \\V-X\\.

## Details

Given a \\G\\ directed graph and two, different and non-ajacent
vertices, \\s\\ and \\t\\, an \\(s,t)\\-cut is a set of edges, such that
after removing these edges from \\G\\ there is no directed path from
\\s\\ to \\t\\.

The size of an \\(s,t)\\-cut is defined as the sum of the capacities (or
weights) in the cut. For unweighted (=equally weighted) graphs, this is
simply the number of edges.

An \\(s,t)\\-cut is minimum if it is of the smallest possible size.

## References

JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in graphs,
*Algorithmica* 15, 351–372, 1996.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`all_st_mincuts()`](https://igraph.org/c/html/latest/igraph-Flows.html#igraph_all_st_mincuts).

## Examples

``` r
# A difficult graph, from the Provan-Shier paper
g <- graph_from_literal(
  s --+ a:b, a:b --+ t,
  a --+ 1:2:3:4:5, 1:2:3:4:5 --+ b
)
st_min_cuts(g, source = "s", target = "t")
#> $value
#> [1] 2
#> 
#> $cuts
#> $cuts[[1]]
#> + 2/14 edges from f535614 (vertex names):
#> [1] s->a s->b
#> 
#> $cuts[[2]]
#> + 2/14 edges from f535614 (vertex names):
#> [1] s->a b->t
#> 
#> $cuts[[3]]
#> + 2/14 edges from f535614 (vertex names):
#> [1] a->t b->t
#> 
#> 
#> $partition1s
#> $partition1s[[1]]
#> + 1/9 vertex, named, from f535614:
#> [1] s
#> 
#> $partition1s[[2]]
#> + 2/9 vertices, named, from f535614:
#> [1] s b
#> 
#> $partition1s[[3]]
#> + 8/9 vertices, named, from f535614:
#> [1] s b a 5 4 3 2 1
#> 
#> 
```
