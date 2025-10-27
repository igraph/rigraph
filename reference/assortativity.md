# Assortativity coefficient

The assortativity coefficient is positive if similar vertices (based on
some external property) tend to connect to each, and negative otherwise.

## Usage

``` r
assortativity(
  graph,
  values,
  ...,
  values.in = NULL,
  directed = TRUE,
  normalized = TRUE,
  types1 = NULL,
  types2 = NULL
)

assortativity_nominal(graph, types, directed = TRUE, normalized = TRUE)

assortativity_degree(graph, directed = TRUE)
```

## Arguments

- graph:

  The input graph, it can be directed or undirected.

- values:

  The vertex values, these can be arbitrary numeric values.

- ...:

  These dots are for future extensions and must be empty.

- values.in:

  A second value vector to use for the incoming edges when calculating
  assortativity for a directed graph. Supply `NULL` here if you want to
  use the same values for outgoing and incoming edges. This argument is
  ignored (with a warning) if it is not `NULL` and undirected
  assortativity coefficient is being calculated.

- directed:

  Logical scalar, whether to consider edge directions for directed
  graphs. This argument is ignored for undirected graphs. Supply `TRUE`
  here to do the natural thing, i.e. use directed version of the measure
  for directed graphs and the undirected version for undirected graphs.

- normalized:

  Boolean, whether to compute the normalized assortativity. The
  non-normalized nominal assortativity is identical to modularity. The
  non-normalized value-based assortativity is simply the covariance of
  the values at the two ends of edges.

- types1, types2:

  **\[deprecated\]** Deprecated aliases for `values` and `values.in`,
  respectively.

- types:

  Vector giving the vertex types. They as assumed to be integer numbers,
  starting with one. Non-integer values are converted to integers with
  [`as.integer()`](https://rdrr.io/r/base/integer.html).

## Value

A single real number.

## Details

The assortativity coefficient measures the level of homophyly of the
graph, based on some vertex labeling or values assigned to vertices. If
the coefficient is high, that means that connected vertices tend to have
the same labels or similar assigned values.

M.E.J. Newman defined two kinds of assortativity coefficients, the first
one is for categorical labels of vertices. `assortativity_nominal()`
calculates this measure. It is defined as

\$\$r=\frac{\sum_i e\_{ii}-\sum_i a_i b_i}{1-\sum_i a_i b_i}\$\$

where \\e\_{ij}\\ is the fraction of edges connecting vertices of type
\\i\\ and \\j\\, \\a_i=\sum_j e\_{ij}\\ and \\b_j=\sum_i e\_{ij}\\.

The second assortativity variant is based on values assigned to the
vertices. `assortativity()` calculates this measure. It is defined as

\$\$r=\frac1{\sigma_q^2}\sum\_{jk} jk(e\_{jk}-q_j q_k)\$\$

for undirected graphs (\\q_i=\sum_j e\_{ij}\\) and as

\$\$r=\frac1{\sigma_o\sigma_i}\sum\_{jk}jk(e\_{jk}-q_j^o q_k^i)\$\$

for directed ones. Here \\q_i^o=\sum_j e\_{ij}\\, \\q_i^i=\sum_j
e\_{ji}\\, moreover, \\\sigma_q\\, \\\sigma_o\\ and \\\sigma_i\\ are the
standard deviations of \\q\\, \\q^o\\ and \\q^i\\, respectively.

The reason of the difference is that in directed networks the
relationship is not symmetric, so it is possible to assign different
values to the outgoing and the incoming end of the edges.

`assortativity_degree()` uses vertex degree as vertex values and calls
`assortativity()`.

Undirected graphs are effectively treated as directed ones with
all-reciprocal edges. Thus, self-loops are taken into account twice in
undirected graphs.

## References

M. E. J. Newman: Mixing patterns in networks, *Phys. Rev. E* 67, 026126
(2003) <https://arxiv.org/abs/cond-mat/0209450>

M. E. J. Newman: Assortative mixing in networks, *Phys. Rev. Lett.* 89,
208701 (2002) <https://arxiv.org/abs/cond-mat/0205405>

## Author

Gabor Csardi <csardi.gabor@gmail.com>

## Related documentation in the C library

[`assortativity()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_assortativity),
[`assortativity_nominal()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_assortativity_nominal),
[`assortativity_degree()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_assortativity_degree).

## Examples

``` r
# random network, close to zero
assortativity_degree(sample_gnp(10000, 3 / 10000))
#> [1] -0.009772373

# BA model, tends to be dissortative
assortativity_degree(sample_pa(10000, m = 4))
#> [1] -0.02572967
```
