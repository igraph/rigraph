test_that("undirected random_walk works", {
  set.seed(42)
  g <- make_ring(10)
  w <- random_walk(g, start = 1, steps = 10)
  expect_equal(
    ignore_attr = TRUE,
    w,
    structure(c(1L, 10L, 1L, 10L, 9L, 10L, 1L, 10L, 1L, 10L, 1L), class = "igraph.vs")
  )
})

test_that("directed random_walk works", {
  set.seed(42)
  g <- make_ring(10, directed = TRUE)
  w <- as_ids(random_walk(g, start = 1, steps = 5))
  expect_equal(w, 1:6)

  w2 <- as_ids(random_walk(g, start = 5, steps = 5, mode = "in"))
  expect_equal(w2, c(5:1, 10L))

  set.seed(42)
  w3 <- as_ids(random_walk(g, start = 1, steps = 5, mode = "all"))
  expect_equal(w3, c(1, 10, 1, 10, 9, 10))
})

test_that("directed random_walk can return wtih an error when stuck", {
  set.seed(42)
  g <- make_star(11, mode = "out")
  expect_error(random_walk(g, start = 7, steps = 10, stuck = "error"), "Random walk got stuck")
})

test_that("undirected random_edge_walk works", {
  set.seed(42)
  g <- make_star(11, mode = "undirected")
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_equal(ignore_attr = TRUE, w, structure(c(
    10L, 10L, 3L, 3L, 7L, 7L, 8L, 8L,
    7L, 7L
  ), class = "igraph.es"))

  set.seed(42)
  g <- make_ring(10)
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_equal(ignore_attr = TRUE, w, structure(c(10, 10, 10, 9, 9, 10, 10, 10, 10, 10), class = "igraph.es"))
})

test_that("directed random_edge_walk works", {
  g <- make_star(11, mode = "out")

  set.seed(42)
  w <- random_edge_walk(g, start = 1, steps = 10)
  expect_equal(ignore_attr = TRUE, w, structure(c(10L), class = "igraph.es"))

  set.seed(42)
  w <- random_edge_walk(g, start = 7, steps = 10)
  expect_equal(ignore_attr = TRUE, w, structure(integer(), class = "igraph.es"))

  g <- make_ring(10, directed = TRUE)

  set.seed(42)
  w <- random_edge_walk(g, start = 1, steps = 5)
  expect_equal(ignore_attr = TRUE, w, structure(c(1L, 2L, 3L, 4L, 5L), class = "igraph.es"))

  set.seed(42)
  w <- random_edge_walk(g, start = 1, steps = 5, mode = "in")
  expect_equal(ignore_attr = TRUE, w, structure(c(10L, 9L, 8L, 7L, 6L), class = "igraph.es"))

  set.seed(42)
  w <- random_edge_walk(g, start = 1, steps = 10, mode = "all")
  expect_equal(ignore_attr = TRUE, w, structure(c(10, 10, 10, 9, 9, 10, 10, 10, 10, 10), class = "igraph.es"))
})

test_that("directed random_edge_walk can return wtih an error when stuck", {
  set.seed(42)
  g <- make_star(11, mode = "out")
  expect_error(random_edge_walk(g, start = 7, steps = 10, stuck = "error"), "Random walk got stuck")
})
