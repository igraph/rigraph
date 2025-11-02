# List all (s,t)-cuts of a graph

List all (s,t)-cuts in a directed graph.

## Usage

``` r
st_cuts(graph, source, target)
```

## Arguments

- graph:

  The input graph. It must be directed.

- source:

  The source vertex.

- target:

  The target vertex.

## Value

A list with entries:

- cuts:

  A list of numeric vectors containing edge ids. Each vector is an
  \\(s,t)\\-cut.

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
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`all_st_cuts()`](https://igraph.org/c/html/latest/igraph-Flows.html#igraph_all_st_cuts).

## Examples

``` r
# A very simple graph
g <- graph_from_literal(a -+ b -+ c -+ d -+ e)
st_cuts(g, source = "a", target = "e")
#> $cuts
#> $cuts[[1]]
#> + 1/4 edge from 668240c (vertex names):
#> [1] a->b
#> 
#> $cuts[[2]]
#> + 1/4 edge from 668240c (vertex names):
#> [1] b->c
#> 
#> $cuts[[3]]
#> + 1/4 edge from 668240c (vertex names):
#> [1] c->d
#> 
#> $cuts[[4]]
#> + 1/4 edge from 668240c (vertex names):
#> [1] d->e
#> 
#> 
#> $partition1s
#> $partition1s[[1]]
#> + 1/5 vertex, named, from 668240c:
#> [1] a
#> 
#> $partition1s[[2]]
#> + 2/5 vertices, named, from 668240c:
#> [1] a b
#> 
#> $partition1s[[3]]
#> + 3/5 vertices, named, from 668240c:
#> [1] a b c
#> 
#> $partition1s[[4]]
#> + 4/5 vertices, named, from 668240c:
#> [1] a b c d
#> 
#> 

# A somewhat more difficult graph
g2 <- graph_from_literal(
  s --+ a:b, a:b --+ t,
  a --+ 1:2:3, 1:2:3 --+ b
)
st_cuts(g2, source = "s", target = "t")
#> $cuts
#> $cuts[[1]]
#> + 2/10 edges from 9e6b37a (vertex names):
#> [1] s->a s->b
#> 
#> $cuts[[2]]
#> + 2/10 edges from 9e6b37a (vertex names):
#> [1] s->a b->t
#> 
#> $cuts[[3]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->1 a->2 a->3
#> 
#> $cuts[[4]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->1 a->2 3->b
#> 
#> $cuts[[5]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->1 a->3 2->b
#> 
#> $cuts[[6]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->1 2->b 3->b
#> 
#> $cuts[[7]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->2 a->3 1->b
#> 
#> $cuts[[8]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->2 1->b 3->b
#> 
#> $cuts[[9]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t a->3 1->b 2->b
#> 
#> $cuts[[10]]
#> + 5/10 edges from 9e6b37a (vertex names):
#> [1] s->b a->t 1->b 2->b 3->b
#> 
#> $cuts[[11]]
#> + 2/10 edges from 9e6b37a (vertex names):
#> [1] a->t b->t
#> 
#> 
#> $partition1s
#> $partition1s[[1]]
#> + 1/7 vertex, named, from 9e6b37a:
#> [1] s
#> 
#> $partition1s[[2]]
#> + 2/7 vertices, named, from 9e6b37a:
#> [1] s b
#> 
#> $partition1s[[3]]
#> + 2/7 vertices, named, from 9e6b37a:
#> [1] s a
#> 
#> $partition1s[[4]]
#> + 3/7 vertices, named, from 9e6b37a:
#> [1] s a 3
#> 
#> $partition1s[[5]]
#> + 3/7 vertices, named, from 9e6b37a:
#> [1] s a 2
#> 
#> $partition1s[[6]]
#> + 4/7 vertices, named, from 9e6b37a:
#> [1] s a 2 3
#> 
#> $partition1s[[7]]
#> + 3/7 vertices, named, from 9e6b37a:
#> [1] s a 1
#> 
#> $partition1s[[8]]
#> + 4/7 vertices, named, from 9e6b37a:
#> [1] s a 1 3
#> 
#> $partition1s[[9]]
#> + 4/7 vertices, named, from 9e6b37a:
#> [1] s a 1 2
#> 
#> $partition1s[[10]]
#> + 5/7 vertices, named, from 9e6b37a:
#> [1] s a 1 2 3
#> 
#> $partition1s[[11]]
#> + 6/7 vertices, named, from 9e6b37a:
#> [1] s a 1 2 3 b
#> 
#> 
```
