# Find Bonacich Power Centrality Scores of Network Positions

`power_centrality()` takes a graph (`dat`) and returns the Boncich power
centralities of positions (selected by `nodes`). The decay rate for
power contributions is specified by `exponent` (1 by default).

## Usage

``` r
power_centrality(
  graph,
  nodes = V(graph),
  loops = FALSE,
  exponent = 1,
  rescale = FALSE,
  tol = 1e-07,
  sparse = TRUE
)
```

## Arguments

- graph:

  the input graph.

- nodes:

  vertex sequence indicating which vertices are to be included in the
  calculation. By default, all vertices are included.

- loops:

  boolean indicating whether or not the diagonal should be treated as
  valid data. Set this true if and only if the data can contain loops.
  `loops` is `FALSE` by default.

- exponent:

  exponent (decay rate) for the Bonacich power centrality score; can be
  negative

- rescale:

  if true, centrality scores are rescaled such that they sum to 1.

- tol:

  tolerance for near-singularities during matrix inversion (see
  [`solve()`](https://rdrr.io/pkg/Matrix/man/solve-methods.html))

- sparse:

  Logical scalar, whether to use sparse matrices for the calculation.
  The ‘Matrix’ package is required for sparse matrix support

## Value

A vector, containing the centrality scores.

## Details

Bonacich's power centrality measure is defined by
\\C\_{BP}\left(\alpha,\beta\right)=\alpha\left(\mathbf{I}-\beta\mathbf{A}\right)^{-1}\mathbf{A}\mathbf{1}\\,
where \\\beta\\ is an attenuation parameter (set here by `exponent`) and
\\\mathbf{A}\\ is the graph adjacency matrix. (The coefficient
\\\alpha\\ acts as a scaling parameter, and is set here (following
Bonacich (1987)) such that the sum of squared scores is equal to the
number of vertices. This allows 1 to be used as a reference value for
the “middle” of the centrality range.) When \\\beta \rightarrow \\\\
1/\lambda\_{\mathbf{A}1}\\ (the reciprocal of the largest eigenvalue of
\\\mathbf{A}\\), this is to within a constant multiple of the familiar
eigenvector centrality score; for other values of \\\beta\\, the
behavior of the measure is quite different. In particular, \\\beta\\
gives positive and negative weight to even and odd walks, respectively,
as can be seen from the series expansion
\\C\_{BP}\left(\alpha,\beta\right)=\alpha \sum\_{k=0}^\infty \beta^k
\\\\ \mathbf{A}^{k+1} \mathbf{1}\\ which converges so long as
\\\|\beta\| \\\\ \< 1/\lambda\_{\mathbf{A}1}\\. The magnitude of
\\\beta\\ controls the influence of distant actors on ego's centrality
score, with larger magnitudes indicating slower rates of decay. (High
rates, hence, imply a greater sensitivity to edge effects.)

Interpretively, the Bonacich power measure corresponds to the notion
that the power of a vertex is recursively defined by the sum of the
power of its alters. The nature of the recursion involved is then
controlled by the power exponent: positive values imply that vertices
become more powerful as their alters become more powerful (as occurs in
cooperative relations), while negative values imply that vertices become
more powerful only as their alters become *weaker* (as occurs in
competitive or antagonistic relations). The magnitude of the exponent
indicates the tendency of the effect to decay across long walks; higher
magnitudes imply slower decay. One interesting feature of this measure
is its relative instability to changes in exponent magnitude
(particularly in the negative case). If your theory motivates use of
this measure, you should be very careful to choose a decay parameter on
a non-ad hoc basis.

For directed networks, the Bonacich power measure can be understood as
similar to status in the network where higher status nodes have more
edges that point from them to others with status. Node A's centrality
depends on the centrality of all the nodes that A points toward, and
their centrality depends on the nodes they point toward, etc. Note, this
means that a node with an out-degree of 0 will have a Bonacich power
centrality of 0 as they do not point towards anyone. When using this
with directed network it is important to think about the edge direction
and what it represents.

## Note

This function was ported (i.e. copied) from the SNA package.

## Warning

Singular adjacency matrices cause no end of headaches for this
algorithm; thus, the routine may fail in certain cases. This will be
fixed when we get a better algorithm.

## References

Bonacich, P. (1972). “Factoring and Weighting Approaches to Status
Scores and Clique Identification.” *Journal of Mathematical Sociology*,
2, 113-120.

Bonacich, P. (1987). “Power and Centrality: A Family of Measures.”
*American Journal of Sociology*, 92, 1170-1182.

## See also

[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md)
and
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md)

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`eigen_centrality()`](https://r.igraph.org/reference/eigen_centrality.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Carter T. Butts
(<https://www.faculty.uci.edu/profile.cfm?faculty_id=5057>), ported to
igraph by Gabor Csardi <csardi.gabor@gmail.com>

## Examples

``` r
# Generate some test data from Bonacich, 1987:
g.c <- make_graph(c(1, 2, 1, 3, 2, 4, 3, 5), dir = FALSE)
g.d <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 3, 6, 4, 7), dir = FALSE)
g.e <- make_graph(c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 3, 7, 3, 8, 4, 9, 4, 10), dir = FALSE)
g.f <- make_graph(
  c(1, 2, 1, 3, 1, 4, 2, 5, 2, 6, 2, 7, 3, 8, 3, 9, 3, 10, 4, 11, 4, 12, 4, 13),
  dir = FALSE
)
# Compute power centrality scores
for (e in seq(-0.5, .5, by = 0.1)) {
  print(round(power_centrality(g.c, exp = e)[c(1, 2, 4)], 2))
}
#> [1] 0.00 1.58 0.00
#> [1] 0.73 1.45 0.36
#> [1] 0.97 1.34 0.49
#> [1] 1.09 1.27 0.54
#> [1] 1.15 1.23 0.58
#> [1] 1.2 1.2 0.6
#> [1] 1.22 1.17 0.61
#> [1] 1.25 1.16 0.62
#> [1] 1.26 1.14 0.63
#> [1] 1.27 1.13 0.64
#> [1] 1.28 1.12 0.64

for (e in seq(-0.4, .4, by = 0.1)) {
  print(round(power_centrality(g.d, exp = e)[c(1, 2, 5)], 2))
}
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54
#> [1] 1.62 1.08 0.54

for (e in seq(-0.4, .4, by = 0.1)) {
  print(round(power_centrality(g.e, exp = e)[c(1, 2, 5)], 2))
}
#> [1] -1.00  1.67 -0.33
#> [1] 0.36 1.81 0.12
#> [1] 1.00 1.67 0.33
#> [1] 1.30 1.55 0.43
#> [1] 1.46 1.46 0.49
#> [1] 1.57 1.40 0.52
#> [1] 1.63 1.36 0.54
#> [1] 1.68 1.33 0.56
#> [1] 1.72 1.30 0.57

for (e in seq(-0.4, .4, by = 0.1)) {
  print(round(power_centrality(g.f, exp = e)[c(1, 2, 5)], 2))
}
#> [1] -1.72  1.53 -0.57
#> [1] -0.55  2.03 -0.18
#> [1] 0.44 2.05 0.15
#> [1] 1.01 1.91 0.34
#> [1] 1.33 1.78 0.44
#> [1] 1.52 1.67 0.51
#> [1] 1.65 1.59 0.55
#> [1] 1.74 1.53 0.58
#> [1] 1.80 1.48 0.60
```
