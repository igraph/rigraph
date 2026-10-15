test_that("head_of() and tail_of() work", {
  g <- make_graph(c(1, 2, 2, 3), directed = TRUE)
  expect_equal(as.numeric(head_of(g, E(g))), c(2, 3))
  expect_equal(as.numeric(tail_of(g, E(g))), c(1, 2))
})

test_that("head_of(es = ) and tail_of(es = ) are deprecated but still work", {
  rlang::local_options(lifecycle_verbosity = "warning")
  g <- make_graph(c(1, 2, 2, 3), directed = TRUE)
  expect_snapshot_igraph(res <- head_of(g, es = E(g)))
  expect_equal(res, head_of(g, edges = E(g)))
  lifecycle::expect_deprecated(res <- tail_of(g, es = E(g)))
  expect_equal(res, tail_of(g, edges = E(g)))
  expect_snapshot_igraph_error(head_of(g, edges = 1, es = 2))
})
