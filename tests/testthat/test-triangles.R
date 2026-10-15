test_that("Listing triangles works", {
  triangle_ids <- function(...) as.vector(triangles(...))

  g1 <- make_empty_graph(directed = TRUE)
  g2 <- make_empty_graph(directed = FALSE)
  expect_equal(triangle_ids(g1), numeric())
  expect_equal(triangle_ids(g2), numeric())

  g3 <- make_empty_graph(n = 1, directed = TRUE)
  g4 <- make_empty_graph(n = 1, directed = FALSE)
  expect_equal(triangle_ids(g3), numeric())
  expect_equal(triangle_ids(g4), numeric())

  g5 <- make_empty_graph(n = 100, directed = TRUE)
  g6 <- make_empty_graph(n = 100, directed = FALSE)
  expect_equal(triangle_ids(g5), numeric())
  expect_equal(triangle_ids(g6), numeric())

  g7 <- make_ring(3, directed = FALSE)
  g8 <- make_ring(3, directed = TRUE)
  g9 <- graph_from_literal(A -+ B:C, B -+ C)
  expect_equal(sort(triangle_ids(g7)), 1:3)
  expect_equal(sort(triangle_ids(g8)), 1:3)
  expect_equal(sort(triangle_ids(g9)), 1:3)

  g10 <- make_full_graph(5, directed = FALSE)
  g11 <- make_full_graph(5, directed = TRUE)
  r10 <- c(
    1L, 2L, 5L, 1L, 2L, 3L, 1L, 2L, 4L, 1L, 3L, 5L, 1L, 3L, 4L,
    1L, 4L, 5L, 2L, 3L, 5L, 2L, 3L, 4L, 2L, 4L, 5L, 3L, 4L, 5L
  )
  r11 <- r10
  expect_equal(triangle_ids(g10), r10)
  expect_equal(triangle_ids(g11), r11)
})
