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

  A[1:2, 2:3] <- g[1:2, 2:3] <- -1
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

  A[c("a", "f"), c("f", "a")] <- g[c("a", "f"), c("f", "a")] <- TRUE
  expect_equal(canonicalize_matrix(g[]), canonicalize_matrix(A))

  A[A == 1] <- NA
  A[c("a", "c", "h"), c("a", "b", "c")] <-
    g[c("a", "c", "h"), c("a", "b", "c"), attr = "weight"] <- 3
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
