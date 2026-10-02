test_that("ensure_igraph() works", {
  expect_snapshot(error = TRUE, {
    ensure_igraph(1)
  })
  expect_snapshot(error = TRUE, {
    ensure_igraph(NA)
  })
  expect_snapshot(error = TRUE, {
    ensure_igraph(NULL)
  })
  expect_silent(ensure_igraph(make_empty_graph()))
  expect_silent(ensure_igraph(NULL, optional = TRUE))
})

test_that("igraph_match_arg() works", {
  expect_snapshot_igraph_error(
    cluster_leiden(make_graph("Zachary"), objective_function = "something")
  )
})

test_that("igraph_match_arg() agrees with rlang::arg_match() on valid input", {
  f <- function(mode = c("all", "out", "in", "total")) {
    igraph_match_arg(mode)
  }
  expect_equal(f(), "all")
  expect_equal(f("out"), "out")
  expect_equal(f("OUT"), "out")
  expect_equal(f(c("all", "out", "in", "total")), "all")
  expect_equal(f(c("ALL", "OUT", "IN", "TOTAL")), "all")
  expect_equal(igraph_match_arg("b", c("a", "B")), "b")
})

test_that("igraph_match_arg() rejects what rlang::arg_match() rejects", {
  f <- function(mode = c("all", "out", "in", "total")) {
    igraph_match_arg(mode)
  }
  expect_snapshot(error = TRUE, {
    f("o")
    f("foo")
    f(c("out", "in"))
    f(NA_character_)
    f(1)
  })
})
