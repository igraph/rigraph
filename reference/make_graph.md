# Create an igraph graph from a list of edges, or a notable graph

Create an igraph graph from a list of edges, or a notable graph

## Usage

``` r
make_graph(
  edges,
  ...,
  n = max(edges),
  isolates = NULL,
  directed = TRUE,
  dir = directed,
  simplify = TRUE
)

make_directed_graph(edges, n = max(edges))

make_undirected_graph(edges, n = max(edges))

directed_graph(...)

undirected_graph(...)
```

## Arguments

- edges:

  A vector defining the edges, the first edge points from the first
  element to the second, the second edge from the third to the fourth,
  etc. For a numeric vector, these are interpreted as internal vertex
  ids. For character vectors, they are interpreted as vertex names.

  Alternatively, this can be a character scalar, the name of a notable
  graph. See Notable graphs below. The name is case insensitive.

  Starting from igraph 0.8.0, you can also include literals here, via
  igraph's formula notation (see
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md)).
  In this case, the first term of the formula has to start with a ‘`~`’
  character, just like regular formulae in R. See examples below.

- ...:

  For `make_graph()`: extra arguments for the case when the graph is
  given via a literal, see
  [`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md).
  For `directed_graph()` and `undirected_graph()`: Passed to
  `make_directed_graph()` or `make_undirected_graph()`.

- n:

  The number of vertices in the graph. This argument is ignored (with a
  warning) if `edges` are symbolic vertex names. It is also ignored if
  there is a bigger vertex id in `edges`. This means that for this
  function it is safe to supply zero here if the vertex with the largest
  id is not an isolate.

- isolates:

  Character vector, names of isolate vertices, for symbolic edge lists.
  It is ignored for numeric edge lists.

- directed:

  Whether to create a directed graph.

- dir:

  It is the same as `directed`, for compatibility. Do not give both of
  them.

- simplify:

  For graph literals, whether to simplify the graph.

## Value

An igraph graph.

## Notable graphs

`make_graph()` can create some notable graphs. The name of the graph
(case insensitive), a character scalar must be supplied as the `edges`
argument, and other arguments are ignored. (A warning is given is they
are specified.)

`make_graph()` knows the following graphs:

- Bull:

  The bull graph, 5 vertices, 5 edges, resembles to the head of a bull
  if drawn properly.

- Chvatal:

  This is the smallest triangle-free graph that is both 4-chromatic and
  4-regular. According to the Grunbaum conjecture there exists an
  m-regular, m-chromatic graph with n vertices for every m\>1 and n\>2.
  The Chvatal graph is an example for m=4 and n=12. It has 24 edges.

- Coxeter:

  A non-Hamiltonian cubic symmetric graph with 28 vertices and 42 edges.

- Cubical:

  The Platonic graph of the cube. A convex regular polyhedron with 8
  vertices and 12 edges.

- Diamond:

  A graph with 4 vertices and 5 edges, resembles to a schematic diamond
  if drawn properly.

- Dodecahedral, Dodecahedron:

  Another Platonic solid with 20 vertices and 30 edges.

- Folkman:

  The semisymmetric graph with minimum number of vertices, 20 and 40
  edges. A semisymmetric graph is regular, edge transitive and not
  vertex transitive.

- Franklin:

  This is a graph whose embedding to the Klein bottle can be colored
  with six colors, it is a counterexample to the necessity of the
  Heawood conjecture on a Klein bottle. It has 12 vertices and 18 edges.

- Frucht:

  The Frucht Graph is the smallest cubical graph whose automorphism
  group consists only of the identity element. It has 12 vertices and 18
  edges.

- Grotzsch, Groetzsch:

  The Grötzsch graph is a triangle-free graph with 11 vertices, 20
  edges, and chromatic number 4. It is named after German mathematician
  Herbert Grötzsch, and its existence demonstrates that the assumption
  of planarity is necessary in Grötzsch's theorem that every
  triangle-free planar graph is 3-colorable.

- Heawood:

  The Heawood graph is an undirected graph with 14 vertices and 21
  edges. The graph is cubic, and all cycles in the graph have six or
  more edges. Every smaller cubic graph has shorter cycles, so this
  graph is the 6-cage, the smallest cubic graph of girth 6.

- Herschel:

  The Herschel graph is the smallest nonhamiltonian polyhedral graph. It
  is the unique such graph on 11 nodes, and has 18 edges.

- House:

  The house graph is a 5-vertex, 6-edge graph, the schematic draw of a
  house if drawn properly, basically a triangle of the top of a square.

- HouseX:

  The same as the house graph with an X in the square. 5 vertices and 8
  edges.

- Icosahedral, Icosahedron:

  A Platonic solid with 12 vertices and 30 edges.

- Krackhardt kite:

  A social network with 10 vertices and 18 edges. Krackhardt, D.
  Assessing the Political Landscape: Structure, Cognition, and Power in
  Organizations. Admin. Sci. Quart. 35, 342-369, 1990.

- Levi:

  The graph is a 4-arc transitive cubic graph, it has 30 vertices and 45
  edges.

- McGee:

  The McGee graph is the unique 3-regular 7-cage graph, it has 24
  vertices and 36 edges.

- Meredith:

  The Meredith graph is a quartic graph on 70 nodes and 140 edges that
  is a counterexample to the conjecture that every 4-regular 4-connected
  graph is Hamiltonian.

- Noperfectmatching:

  A connected graph with 16 vertices and 27 edges containing no perfect
  matching. A matching in a graph is a set of pairwise non-adjacent
  edges; that is, no two edges share a common vertex. A perfect matching
  is a matching which covers all vertices of the graph.

- Nonline:

  A graph whose connected components are the 9 graphs whose presence as
  a vertex-induced subgraph in a graph makes a nonline graph. It has 50
  vertices and 72 edges.

- Octahedral, Octahedron:

  Platonic solid with 6 vertices and 12 edges.

- Petersen:

  A 3-regular graph with 10 vertices and 15 edges. It is the smallest
  hypohamiltonian graph, i.e. it is non-hamiltonian but removing any
  single vertex from it makes it Hamiltonian.

- Robertson:

  The unique (4,5)-cage graph, i.e. a 4-regular graph of girth 5. It has
  19 vertices and 38 edges.

- Smallestcyclicgroup:

  A smallest nontrivial graph whose automorphism group is cyclic. It has
  9 vertices and 15 edges.

- Tetrahedral, Tetrahedron:

  Platonic solid with 4 vertices and 6 edges.

- Thomassen:

  The smallest hypotraceable graph, on 34 vertices and 52 edges. A
  hypotraceable graph does not contain a Hamiltonian path but after
  removing any single vertex from it the remainder always contains a
  Hamiltonian path. A graph containing a Hamiltonian path is called
  traceable.

- Tutte:

  Tait's Hamiltonian graph conjecture states that every 3-connected
  3-regular planar graph is Hamiltonian. This graph is a counterexample.
  It has 46 vertices and 69 edges.

- Uniquely3colorable:

  Returns a 12-vertex, triangle-free graph with chromatic number 3 that
  is uniquely 3-colorable.

- Walther:

  An identity graph with 25 vertices and 31 edges. An identity graph has
  a single graph automorphism, the trivial one.

- Zachary:

  Social network of friendships between 34 members of a karate club at a
  US university in the 1970s. See W. W. Zachary, An information flow
  model for conflict and fission in small groups, Journal of
  Anthropological Research 33, 452-473 (1977).

## See also

Other deterministic constructors:
[`graph_from_atlas()`](https://r.igraph.org/reference/graph_from_atlas.md),
[`graph_from_edgelist()`](https://r.igraph.org/reference/graph_from_edgelist.md),
[`graph_from_literal()`](https://r.igraph.org/reference/graph_from_literal.md),
[`make_()`](https://r.igraph.org/reference/make_.md),
[`make_chordal_ring()`](https://r.igraph.org/reference/make_chordal_ring.md),
[`make_circulant()`](https://r.igraph.org/reference/make_circulant.md),
[`make_empty_graph()`](https://r.igraph.org/reference/make_empty_graph.md),
[`make_full_citation_graph()`](https://r.igraph.org/reference/make_full_citation_graph.md),
[`make_full_graph()`](https://r.igraph.org/reference/make_full_graph.md),
[`make_full_multipartite()`](https://r.igraph.org/reference/make_full_multipartite.md),
[`make_lattice()`](https://r.igraph.org/reference/make_lattice.md),
[`make_ring()`](https://r.igraph.org/reference/make_ring.md),
[`make_star()`](https://r.igraph.org/reference/make_star.md),
[`make_tree()`](https://r.igraph.org/reference/make_tree.md),
[`make_turan()`](https://r.igraph.org/reference/make_turan.md),
[`make_wheel()`](https://r.igraph.org/reference/make_wheel.md)

## Examples

``` r
make_graph(c(1, 2, 2, 3, 3, 4, 5, 6), directed = FALSE)
#> IGRAPH db954ad U--- 6 4 -- 
#> + edges from db954ad:
#> [1] 1--2 2--3 3--4 5--6
make_graph(c("A", "B", "B", "C", "C", "D"), directed = FALSE)
#> IGRAPH ace46e5 UN-- 4 3 -- 
#> + attr: name (v/c)
#> + edges from ace46e5 (vertex names):
#> [1] A--B B--C C--D

solids <- list(
  make_graph("Tetrahedron"),
  make_graph("Cubical"),
  make_graph("Octahedron"),
  make_graph("Dodecahedron"),
  make_graph("Icosahedron")
)

graph <- make_graph(
  ~ A - B - C - D - A, E - A:B:C:D,
  F - G - H - I - F, J - F:G:H:I,
  K - L - M - N - K, O - K:L:M:N,
  P - Q - R - S - P, T - P:Q:R:S,
  B - F, E - J, C - I, L - T, O - T, M - S,
  C - P, C - L, I - L, I - P
)
```
