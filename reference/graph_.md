# Convert object to a graph

This is a generic function to convert R objects to igraph graphs.

## Usage

``` r
graph_(...)
```

## Arguments

- ...:

  Parameters, see details below.

## Details

TODO

## Related documentation in the C library

[[`simplify()`](https://r.igraph.org/reference/simplify.md)](https://igraph.org/c/html/0.10.17/igraph-Operators.html#igraph_simplify),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## Examples

``` r
## These are equivalent
graph_(cbind(1:5, 2:6), from_edgelist(directed = FALSE))
#> Warning: `graph_()` was deprecated in igraph 2.1.0.
#> ℹ Please use constructors directly, for instance graph_from_edgelist().
#> ℹ graph_() will be removed in a future version of igraph.
#> IGRAPH cb55e21 U--- 6 5 -- 
#> + edges from cb55e21:
#> [1] 1--2 2--3 3--4 4--5 5--6
graph_(cbind(1:5, 2:6), from_edgelist(), directed = FALSE)
#> IGRAPH 9614076 U--- 6 5 -- 
#> + edges from 9614076:
#> [1] 1--2 2--3 3--4 4--5 5--6
```
