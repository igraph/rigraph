# Minimum size vertex separators

List all vertex sets that are minimal \\(s,t)\\ separators for some
\\s\\ and \\t\\, in an undirected graph.

## Usage

``` r
min_st_separators(graph)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

## Value

A list of numeric vectors. Each vector contains a vertex set (defined by
vertex IDs), each vector is an (s,t) separator of the input graph, for
some \\s\\ and \\t\\.

## Details

A \\(s,t)\\ vertex separator is a set of vertices, such that after their
removal from the graph, there is no path between \\s\\ and \\t\\ in the
graph.

A \\(s,t)\\ vertex separator is minimal if none of its proper subsets is
an \\(s,t)\\ vertex separator for the same \\s\\ and \\t\\.

## Note

Note that the code below returns `{1, 3}` despite its subset `{1}` being
a separator as well. This is because `{1, 3}` is minimal with respect to
separating vertices 2 and 4.

    g <- make_graph(~ 0-1-2-3-4-1)
    min_st_separators(g)

    #> [[1]]
    #> -- <vertex sequence> 1/5 * named -----------------------------------------------
    #> [1] 1
    #>
    #> [[2]]
    #> -- <vertex sequence> 2/5 * named -----------------------------------------------
    #> [1] 2 4
    #>
    #> [[3]]
    #> -- <vertex sequence> 2/5 * named -----------------------------------------------
    #> [1] 1 3

## Related documentation in the C library

[`all_minimal_st_separators()`](https://igraph.org/c/html/0.10.17/igraph-Separators.html#igraph_all_minimal_st_separators),
[`vcount()`](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## References

Anne Berry, Jean-Paul Bordat and Olivier Cogis: Generating All the
Minimal Separators of a Graph, In: Peter Widmayer, Gabriele Neyer and
Stephan Eidenbenz (editors): *Graph-theoretic concepts in computer
science*, 1665, 167–172, 1999. Springer.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_separators()`](https://r.igraph.org/reference/min_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r

ring <- make_ring(4)
min_st_separators(ring)
#> [[1]]
#> ── <vertex sequence> 2/4 · from e9b8783 ────────────────────────────────────────
#> [1] 2 4
#> 
#> [[2]]
#> ── <vertex sequence> 2/4 · from e9b8783 ────────────────────────────────────────
#> [1] 1 3
#> 

chvatal <- make_graph("chvatal")
min_st_separators(chvatal)
#> [[1]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  7 10 11 12
#> 
#> [[2]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  6  8 11
#> 
#> [[3]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  7  9 12
#> 
#> [[4]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  8 10 11 12
#> 
#> [[5]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  6  9 11 12
#> 
#> [[6]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  5  7 10
#> 
#> [[7]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 3 6 8
#> 
#> [[8]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1] 2 4 7 9
#> 
#> [[9]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  5  8 10
#> 
#> [[10]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 4 6 9
#> 
#> [[11]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 2 4 5
#> 
#> [[12]]
#> ── <vertex sequence> 4/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 3 4 5
#> 
#> [[13]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  6  8 10 11 12
#> 
#> [[14]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  4  6  7  9 11 12
#> 
#> [[15]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  4  5  7 10 12
#> 
#> [[16]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  4  5  7 10 11
#> 
#> [[17]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  6  7  8  9 11 12
#> 
#> [[18]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  5  7  8 10 11
#> 
#> [[19]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  3  4  6  7  9 11
#> 
#> [[20]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 3 4 5 6 8
#> 
#> [[21]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  2  6  8  9 12
#> 
#> [[22]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  5  7  8 10 12
#> 
#> [[23]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 2 4 5 7 9
#> 
#> [[24]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  7  9 10 11 12
#> 
#> [[25]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  6  8  9 11 12
#> 
#> [[26]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  2  5  8 10 12
#> 
#> [[27]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  3  5  8 10 11
#> 
#> [[28]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  2  4  6  9 12
#> 
#> [[29]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  3  4  6  9 11
#> 
#> [[30]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  1  2  3  5  8 10
#> 
#> [[31]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1] 1 2 3 4 6 9
#> 
#> [[32]]
#> ── <vertex sequence> 6/12 · from 82591d1 ───────────────────────────────────────
#> [1]  2  3  4  5  7 10
#> 
# https://github.com/r-lib/roxygen2/issues/1092
```
