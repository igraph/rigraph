# Creating a graph from a given degree sequence, deterministically

It is often useful to create a graph with given vertex degrees. This
function creates such a graph in a deterministic manner.

## Usage

``` r
realize_degseq(
  out.deg,
  in.deg = NULL,
  allowed.edge.types = c("simple", "loops", "multi", "all"),
  method = c("smallest", "largest", "index")
)
```

## Arguments

- out.deg:

  Numeric vector, the sequence of degrees (for undirected graphs) or
  out-degrees (for directed graphs). For undirected graphs its sum
  should be even. For directed graphs its sum should be the same as the
  sum of `in.deg`.

- in.deg:

  For directed graph, the in-degree sequence. By default this is `NULL`
  and an undirected graph is created.

- allowed.edge.types:

  Character, specifies the types of allowed edges. “simple” allows
  simple graphs only (no loops, no multiple edges). “multiple” allows
  multiple edges but disallows loop. “loops” allows loop edges but
  disallows multiple edges (currently unimplemented). “all” allows all
  types of edges. The default is “simple”.

- method:

  Character, the method for generating the graph; see below.

## Value

The new graph object.

## Details

Simple undirected graphs are constructed using the Havel-Hakimi
algorithm (undirected case), or the analogous Kleitman-Wang algorithm
(directed case). These algorithms work by choosing an arbitrary vertex
and connecting all its stubs to other vertices. This step is repeated
until all degrees have been connected up.

The ‘method’ argument controls in which order the vertices are selected
during the course of the algorithm.

The “smallest” method selects the vertex with the smallest remaining
degree. The result is usually a graph with high negative degree
assortativity. In the undirected case, this method is guaranteed to
generate a connected graph, regardless of whether multi-edges are
allowed, provided that a connected realization exists. See Horvát and
Modes (2021) for details. In the directed case it tends to generate
weakly connected graphs, but this is not guaranteed. This is the default
method.

The “largest” method selects the vertex with the largest remaining
degree. The result is usually a graph with high positive degree
assortativity, and is often disconnected.

The “index” method selects the vertices in order of their index.

## Related documentation in the C library

[`realize_degree_sequence`](https://igraph.org/c/html/0.10.17/igraph-Generators.html#igraph_realize_degree_sequence)

## References

V. Havel, Poznámka o existenci konečných grafů (A remark on the
existence of finite graphs), Časopis pro pěstování matematiky 80,
477-480 (1955). https://eudml.org/doc/19050

S. L. Hakimi, On Realizability of a Set of Integers as Degrees of the
Vertices of a Linear Graph, Journal of the SIAM 10, 3 (1962).
[doi:10.1137/0111010](https://doi.org/10.1137/0111010)

D. J. Kleitman and D. L. Wang, Algorithms for Constructing Graphs and
Digraphs with Given Valences and Factors, Discrete Mathematics 6, 1
(1973).
[doi:10.1016/0012-365X(73)90037-X](https://doi.org/10.1016/0012-365X%2873%2990037-X)

Sz. Horvát and C. D. Modes, Connectedness matters: construction and
exact random sampling of connected networks (2021).
[doi:10.1088/2632-072X/abced5](https://doi.org/10.1088/2632-072X/abced5)

## See also

[`sample_degseq()`](https://r.igraph.org/reference/sample_degseq.md) for
a randomized variant that samples from graphs with the given degree
sequence.

## Examples

``` r
g <- realize_degseq(rep(2, 100))
degree(g)
#>   [1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [38] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#>  [75] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
is_simple(g)
#> [1] TRUE

## Exponential degree distribution, with high positive assortativity.
## Loop and multiple edges are explicitly allowed.
## Note that we correct the degree sequence if its sum is odd.
degs <- sample(1:100, 100, replace = TRUE, prob = exp(-0.5 * (1:100)))
if (sum(degs) %% 2 != 0) {
  degs[1] <- degs[1] + 1
}
g4 <- realize_degseq(degs, method = "largest", allowed.edge.types = "all")
all(degree(g4) == degs)
#> [1] TRUE

## Power-law degree distribution, no loops allowed but multiple edges
## are okay.
## Note that we correct the degree sequence if its sum is odd.
degs <- sample(1:100, 100, replace = TRUE, prob = (1:100)^-2)
if (sum(degs) %% 2 != 0) {
  degs[1] <- degs[1] + 1
}
g5 <- realize_degseq(degs, allowed.edge.types = "multi")
all(degree(g5) == degs)
#> [1] TRUE
```
