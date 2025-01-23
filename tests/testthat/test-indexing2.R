test_that("[ can add and delete edges", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)

  A[1, 2] <- g[1, 2] <- TRUE
  expect_equal(canonicalize_matrix(g[]), A)

  A[2, 1] <- g[2, 1] <- TRUE
  expect_equal(canonicalize_matrix(g[]), A)

  g[2, 1] <- NULL
  A[2, 1] <- 0
  expect_equal(canonicalize_matrix(g[]), A)

  A[1, 2] <- g[1, 2] <- FALSE
  expect_equal(canonicalize_matrix(g[]), A)

  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  A[-1, 1] <- g[-1, 1] <- 1
  expect_equal(canonicalize_matrix(g[]), A)
})

test_that("[ can set weights and delete weighted edges", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  g <- set_edge_attr(g, "weight", c(), 1)
  A[1, 2] <- g[1, 2] <- 1
  expect_equal(canonicalize_matrix(g[]), A)

  A[2, 1] <- g[2, 1] <- 2
  expect_equal(canonicalize_matrix(g[]), A)

  A[1, 2] <- g[1, 2] <- 3
  expect_equal(canonicalize_matrix(g[]), A)

  A[1:2, 2:3] <- g[1:2, 2:3, loops = TRUE] <- -1
  expect_equal(canonicalize_matrix(g[]), A)

  g[1, 2] <- NULL
  A[1, 2] <- 0
  expect_equal(canonicalize_matrix(g[]), A)
})

test_that("[ can add edges and ste weights via vertex names", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  V(g)$name <- letters[1:vcount(g)]
  rownames(A) <- colnames(A) <- letters[1:vcount(g)]

  A["a", "b"] <- g["a", "b"] <- TRUE
  A["b", "c"] <- g["b", "c"] <- TRUE
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))

  A[c("a", "f"), c("f", "a")] <- g[c("a", "f"), c("f", "a"), loops = TRUE] <- TRUE
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))

  A[A == 1] <- NA
  A[c("a", "c", "h"), c("a", "b", "c")] <-
    g[c("a", "c", "h"), c("a", "b", "c"), attr = "weight", loops = TRUE] <- 3
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))
})

test_that("[ and the from-to notation", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  V(g)$name <- letters[1:vcount(g)]
  rownames(A) <- colnames(A) <- letters[1:vcount(g)]

  g[from = c("a", "c", "h"), to = c("a", "b", "c")] <- 1
  A["a", "a"] <- A["c", "b"] <- A["h", "c"] <- 1
  expect_equal(
    g[from = c("a", "c", "h", "d"), to = c("a", "b", "c", "e")],
    c(1, 1, 1, 0)
  )
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))

  g[from = c("a", "c", "h", "a"), to = c("a", "a", "a", "e"), attr = "weight"] <- 3
  A[A != 0] <- NA
  A["a", "a"] <- A["c", "a"] <- A["h", "a"] <- A["a", "e"] <- 3
  expect_equal(
    g[from = c("a", "c", "h", "a", "c", "c"), to = c("a", "a", "a", "e", "f", "b")],
    c(3, 3, 3, 3, 0, NA)
  )
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))
})

test_that("[ and from-to with multiple values", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  V(g)$name <- letters[1:vcount(g)]
  rownames(A) <- colnames(A) <- letters[1:vcount(g)]

  g[from = c("a", "c", "h"), to = c("a", "b", "c")] <- 1
  A["a", "a"] <- A["c", "b"] <- A["h", "c"] <- 1
  g[from = c("a", "c", "h", "a"), to = c("a", "a", "a", "e"), attr = "weight"] <- 5:8
  A[A != 0] <- NA
  A["a", "a"] <- 5
  A["c", "a"] <- 6
  A["h", "a"] <- 7
  A["a", "e"] <- 8
  expect_equal(
    g[from = c("a", "c", "h", "a", "c", "c"), to = c("a", "a", "a", "e", "f", "b")],
    c(5:8, 0, NA)
  )
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))
})

