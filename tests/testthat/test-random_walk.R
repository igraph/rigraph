test_that("undirected random_walk works", {
  withr::local_seed(20231029)
  g <- make_ring(10)
  w <- random_walk(g, start = 1, steps = 10)
  expect_length(w, 11)
  expect_true(all(abs(diff(as.numeric(w))) %in% c(1, 9)))
})

test_that("directed random_walk works", {
  withr::local_seed(20231029)
  g <- make_ring(10, directed = TRUE)
  w <- as_ids(random_walk(g, start = 1, steps = 5))
  expect_equal(w, 1:6)

  w2 <- as_ids(random_walk(g, start = 4, steps = 5, mode = "in"))
  expect_equal(w2, c(4:1, 10:9))

  w3 <- as_ids(random_walk(g, start = 1, steps = 5, mode = "all"))
  expect_length(w, 6)
  expect_true(all(abs(diff(as.numeric(w))) %in% c(1, 9)))
})

test_that("directed random_walk can return wtih an error when stuck", {
  withr::local_seed(42)
  g <- make_star(11, mode = "out")
  expect_error(
    random_walk(g, start = 7, steps = 10, stuck = "error"),
    "Random walk got stuck"
  )
})

test_that("undirected random_edge_walk works", {
  withr::local_seed(20231029)
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

  withr::local_seed(20231029)
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
  withr::local_seed(20231029)
  g <- make_star(11, mode = "out")
  expect_error(
    random_edge_walk(g, start = 7, steps = 10, stuck = "error"),
    "Random walk got stuck"
  )
})
