test_that("ensure_igraph() works", {
  expect_snapshot_error(ensure_igraph(1))
  expect_snapshot_error(ensure_igraph(NA))
  expect_snapshot_error(ensure_igraph(NULL))
  expect_silent(ensure_igraph(make_empty_graph()))
  expect_silent(ensure_igraph(NULL, optional = TRUE))
})

test_that("igraph.match.arg() works", {
  expect_snapshot(
    cluster_leiden(make_graph("Zachary"), objective_function = "something"),
    error = TRUE
  )
})
