test_that("ensure_igraph() works", {
  expect_snapshot_error(ensure_igraph(1))
  expect_silent(ensure_igraph(NULL))
  expect_silent(ensure_igraph(make_empty_graph()))
})
