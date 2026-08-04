test_that("radius() works", {
  igraph_local_seed(42)
  g <- make_tree(10, 2, mode = "out")

  expect_equal(radius(g), 3)
  expect_equal(radius(g, mode = "in"), 0)
  expect_equal(radius(g, mode = "out"), 0)
})

test_that("radius() works -- weights", {
  g <- make_ring(10)
  expect_equal(radius(g), 5)

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(radius(g), 24)
})

test_that("radius() works -- lifecycle", {
  rlang::local_options(lifecycle_verbosity = "warning")
  igraph_local_seed(42)
  g <- make_tree(10, 2, mode = "out")

  expect_snapshot(radius(g, "out"))
})

test_that("eccentricity() works", {
  igraph_local_seed(42)
  g <- make_tree(10, 2, mode = "out")

  expect_equal(eccentricity(g), c(3, 3, 4, 4, 4, 5, 5, 5, 5, 5))
  expect_equal(eccentricity(g, mode = "in"), c(0, 1, 1, 2, 2, 2, 2, 3, 3, 3))
  expect_equal(eccentricity(g, mode = "out"), c(3, 2, 1, 1, 1, 0, 0, 0, 0, 0))
})

test_that("eccentricity() works -- weights", {
  g <- make_ring(10)
  expect_equal(eccentricity(g), rep(5, 10))

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(eccentricity(g), c(27, 27, 25, 25, 26, 25, 24, 27, 26, 25))
})

test_that("eccentricity() works -- lifecycle", {
  rlang::local_options(lifecycle_verbosity = "warning")
  igraph_local_seed(42)
  g <- make_tree(10, 2, mode = "out")

  expect_snapshot(eccentricity(g, vids = V(g), "out"))
})

test_that("graph_center() works", {
  igraph_local_seed(42)
  g <- make_tree(100, 7, mode = "out")
  expect_equal(as.numeric(graph_center(g)), c(1, 2))
  expect_equal(as.numeric(graph_center(g, mode = "in")), 1)
  expect_equal(as.numeric(graph_center(g, mode = "out")), 16:100)
})

test_that("graph_center() works -- weights", {
  g <- make_ring(10)
  expect_equal(as.numeric(graph_center(g)), 1:10)

  E(g)$weight <- seq_len(ecount(g))
  expect_equal(as.numeric(graph_center(g)), 7)
})

test_that("all_simple_paths() passes on cutoff argument", {
  g <- make_ring(7)
  expect_equal(lengths(all_simple_paths(g, 1, cutoff = 1)), c(2, 2))
  expect_equal(lengths(all_simple_paths(g, 1, cutoff = 2)), c(2, 3, 2, 3))
  expect_equal(
    lengths(all_simple_paths(g, 1)),
    c(2, 3, 4, 5, 6, 7, 2, 3, 4, 5, 6, 7)
  )
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("all_simple_paths() tail arguments and legacy positional recovery", {
  g <- make_ring(5, directed = TRUE)

  # mode = "in" walks the ring against the edge directions.
  res <- all_simple_paths(g, 1, 3, mode = "in")
  expect_length(res, 1)
  expect_equal(as.numeric(res[[1]]), c(1, 5, 4, 3))

  lifecycle::expect_deprecated(res2 <- all_simple_paths(g, 1, 3, "in"))
  expect_equal(res2, all_simple_paths(g, 1, 3, mode = "in"))
})

test_that("distance_table() tail arguments and legacy positional recovery", {
  g <- make_ring(4, directed = TRUE)

  res <- distance_table(g, directed = FALSE)
  expect_equal(res$res, c(4, 2))
  expect_equal(res$unconnected, 0)

  lifecycle::expect_deprecated(res2 <- distance_table(g, FALSE))
  expect_identical(res2, distance_table(g, directed = FALSE))
})
