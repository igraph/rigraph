# Minimum size vertex separators

Find all vertex sets of minimal size whose removal separates the graph
into more components

## Usage

``` r
min_separators(graph)
```

## Arguments

- graph:

  The input graph. It may be directed, but edge directions are ignored.

## Value

A list of numeric vectors. Each numeric vector is a vertex separator.

## Details

This function implements the Kanevsky algorithm for finding all
minimal-size vertex separators in an undirected graph. See the reference
below for the details.

In the special case of a fully connected input graph with \\n\\
vertices, all subsets of size \\n-1\\ are listed as the result.

## References

Arkady Kanevsky: Finding all minimum-size separating vertex sets in a
graph. *Networks* 23 533–541, 1993.

JS Provan and DR Shier: A Paradigm for listing (s,t)-cuts in graphs,
*Algorithmica* 15, 351–372, 1996.

J. Moody and D. R. White. Structural cohesion and embeddedness: A
hierarchical concept of social groups. *American Sociological Review*,
68 103–127, Feb 2003.

## See also

Other flow:
[`dominator_tree()`](https://r.igraph.org/reference/dominator_tree.md),
[`edge_connectivity()`](https://r.igraph.org/reference/edge_connectivity.md),
[`is_min_separator()`](https://r.igraph.org/reference/is_min_separator.md),
[`is_separator()`](https://r.igraph.org/reference/is_separator.md),
[`max_flow()`](https://r.igraph.org/reference/max_flow.md),
[`min_cut()`](https://r.igraph.org/reference/min_cut.md),
[`min_st_separators()`](https://r.igraph.org/reference/min_st_separators.md),
[`st_cuts()`](https://r.igraph.org/reference/st_cuts.md),
[`st_min_cuts()`](https://r.igraph.org/reference/st_min_cuts.md),
[`vertex_connectivity()`](https://r.igraph.org/reference/vertex_connectivity.md)

## Related documentation in the C library

[`minimum_size_separators()`](https://igraph.org/c/html/0.10.17/igraph-Separators.html#igraph_minimum_size_separators).

## Examples

``` r
# The graph from the Moody-White paper
mw <- graph_from_literal(
  1 - 2:3:4:5:6, 2 - 3:4:5:7, 3 - 4:6:7, 4 - 5:6:7,
  5 - 6:7:21, 6 - 7, 7 - 8:11:14:19, 8 - 9:11:14, 9 - 10,
  10 - 12:13, 11 - 12:14, 12 - 16, 13 - 16, 14 - 15, 15 - 16,
  17 - 18:19:20, 18 - 20:21, 19 - 20:22:23, 20 - 21,
  21 - 22:23, 22 - 23
)

# Cohesive subgraphs
mw1 <- induced_subgraph(mw, as.character(c(1:7, 17:23)))
mw2 <- induced_subgraph(mw, as.character(7:16))
mw3 <- induced_subgraph(mw, as.character(17:23))
mw4 <- induced_subgraph(mw, as.character(c(7, 8, 11, 14)))
mw5 <- induced_subgraph(mw, as.character(1:7))

min_separators(mw)
#> [[1]]
#> + 1/23 vertex, named, from db4464c:
#> [1] 7
#> 
min_separators(mw1)
#> [[1]]
#> + 2/14 vertices, named, from b78381e:
#> [1] 5  19
#> 
#> [[2]]
#> + 2/14 vertices, named, from b78381e:
#> [1] 5 7
#> 
#> [[3]]
#> + 2/14 vertices, named, from b78381e:
#> [1] 7  21
#> 
#> [[4]]
#> + 2/14 vertices, named, from b78381e:
#> [1] 21 19
#> 
min_separators(mw2)
#> [[1]]
#> + 2/10 vertices, named, from 7b96c50:
#> [1] 10 16
#> 
#> [[2]]
#> + 2/10 vertices, named, from 7b96c50:
#> [1] 14 16
#> 
#> [[3]]
#> + 2/10 vertices, named, from 7b96c50:
#> [1] 8  10
#> 
min_separators(mw3)
#> [[1]]
#> + 2/7 vertices, named, from 88ab270:
#> [1] 21 19
#> 
min_separators(mw4)
#> [[1]]
#> + 3/4 vertices, named, from 18a7b9c:
#> [1] 8  11 14
#> 
#> [[2]]
#> + 3/4 vertices, named, from 18a7b9c:
#> [1] 7  11 14
#> 
#> [[3]]
#> + 3/4 vertices, named, from 18a7b9c:
#> [1] 7  8  14
#> 
#> [[4]]
#> + 3/4 vertices, named, from 18a7b9c:
#> [1] 7  8  11
#> 
min_separators(mw5)
#> [[1]]
#> + 5/7 vertices, named, from 8f1e51f:
#> [1] 2 3 4 5 6
#> 
#> [[2]]
#> + 5/7 vertices, named, from 8f1e51f:
#> [1] 1 3 4 5 7
#> 
#> [[3]]
#> + 5/7 vertices, named, from 8f1e51f:
#> [1] 1 2 4 6 7
#> 

# Another example, the science camp network
camp <- graph_from_literal(
  Harry:Steve:Don:Bert - Harry:Steve:Don:Bert,
  Pam:Brazey:Carol:Pat - Pam:Brazey:Carol:Pat,
  Holly - Carol:Pat:Pam:Jennie:Bill,
  Bill - Pauline:Michael:Lee:Holly,
  Pauline - Bill:Jennie:Ann,
  Jennie - Holly:Michael:Lee:Ann:Pauline,
  Michael - Bill:Jennie:Ann:Lee:John,
  Ann - Michael:Jennie:Pauline,
  Lee - Michael:Bill:Jennie,
  Gery - Pat:Steve:Russ:John,
  Russ - Steve:Bert:Gery:John,
  John - Gery:Russ:Michael
)
min_separators(camp)
#> [[1]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Pat   Holly
#> 
#> [[2]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Pat     Michael
#> 
#> [[3]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Pat  John
#> 
#> [[4]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Holly Gery 
#> 
#> [[5]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Michael Gery   
#> 
#> [[6]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] John Gery
#> 
#> [[7]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Gery Russ
#> 
#> [[8]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Holly   Michael
#> 
#> [[9]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Holly John 
#> 
#> [[10]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Steve Bert 
#> 
#> [[11]]
#> + 2/18 vertices, named, from 8362ea1:
#> [1] Steve Russ 
#> 
```
