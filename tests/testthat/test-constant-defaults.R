# Migrated signatures carry only constant defaults; complex defaults are
# declared as `NULL` and resolved in the body after all arguments are
# available. These tests pin the user-visible semantics of that pattern.

test_that("NULL selector defaults stand for the full vertex/edge set", {
  g <- make_ring(5)
  E(g)$weight <- seq_len(5)

  # Passing NULL explicitly is now the same as not passing the argument.
  # (Before the constant-defaults cleanup an explicit NULL was coerced to an
  # empty selection -- an accident of as_igraph_vs(), never documented.)
  expect_identical(degree(g, v = NULL), degree(g))
  expect_identical(distances(g, v = NULL, to = NULL), distances(g))
  expect_identical(diversity(g, vids = NULL), diversity(g))
  expect_identical(which_mutual(g, eids = NULL), which_mutual(g))
  expect_identical(closeness(g, vids = NULL), closeness(g))
})

test_that("NULL non-selector defaults resolve in the body", {
  g <- make_ring(4)

  # sparse = NULL falls back to the sparsematrices option.
  local_igraph_options(sparsematrices = TRUE)
  expect_s4_class(as_adjacency_matrix(g), "dgCMatrix")
  local_igraph_options(sparsematrices = FALSE)
  expect_true(is.matrix(as_adjacency_matrix(g)))

  # eps = NULL falls back to the machine epsilon.
  bip <- make_bipartite_graph(c(0, 1, 0, 1), c(1, 2, 3, 4))
  expect_identical(max_bipartite_match(bip)$matching_size, 2)
})

test_that("NULL selector defaults of round-2 functions select the full set", {
  g <- make_ring(5)

  expect_identical(max_degree(g, v = NULL), max_degree(g))
  expect_identical(which_loop(g, eids = NULL), which_loop(g))
  expect_identical(which_multiple(g, eids = NULL), which_multiple(g))
  expect_identical(count_multiple(g, eids = NULL), count_multiple(g))
  expect_identical(count_triangles(g, vids = NULL), count_triangles(g))
  expect_identical(cocitation(g, v = NULL), cocitation(g))
  expect_identical(similarity(g, vids = NULL), similarity(g))
  expect_identical_graphs(reverse_edges(g, eids = NULL), reverse_edges(g))

  V(g)$name <- letters[1:5]
  expect_identical(vertex_attr(g, "name", index = NULL), vertex_attr(g, "name"))
  expect_identical(vertex.attributes(g, index = NULL), vertex.attributes(g))
  g2 <- set_vertex_attr(g, "x", index = NULL, value = 1)
  expect_identical(vertex_attr(g2, "x"), rep(1, 5))
})

test_that("NULL non-selector defaults of round-2 functions resolve in the body", {
  g <- make_ring(4)

  # option-backed defaults fall back to the igraph option
  expect_identical_graphs(
    simplify(g + edge(1, 2), edge_attr_combine = NULL),
    simplify(g + edge(1, 2))
  )
  expect_identical_graphs(
    as_undirected(as_directed(g), edge_attr_combine = NULL),
    as_undirected(as_directed(g))
  )

  # cross-referencing defaults resolve after all arguments are available
  igraph_local_seed(42)
  g1 <- sample_pref(20, types = 2, pref.matrix = NULL, type.dist = NULL)
  igraph_local_seed(42)
  g2 <- sample_pref(20, types = 2)
  expect_identical_graphs(g1, g2)

  igraph_local_seed(1)
  l1 <- layout_with_kk(g, kkconst = NULL, maxiter = NULL)
  igraph_local_seed(1)
  l2 <- layout_with_kk(g)
  expect_identical(l1, l2)
})

test_that("empty-sequence defaults are spelled as typed empty vectors", {
  # `c()` evaluates to NULL, so a `c()` default would collide with the
  # resolve-in-body sentinel. Typed empties stay constant and disjoint from
  # NULL: an explicit empty selection keeps meaning "nothing selected",
  # while NULL now always means "use the default".
  g <- make_graph(c(1, 2, 2, 2, 2, 3), directed = TRUE)
  expect_equal(max_degree(g, v = integer()), 0)
  expect_identical(which_loop(g, eids = integer()), logical(0))
  expect_gt(max_degree(g, v = NULL), 0)

  # layout_as_tree(): the typed empty stays the documented default
  tree <- make_tree(5)
  expect_identical(
    layout_as_tree(tree, root = numeric()),
    layout_as_tree(tree)
  )
})

test_that("positional recovery of a selector with a NULL default works", {
  # Regression: with `vids = V(graph)` as the default, re-evaluating the
  # default during recovery produced a fresh igraph.vs whose weakref `env`
  # attribute never compares identical(), so the legacy positional call
  # `diversity(g, weights, vids)` died with a spurious
  # "supplied more than once" error. A constant NULL default is stable, so
  # the recovery path works again.
  g <- make_ring(5)
  E(g)$weight <- seq_len(5)
  lifecycle::expect_deprecated(
    res <- diversity(g, NULL, V(g)[1:3])
  )
  expect_identical(res, diversity(g, weights = NULL, vids = V(g)[1:3]))
})
