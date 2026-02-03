# Eigenvector centrality of vertices

`eigen_centrality()` takes a graph (`graph`) and returns the eigenvector
centralities of the vertices `v` within it.

## Usage

``` r
eigen_centrality(
  graph,
  directed = FALSE,
  scale = deprecated(),
  weights = NULL,
  options = arpack_defaults()
)
```

## Arguments

- graph:

  Graph to be analyzed.

- directed:

  Logical scalar, whether to consider direction of the edges in directed
  graphs. It is ignored for undirected graphs.

- scale:

  **\[deprecated\]** Normalization will always take place.

- weights:

  A numerical vector or `NULL`. This argument can be used to give edge
  weights for calculating the weighted eigenvector centrality of
  vertices. If this is `NULL` and the graph has a `weight` edge
  attribute then that is used. If `weights` is a numerical vector then
  it is used, even if the graph has a `weight` edge attribute. If this
  is `NA`, then no edge weights are used (even if the graph has a
  `weight` edge attribute). Note that if there are negative edge weights
  and the direction of the edges is considered, then the eigenvector
  might be complex. In this case only the real part is reported. This
  function interprets weights as connection strength. Higher weights
  spread the centrality better.

- options:

  A named list, to override some ARPACK options. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for details.

## Value

A named list with components:

- vector:

  A vector containing the centrality scores.

- value:

  The eigenvalue corresponding to the calculated eigenvector, i.e. the
  centrality scores.

- options:

  A named list, information about the underlying ARPACK computation. See
  [`arpack()`](https://r.igraph.org/reference/arpack.md) for the
  details.

## Details

Eigenvector centrality scores correspond to the values of the principal
eigenvector of the graph's adjacency matrix; these scores may, in turn,
be interpreted as arising from a reciprocal process in which the
centrality of each actor is proportional to the sum of the centralities
of those actors to whom he or she is connected. In general, vertices
with high eigenvector centralities are those which are connected to many
other vertices which are, in turn, connected to many others (and so on).
The perceptive may realize that this implies that the largest values
will be obtained by individuals in large cliques (or high-density
substructures). This is also intelligible from an algebraic point of
view, with the first eigenvector being closely related to the best
rank-1 approximation of the adjacency matrix (a relationship which is
easy to see in the special case of a diagonalizable symmetric real
matrix via the \\SLS^-1\\ decomposition).

The adjacency matrix used in the eigenvector centrality calculation
assumes that loop edges are counted *twice* in undirected graphs; this
is because each loop edge has *two* endpoints that are both connected to
the same vertex, and you could traverse the loop edge via either
endpoint.

In the directed case, the left eigenvector of the adjacency matrix is
calculated. In other words, the centrality of a vertex is proportional
to the sum of centralities of vertices pointing to it.

Eigenvector centrality is meaningful only for (strongly) connected
graphs. Undirected graphs that are not connected should be decomposed
into connected components, and the eigenvector centrality calculated for
each separately. This function does not verify that the graph is
connected. If it is not, in the undirected case the scores of all but
one component will be zeros.

Also note that the adjacency matrix of a directed acyclic graph or the
adjacency matrix of an empty graph does not possess positive
eigenvalues, therefore the eigenvector centrality is not defined for
these graphs. igraph will return an eigenvalue of zero in such cases.
The eigenvector centralities will all be equal for an empty graph and
will all be zeros for a directed acyclic graph. Such pathological cases
can be detected by checking whether the eigenvalue is very close to
zero.

From igraph version 0.5 this function uses ARPACK for the underlying
computation, see [`arpack()`](https://r.igraph.org/reference/arpack.md)
for more about ARPACK in igraph.

## Related documentation in the C library

[`eigenvector_centrality()`](https://igraph.org/c/html/0.10.17/igraph-Structural.html#igraph_eigenvector_centrality),
[[`vcount()`](https://r.igraph.org/reference/gorder.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_vcount),
[[`edges()`](https://r.igraph.org/reference/edge.md)](https://igraph.org/c/html/0.10.17/igraph-Basic.html#igraph_edges)

## References

Bonacich, P. (1987). Power and Centrality: A Family of Measures.
*American Journal of Sociology*, 92, 1170-1182.

## See also

Centrality measures
[`alpha_centrality()`](https://r.igraph.org/reference/alpha_centrality.md),
[`authority_score()`](https://r.igraph.org/reference/hub_score.md),
[`betweenness()`](https://r.igraph.org/reference/betweenness.md),
[`closeness()`](https://r.igraph.org/reference/closeness.md),
[`diversity()`](https://r.igraph.org/reference/diversity.md),
[`harmonic_centrality()`](https://r.igraph.org/reference/harmonic_centrality.md),
[`hits_scores()`](https://r.igraph.org/reference/hits_scores.md),
[`page_rank()`](https://r.igraph.org/reference/page_rank.md),
[`power_centrality()`](https://r.igraph.org/reference/power_centrality.md),
[`spectrum()`](https://r.igraph.org/reference/spectrum.md),
[`strength()`](https://r.igraph.org/reference/strength.md),
[`subgraph_centrality()`](https://r.igraph.org/reference/subgraph_centrality.md)

## Author

Gabor Csardi <csardi.gabor@gmail.com> and Carter T. Butts
(<https://www.faculty.uci.edu/profile.cfm?faculty_id=5057>) for the
manual page.

## Examples

``` r
# Generate some test data
g <- make_ring(10, directed = FALSE)
# Compute eigenvector centrality scores
eigen_centrality(g)
#> $vector
#>  [1] 1 1 1 1 1 1 1 1 1 1
#> 
#> $value
#> [1] 2
#> 
#> $options
#> $options$bmat
#> [1] "I"
#> 
#> $options$n
#> [1] 10
#> 
#> $options$which
#> [1] "LA"
#> 
#> $options$nev
#> [1] 1
#> 
#> $options$tol
#> [1] 0
#> 
#> $options$ncv
#> [1] 0
#> 
#> $options$ldv
#> [1] 0
#> 
#> $options$ishift
#> [1] 1
#> 
#> $options$maxiter
#> [1] 3000
#> 
#> $options$nb
#> [1] 1
#> 
#> $options$mode
#> [1] 1
#> 
#> $options$start
#> [1] 1
#> 
#> $options$sigma
#> [1] 0
#> 
#> $options$sigmai
#> [1] 0
#> 
#> $options$info
#> [1] 0
#> 
#> $options$iter
#> [1] 1
#> 
#> $options$nconv
#> [1] 1
#> 
#> $options$numop
#> [1] 7
#> 
#> $options$numopb
#> [1] 0
#> 
#> $options$numreo
#> [1] 6
#> 
#> 
```
