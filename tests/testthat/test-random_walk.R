test_that("undirected random_walk works", {
  igraph_local_seed(20231029)
  g <- make_ring(10)
  w <- random_walk(g, start = 1, steps = 10)
  expect_length(w, 11)
  expect_true(all(abs(diff(as.numeric(w))) %in% c(1, 9)))
})

test_that("directed random_walk works", {
  igraph_local_seed(20231029)
  g <- make_ring(10, directed = TRUE)
  w <- as_ids(random_walk(g, start = 1, steps = 5))
  expect_equal(w, 1:6)

  w2 <- as_ids(random_walk(g, start = 4, steps = 5, mode = "in"))
  expect_equal(w2, c(4:1, 10:9))

  w3 <- as_ids(random_walk(g, start = 1, steps = 5, mode = "all"))
  expect_length(w3, 6)
  expect_true(all(abs(diff(as.numeric(w3))) %in% c(1, 9)))
})

test_that("directed random_walk can return wtih an error when stuck", {
  igraph_local_seed(42)
  g <- make_star(11, mode = "out")
  expect_error(
    random_walk(g, start = 7, steps = 10, stuck = "error"),
    "Random walk got stuck"
  )
})

test_that("undirected random_edge_walk works", {
  igraph_local_seed(20231029)
  g <- make_star(11, mode = "undirected")
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_equal(rle(as.numeric(w))$lengths, rep(2, 5))

  g <- make_ring(10)
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_length(w, 10)
  expect_true(all(abs(diff(as.numeric(w))) %in% c(0, 1, 9)))
})

test_that("directed random_edge_walk works", {
  g <- make_star(11, mode = "out")

  igraph_local_seed(20231029)
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_length(w, 1)

  w <- random_edge_walk(g, start = 7, steps = 10)
  expect_length(w, 0)

  g <- make_ring(10, directed = TRUE)
  w <- random_edge_walk(g, start = 1, steps = 5)
  expect_equal(
    ignore_attr = TRUE,
    w,
    structure(c(1L, 2L, 3L, 4L, 5L), class = "igraph.es")
  )

  w <- random_edge_walk(g, start = 1, steps = 5, mode = "in")
  expect_equal(
    ignore_attr = TRUE,
    w,
    structure(c(10L, 9L, 8L, 7L, 6L), class = "igraph.es")
  )

  w <- random_edge_walk(g, start = 1, steps = 10, mode = "all")
  expect_length(w, 10)
  expect_true(all(abs(diff(as.numeric(w))) %in% c(0, 1, 9)))
})

test_that("directed random_edge_walk can return wtih an error when stuck", {
  igraph_local_seed(20231029)
  g <- make_star(11, mode = "out")
  expect_error(
    random_edge_walk(g, start = 7, steps = 10, stuck = "error"),
    "Random walk got stuck"
  )
})

# ---- ellipsis migration: argument coverage ----------------------------

test_that("random_walk follows edge weights and returns partial walks when stuck", {
  igraph_local_seed(42)

  # The heavy edge to vertex 4 forces the walk to bounce between 1 and 4.
  g <- make_star(5, mode = "undirected")
  w <- random_walk(g, start = 1, steps = 6, weights = c(1, 1, 1e12, 1))
  expect_equal(as_ids(w), rep_len(c(1, 4), 7))

  # A walk starting on a sink vertex stops immediately with stuck = "return".
  g2 <- make_star(11, mode = "out")
  w2 <- random_walk(g2, start = 7, steps = 10, stuck = "return")
  expect_equal(as_ids(w2), 7)
})

test_that("random_walk recovers legacy positional arguments", {
  g <- make_star(5, mode = "undirected")
  lifecycle::expect_deprecated(
    res <- igraph_with_seed(42, random_walk(g, 1, 6, c(1, 1, 1e12, 1)))
  )
  expect_equal(
    res,
    igraph_with_seed(42, random_walk(g, 1, 6, weights = c(1, 1, 1e12, 1)))
  )
  expect_equal(as_ids(res), rep_len(c(1, 4), 7))
})

test_that("random_edge_walk follows edge weights", {
  igraph_local_seed(42)
  # A two-cycle with one heavy edge keeps the walker crossing that edge.
  g <- make_ring(2)
  w <- random_edge_walk(g, start = 1, steps = 8, weights = c(1e12, 1))
  expect_length(w, 8)
  expect_equal(as.integer(w), rep(1L, 8))
})

test_that("random_edge_walk recovers legacy positional arguments", {
  g <- make_ring(2)
  lifecycle::expect_deprecated(
    res <- igraph_with_seed(42, random_edge_walk(g, 1, 8, c(1e12, 1)))
  )
  expect_equal(
    res,
    igraph_with_seed(42, random_edge_walk(g, 1, 8, weights = c(1e12, 1)))
  )
  expect_equal(as.integer(res), rep(1L, 8))
})
