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