test_that("[ manipulation works as intended for unweighted", {
  # see issue https://github.com/igraph/rigraph/issues/1662
  g1 <- make_empty_graph(n = 10, directed = FALSE)
  A1 <- matrix(0, 10, 10)
  A1[1:5, ] <- A1[, 1:5] <- g1[1:5, ] <- 1
  diag(A1) <- 0
  expect_equal(canonicalize_matrix(g1[]), A1)

  g2 <- make_empty_graph(n = 10, directed = FALSE)
  A2 <- matrix(0, 10, 10)
  A2[1:5, ] <- A2[, 1:5] <- g2[, 1:5] <- 1
  diag(A2) <- 0
  expect_equal(canonicalize_matrix(g2[]), A2)

  g3 <- make_empty_graph(n = 10, directed = TRUE)
  A3 <- matrix(0, 10, 10)
  A3[1:5, ] <- g3[1:5, ] <- 1
  diag(A3) <- 0
  expect_equal(canonicalize_matrix(g3[]), A3)

  g4 <- make_empty_graph(n = 10, directed = TRUE)
  A4 <- matrix(0, 10, 10)
  A4[, 1:5] <- g4[, 1:5] <- 1
  diag(A4) <- 0
  expect_equal(canonicalize_matrix(g4[]), A4)

  g5 <- make_empty_graph(n = 10, directed = TRUE)
  A5 <- matrix(0, 10, 10)
  g5[1, 2] <- g5[2, 1] <- A5[1, 2] <- A5[2, 1] <- 1
  expect_equal(canonicalize_matrix(g5[]), A5)

  g6 <- make_empty_graph(n = 10, directed = FALSE)
  A6 <- matrix(0, 10, 10)
  A6[6:10, 1:5] <- A6[1:5, 6:10] <- g6[6:10, 1:5] <- 1
  expect_equal(canonicalize_matrix(g6[]), A6)

  g7 <- make_empty_graph(n = 10, directed = TRUE)
  A7 <- matrix(0, 10, 10)
  g7[6:10, 1:5] <- A7[6:10, 1:5] <- 1
  diag(A7) <- 0
  expect_equal(canonicalize_matrix(g7[]), A7)

  g8 <- make_empty_graph(n = 10, directed = TRUE)
  A8 <- matrix(0, 10, 10)
  g8[1:5, 6:10] <- A8[1:5, 6:10] <- 1
  diag(A8) <- 0
  expect_equal(canonicalize_matrix(g8[]), A8)
})

test_that("[ manipulation works as intended for weighted", {
  # see issue https://github.com/igraph/rigraph/issues/1662

  g1 <- make_empty_graph(n = 10, directed = FALSE)
  A1 <- matrix(0, 10, 10)
  A1[1:5, 1:5] <- g1[1:5, 1:5, attr = "weight"] <- 2
  diag(A1) <- 0
  expect_equal(canonicalize_matrix(g1[]), A1)

  g2 <- make_empty_graph(n = 10, directed = FALSE)
  E(g2)$weight <- 1
  A2 <- matrix(0, 10, 10)
  A2[1:3, 1:3] <- g2[1:3, 1:3] <- -2
  diag(A2) <- 0
  expect_equal(canonicalize_matrix(g2[]), A2)
})

test_that("[ manipulation handles errors properly", {
  g1 <- make_empty_graph(n = 10, directed = FALSE)
  expect_error(g1[1:5, ] <- 2)
})

test_that("[ deletion works as intended", {
  # see issue https://github.com/igraph/rigraph/issues/1662
  g1 <- make_full_graph(n = 10, directed = FALSE)
  A1 <- matrix(1, 10, 10)
  diag(A1) <- 0
  A1[1:5, ] <- A1[, 1:5] <- g1[1:5, ] <- 0
  expect_equal(canonicalize_matrix(g1[]), A1)

  g2 <- make_full_graph(n = 10, directed = FALSE)
  A2 <- matrix(1, 10, 10)
  diag(A2) <- 0
  A2[1:5, ] <- A2[, 1:5] <- g2[, 1:5] <- 0
  expect_equal(canonicalize_matrix(g2[]), A2)

  g3 <- make_full_graph(n = 10, directed = TRUE)
  A3 <- matrix(1, 10, 10)
  diag(A3) <- 0
  A3[1:5, ] <- g3[1:5, ] <- 0
  expect_equal(canonicalize_matrix(g3[]), A3)

  g4 <- make_full_graph(n = 10, directed = TRUE)
  A4 <- matrix(1, 10, 10)
  diag(A4) <- 0
  A4[, 1:5] <- g4[, 1:5] <- 0
  expect_equal(canonicalize_matrix(g4[]), A4)

  g5 <- make_full_graph(n = 10, directed = TRUE)
  A5 <- matrix(1, 10, 10)
  diag(A5) <- 0
  g5[1, 2] <- g5[2, 1] <- A5[1, 2] <- A5[2, 1] <- 0
  expect_equal(canonicalize_matrix(g5[]), A5)

  g6 <- make_full_graph(n = 10, directed = FALSE)
  A6 <- matrix(1, 10, 10)
  diag(A6) <- 0
  A6[6:10, 1:5] <- A6[1:5, 6:10] <- g6[6:10, 1:5] <- 0
  expect_equal(canonicalize_matrix(g6[]), A6)

  g7 <- make_full_graph(n = 10, directed = TRUE)
  A7 <- matrix(1, 10, 10)
  diag(A7) <- 0
  g7[6:10, 1:5] <- A7[6:10, 1:5] <- 0
  expect_equal(canonicalize_matrix(g7[]), A7)

  g8 <- make_full_graph(n = 10, directed = TRUE)
  A8 <- matrix(1, 10, 10)
  diag(A8) <- 0
  g8[1:5, 6:10] <- A8[1:5, 6:10] <- 0
  expect_equal(canonicalize_matrix(g8[]), A8)
})
