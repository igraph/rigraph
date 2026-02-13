# Creating a bipartite graph from two degree sequences, deterministically

**\[experimental\]**

Constructs a bipartite graph from the degree sequences of its
partitions, if one exists. This function uses a Havel-Hakimi style
construction algorithm.

## Usage

``` r
realize_bipartite_degseq(
  degrees1,
  degrees2,
  ...,
  allowed.edge.types = c("simple", "multiple"),
  method = c("smallest", "largest", "index")
)
```

## Arguments

- degrees1:

  The degrees of the first partition.

- degrees2:

  The degrees of the second partition.

- ...:

  These dots are for future extensions and must be empty.

- allowed.edge.types:

  Character, specifies the types of allowed edges. “simple” allows
  simple graphs only (no multiple edges). “multiple” allows multiple
  edges.

- method:

  Character, the method for generating the graph; see below.

## Value

The new graph object.

## Details

The ‘method’ argument controls in which order the vertices are selected
during the course of the algorithm.

The “smallest” method selects the vertex with the smallest remaining
degree, from either partition. The result is usually a graph with high
negative degree assortativity. In the undirected case, this method is
guaranteed to generate a connected graph, regardless of whether
multi-edges are allowed, provided that a connected realization exists.
This is the default method.

The “largest” method selects the vertex with the largest remaining
degree. The result is usually a graph with high positive degree
assortativity, and is often disconnected.

The “index” method selects the vertices in order of their index.

## Related documentation in the C library

[`realize_bipartite_degree_sequence()`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_realize_bipartite_degree_sequence),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount)

## See also

[`realize_degseq()`](https://r.igraph.org/reference/realize_degseq.md)
to create a not necessarily bipartite graph.

## Examples

``` r
g <- realize_bipartite_degseq(c(3, 3, 2, 1, 1), c(2, 2, 2, 2, 2))
degree(g)
#>  [1] 3 3 2 1 1 2 2 2 2 2
```
