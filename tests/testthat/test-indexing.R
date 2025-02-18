test_that("[ indexing works", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  g <- make_tree(20)

  expect_equal(g[1, 2], 1)
  expect_equal(as_unnamed_dense_matrix(g[c(1, 1, 7), c(2, 3, 14)]), vector_to_square_matrix(1, 1, 0, 1, 1, 0, 0, 0, 1))
  expect_equal(as_unnamed_dense_matrix(g[c(1, 1, 7), c(5, 3, 12)]), vector_to_square_matrix(0, 0, 0, 1, 1, 0, 0, 0, 0))
  expect_equal(as_unnamed_dense_matrix(g[c(1, 1, 1, 1), c(2, 3, 2, 2)]), matrix(1, 4, 4))
  expect_equal(as_unnamed_dense_matrix(g[c(8, 17), c(17, 8)]), vector_to_square_matrix(1, 0, 0, 0))
})

test_that("[ indexing works with symbolic names", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  g <- make_test_named_tree()

  expect_equal(g["a", "b"], 1)
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "g"), c("b", "c", "n")]),
    vector_to_square_matrix(1, 1, 0, 1, 1, 0, 0, 0, 1)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "g"), c("e", "c", "l")]),
    vector_to_square_matrix(0, 0, 0, 1, 1, 0, 0, 0, 0)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "a", "a"), c("b", "c", "b", "b")]),
    matrix(1, 4, 4)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("h", "q"), c("q", "h")]),
    vector_to_square_matrix(1, 0, 0, 0)
  )
})

test_that("[ indexing works with logical vectors", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  g <- make_test_named_tree()

  lres <- structure(
    c(
      0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0
    ),
    .Dim = c(2L, 20L),
    .Dimnames = list(c("b", "c"), c(
      "a", "b", "c",
      "d", "e", "f", "g", "h", "i", "j", "k", "l",
      "m", "n", "o", "p", "q", "r", "s", "t"
    ))
  )
  expect_equal(g[degree(g, mode = "in") == 0, 2], 1)
  expect_equal(as.matrix(g[2:3, TRUE]), lres)
})

test_that("[ indexing works with negative indices", {
  g <- make_test_named_tree()

  nres <- structure(
    c(
      0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0, 0, 0, 0, 0, 0
    ),
    .Dim = c(2L, 19L),
    .Dimnames = list(
      c("b", "c"),
      c(
        "b", "c", "d", "e", "f", "g", "h", "i", "j",
        "k", "l", "m", "n", "o", "p", "q", "r", "s",
        "t"
      )
    )
  )
  expect_equal(as.matrix(g[2:3, -1]), nres)
})

test_that("[ indexing works with weighted graphs", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  g <- make_test_weighted_tree()

  expect_equal(g[1, 2], 2)
  expect_equal(
    as_unnamed_dense_matrix(g[c(1, 1, 7), c(2, 3, 14)]),
    vector_to_square_matrix(2, 2, 0, 3, 3, 0, 0, 0, 98)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c(1, 1, 7), c(5, 3, 12)]),
    vector_to_square_matrix(0, 0, 0, 3, 3, 0, 0, 0, 0)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c(1, 1, 1, 1), c(2, 3, 2, 2)]),
    vector_to_square_matrix(2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c(8, 17), c(17, 8)]),
    vector_to_square_matrix(136, 0, 0, 0)
  )
})

test_that("[ indexing works with weighted graphs and symbolic names", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  g <- make_test_weighted_tree()

  expect_equal(g["a", "b"], 2)
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "g"), c("b", "c", "n")]),
    vector_to_square_matrix(2, 2, 0, 3, 3, 0, 0, 0, 98)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "g"), c("e", "c", "l")]),
    vector_to_square_matrix(0, 0, 0, 3, 3, 0, 0, 0, 0)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("a", "a", "a", "a"), c("b", "c", "b", "b")]),
    vector_to_square_matrix(2, 2, 2, 2, 3, 3, 3, 3, 2, 2, 2, 2, 2, 2, 2, 2)
  )
  expect_equal(
    as_unnamed_dense_matrix(g[c("h", "q"), c("q", "h")]),
    vector_to_square_matrix(136, 0, 0, 0)
  )
})

test_that("[[ indexing works with adjacent vertices", {
  g <- make_test_named_tree()

  expect_equal(g[[1, ]], list(a = V(g)[2:3]), ignore_attr = TRUE)
  expect_equal(g[[, 2]], list(b = V(g)[1]), ignore_attr = TRUE)
  expect_equal(
    g[[, 2, directed = FALSE]],
    list(b = V(g)[c(1, 4, 5)]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[2, directed = FALSE]],
    list(b = V(g)[c(1, 4, 5)]),
    ignore_attr = TRUE
  )

  expect_equal(
    g[[1:3, ]],
    list(a = V(g)[2:3], b = V(g)[4:5], c = V(g)[6:7]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, 1:3]],
    list(a = V(g)[numeric()], b = V(g)[1], c = V(g)[1]),
    ignore_attr = TRUE
  )
})

test_that("[[ indexing works with symbolic names", {
  g <- make_test_named_tree()

  expect_equal(g[["a", ]], list(a = V(g)[2:3]), ignore_attr = TRUE)
  expect_equal(g[[, "b"]], list(b = V(g)[1]), ignore_attr = TRUE)
  expect_equal(
    g[[, "b", directed = FALSE]],
    list(b = V(g)[c(1, 4, 5)]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[["b", directed = FALSE]],
    list(b = V(g)[c(1, 4, 5)]),
    ignore_attr = TRUE
  )

  expect_equal(
    g[[letters[1:3], ]],
    list(a = V(g)[2:3], b = V(g)[4:5], c = V(g)[6:7]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, letters[1:3]]],
    list(a = V(g)[numeric()], b = V(g)[1], c = V(g)[1]),
    ignore_attr = TRUE
  )
})

test_that("[[ indexing works with logical vectors", {
  g <- make_test_named_tree()

  expect_equal(
    g[[degree(g, mode = "in") == 0, ]],
    list(a = V(g)[2:3]),
    ignore_attr = TRUE
  )
})

test_that("[[ indexing works with filtering on both ends", {
  g <- make_test_named_tree()

  expect_equal(
    g[[1:10, 1:10]],
    list(a = V(g)[2:3], b = V(g)[4:5], c = V(g)[6:7], d = V(g)[8:9], e = V(g)[10], f = V(g)[numeric()], g = V(g)[numeric()], h = V(g)[numeric()], i = V(g)[numeric()], j = V(g)[numeric()]),
    ignore_attr = TRUE
  )
})

test_that("[[ indexing is consistent with length()", {
  g <- make_test_named_tree()
  expect_equal(length(g), vcount(g))
})

test_that("[[ can query incident edges", {
  g <- make_test_named_tree()

  expect_equal(g[[1, , edges = TRUE]], list(a = E(g)[1:2]), ignore_attr = TRUE)
  expect_equal(g[[, 2, edges = TRUE]], list(b = E(g)[1]), ignore_attr = TRUE)
  expect_equal(
    g[[, 2, directed = FALSE, edges = TRUE]],
    list(b = E(g)[c(1, 3, 4)]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[2, directed = FALSE, edges = TRUE]],
    list(b = E(g)[c(1, 3, 4)]),
    ignore_attr = TRUE
  )

  expect_equal(
    g[[1:3, , edges = TRUE]],
    list(a = E(g)[1:2], b = E(g)[3:4], c = E(g)[5:6]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, 1:3, edges = TRUE]],
    list(a = E(g)[numeric()], b = E(g)[1], c = E(g)[2]),
    ignore_attr = TRUE
  )
})

test_that("[[ queries edges with vertex names", {
  g <- make_test_named_tree()

  expect_equal(
    g[["a", , edges = TRUE]],
    list(a = E(g)[1:2]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, "b", edges = TRUE]],
    list(b = E(g)[1]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, "b", directed = FALSE, edges = TRUE]],
    list(b = E(g)[c(1, 3, 4)]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[["b", directed = FALSE, edges = TRUE]],
    list(b = E(g)[c(1, 3, 4)]),
    ignore_attr = TRUE
  )

  expect_equal(
    g[[letters[1:3], , edges = TRUE]],
    list(a = E(g)[1:2], b = E(g)[3:4], c = E(g)[5:6]),
    ignore_attr = TRUE
  )
  expect_equal(
    g[[, letters[1:3], edges = TRUE]],
    list(a = E(g)[numeric()], b = E(g)[1], c = E(g)[2]),
    ignore_attr = TRUE
  )

  ## Filtering on both ends
  expect_equal(
    g[[1:10, 1:10, edges = TRUE]],
    list(E(g)[1:2], E(g)[3:4], E(g)[5:6], E(g)[7:8], E(g)[9], E(g)[numeric()], E(g)[numeric()], E(g)[numeric()], E(g)[numeric()], E(g)[numeric()]),
    ignore_attr = TRUE
  )
})
test_that("[ handles from and to properly", {
  g <- make_test_named_tree()

  g <- make_tree(20)
  expect_equal(g[from = c(1, 2, 2, 3), to = c(3, 4, 8, 7)], c(1, 1, 0, 1))

  V(g)$name <- letters[1:20]
  expect_equal(
    g[from = c("a", "b", "b", "c"), to = c("c", "d", "h", "g")],
    c(1, 1, 0, 1)
  )

  E(g)$weight <- (1:ecount(g))^2
  expect_equal(
    g[from = c("a", "b", "b", "c"), to = c("c", "d", "h", "g")],
    c(4, 9, 0, 36)
  )

  expect_equal(
    g[from = c("a", "b", "b", "c"), to = c("c", "d", "h", "g"), edges = TRUE],
    c(2, 3, 0, 6)
  )
})

test_that("[[ works with from and to", {
  g <- make_tree(20)

  expect_equal(ignore_attr = TRUE, g[[1, ]], g[[from = 1]])
  expect_equal(ignore_attr = TRUE, g[[, 1]], g[[to = 1]])
  expect_equal(ignore_attr = TRUE, g[[1:5, 4:10]], g[[from = 1:5, to = 4:10]])

  expect_error(g[[1, from = 1]], "Cannot use both")
  expect_error(g[[, 2, to = 10]], "Cannot use both")
})

test_that("[[ returns vertex and edges sequences", {
  g <- make_tree(20)
  expect_true(is_igraph_vs(g[[1]][[1]]))
  expect_true(is_igraph_es(g[[1, edges = TRUE]][[1]]))
  expect_true(is_igraph_vs(g[[1:3, 2:6]][[1]]))
  expect_true(is_igraph_es(g[[1:3, 2:6, edges = TRUE]][[1]]))
})

test_that("[[ handles from and to properly even if the graph has conflicting vertex attributes", {
  g <- make_tree(20)
  V(g)$i <- 200:219
  V(g)$j <- 200:219
  expect_true(is_igraph_vs(g[[1:3, 2:6]][[1]]))
  expect_true(is_igraph_vs(g[[from = 1:3, to = 2:6]][[1]]))
})

test_that("[ handles errors in input parameters well", {
  g <- make_full_graph(10)
  expect_error(g[from = 1, to = 1, i = 1, j = 1])
  expect_error(g[from = 1])
  expect_error(g[to = 1])
  expect_error(g[from = NA, to = 2])
  expect_error(g[from = 1, to = NA])
  expect_error(g[from = 1, to = c(1, 2)])
})

test_that("[ handles all combinations of i and/or j", {
  A <- matrix(
    rep(
      c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
      c(
        4L, 1L, 4L, 1L, 2L, 1L, 5L, 2L, 3L, 1L, 10L, 3L, 9L, 1L, 1L, 1L, 3L, 1L, 1L,
        1L, 1L, 1L, 10L, 1L, 1L, 1L, 1L, 5L, 11L, 1L, 2L, 1L, 5L, 1L, 3L
      )
    ),
    nrow = 10L,
    ncol = 10L
  )
  g <- graph_from_adjacency_matrix(A, "directed")
  expect_equal(as_unnamed_dense_matrix(g[1:3, ]), A[1:3, ])
  expect_equal(as_unnamed_dense_matrix(g[, 4:7]), A[, 4:7])
  expect_equal(as_unnamed_dense_matrix(g[1:3, 4:7]), A[1:3, 4:7])
})

test_that("[ handles duplicated i/j well", {
  A <- matrix(
    rep(
      c(0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0),
      c(
        4L, 1L, 4L, 1L, 2L, 1L, 5L, 2L, 3L, 1L, 10L, 3L, 9L, 1L, 1L, 1L, 3L, 1L, 1L,
        1L, 1L, 1L, 10L, 1L, 1L, 1L, 1L, 5L, 11L, 1L, 2L, 1L, 5L, 1L, 3L
      )
    ),
    nrow = 10L,
    ncol = 10L
  )
  g <- graph_from_adjacency_matrix(A, "directed")
  expect_equal(as_unnamed_dense_matrix(g[c(1, 2, 2), ]), A[c(1, 2, 2), ])
  expect_equal(as_unnamed_dense_matrix(g[, c(3, 3, 4, 4)]), A[, c(3, 3, 4, 4)])
  expect_equal(as_unnamed_dense_matrix(g[c(1, 2, 2), c(3, 3, 4, 4)]), A[c(1, 2, 2), c(3, 3, 4, 4)])
})

test_that("[ can add and delete edges", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)

  A[1, 2] <- g[1, 2] <- TRUE
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  A[2, 1] <- g[2, 1] <- TRUE
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  g[2, 1] <- NULL
  A[2, 1] <- 0
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  A[1, 2] <- g[1, 2] <- FALSE
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  A[-1, 1] <- g[-1, 1] <- 1
  expect_equal(as_unnamed_dense_matrix(g[]), A)
})

test_that("[ can set weights and delete weighted edges", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  g <- set_edge_attr(g, "weight", c(), 1)
  A[1, 2] <- g[1, 2] <- 1
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  A[2, 1] <- g[2, 1] <- 2
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  A[1, 2] <- g[1, 2] <- 3
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  A[1:2, 2:3] <- g[1:2, 2:3, loops = TRUE] <- -1
  expect_equal(as_unnamed_dense_matrix(g[]), A)

  g[1, 2] <- NULL
  A[1, 2] <- 0
  expect_equal(as_unnamed_dense_matrix(g[]), A)
})

test_that("[ can add edges and ste weights via vertex names", {
  g <- make_empty_graph(10)
  A <- matrix(0, 10, 10)
  V(g)$name <- letters[1:vcount(g)]
  rownames(A) <- colnames(A) <- letters[1:vcount(g)]

  A["a", "b"] <- g["a", "b"] <- TRUE
  A["b", "c"] <- g["b", "c"] <- TRUE
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))

  A[c("a", "f"), c("f", "a")] <- g[c("a", "f"), c("f", "a"), loops = TRUE] <- TRUE
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))

  A[A == 1] <- NA
  A[c("a", "c", "h"), c("a", "b", "c")] <-
    g[c("a", "c", "h"), c("a", "b", "c"), attr = "weight", loops = TRUE] <- 3
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))
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
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))

  g[from = c("a", "c", "h", "a"), to = c("a", "a", "a", "e"), attr = "weight"] <- 3
  A[A != 0] <- NA
  A["a", "a"] <- A["c", "a"] <- A["h", "a"] <- A["a", "e"] <- 3
  expect_equal(
    g[from = c("a", "c", "h", "a", "c", "c"), to = c("a", "a", "a", "e", "f", "b")],
    c(3, 3, 3, 3, 0, NA)
  )
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))
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
  expect_equal(as_unnamed_dense_matrix(g[]), as_unnamed_dense_matrix(A))
})

test_that("[ manipulation works as intended for unweighted", {
  # see issue https://github.com/igraph/rigraph/issues/1662
  g1 <- make_empty_graph(n = 10, directed = FALSE)
  A1 <- matrix(0, 10, 10)
  A1[1:5, ] <- A1[, 1:5] <- g1[1:5, ] <- 1
  diag(A1) <- 0
  expect_equal(as_unnamed_dense_matrix(g1[]), A1)

  g2 <- make_empty_graph(n = 10, directed = FALSE)
  A2 <- matrix(0, 10, 10)
  A2[1:5, ] <- A2[, 1:5] <- g2[, 1:5] <- 1
  diag(A2) <- 0
  expect_equal(as_unnamed_dense_matrix(g2[]), A2)

  g3 <- make_empty_graph(n = 10, directed = TRUE)
  A3 <- matrix(0, 10, 10)
  A3[1:5, ] <- g3[1:5, ] <- 1
  diag(A3) <- 0
  expect_equal(as_unnamed_dense_matrix(g3[]), A3)

  g4 <- make_empty_graph(n = 10, directed = TRUE)
  A4 <- matrix(0, 10, 10)
  A4[, 1:5] <- g4[, 1:5] <- 1
  diag(A4) <- 0
  expect_equal(as_unnamed_dense_matrix(g4[]), A4)

  g5 <- make_empty_graph(n = 10, directed = TRUE)
  A5 <- matrix(0, 10, 10)
  g5[1, 2] <- g5[2, 1] <- A5[1, 2] <- A5[2, 1] <- 1
  expect_equal(as_unnamed_dense_matrix(g5[]), A5)

  g6 <- make_empty_graph(n = 10, directed = FALSE)
  A6 <- matrix(0, 10, 10)
  A6[6:10, 1:5] <- A6[1:5, 6:10] <- g6[6:10, 1:5] <- 1
  expect_equal(as_unnamed_dense_matrix(g6[]), A6)

  g7 <- make_empty_graph(n = 10, directed = TRUE)
  A7 <- matrix(0, 10, 10)
  g7[6:10, 1:5] <- A7[6:10, 1:5] <- 1
  diag(A7) <- 0
  expect_equal(as_unnamed_dense_matrix(g7[]), A7)

  g8 <- make_empty_graph(n = 10, directed = TRUE)
  A8 <- matrix(0, 10, 10)
  g8[1:5, 6:10] <- A8[1:5, 6:10] <- 1
  diag(A8) <- 0
  expect_equal(as_unnamed_dense_matrix(g8[]), A8)
})

test_that("[ manipulation works as intended for weighted", {
  # see issue https://github.com/igraph/rigraph/issues/1662

  g1 <- make_empty_graph(n = 10, directed = FALSE)
  A1 <- matrix(0, 10, 10)
  A1[1:5, 1:5] <- g1[1:5, 1:5, attr = "weight"] <- 2
  diag(A1) <- 0
  expect_equal(as_unnamed_dense_matrix(g1[]), A1)

  g2 <- make_empty_graph(n = 10, directed = FALSE)
  E(g2)$weight <- 1
  A2 <- matrix(0, 10, 10)
  A2[1:3, 1:3] <- g2[1:3, 1:3] <- -2
  diag(A2) <- 0
  expect_equal(as_unnamed_dense_matrix(g2[]), A2)
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
  expect_equal(as_unnamed_dense_matrix(g1[]), A1)

  g2 <- make_full_graph(n = 10, directed = FALSE)
  A2 <- matrix(1, 10, 10)
  diag(A2) <- 0
  A2[1:5, ] <- A2[, 1:5] <- g2[, 1:5] <- 0
  expect_equal(as_unnamed_dense_matrix(g2[]), A2)

  g3 <- make_full_graph(n = 10, directed = TRUE)
  A3 <- matrix(1, 10, 10)
  diag(A3) <- 0
  A3[1:5, ] <- g3[1:5, ] <- 0
  expect_equal(as_unnamed_dense_matrix(g3[]), A3)

  g4 <- make_full_graph(n = 10, directed = TRUE)
  A4 <- matrix(1, 10, 10)
  diag(A4) <- 0
  A4[, 1:5] <- g4[, 1:5] <- 0
  expect_equal(as_unnamed_dense_matrix(g4[]), A4)

  g5 <- make_full_graph(n = 10, directed = TRUE)
  A5 <- matrix(1, 10, 10)
  diag(A5) <- 0
  g5[1, 2] <- g5[2, 1] <- A5[1, 2] <- A5[2, 1] <- 0
  expect_equal(as_unnamed_dense_matrix(g5[]), A5)

  g6 <- make_full_graph(n = 10, directed = FALSE)
  A6 <- matrix(1, 10, 10)
  diag(A6) <- 0
  A6[6:10, 1:5] <- A6[1:5, 6:10] <- g6[6:10, 1:5] <- 0
  expect_equal(as_unnamed_dense_matrix(g6[]), A6)

  g7 <- make_full_graph(n = 10, directed = TRUE)
  A7 <- matrix(1, 10, 10)
  diag(A7) <- 0
  g7[6:10, 1:5] <- A7[6:10, 1:5] <- 0
  expect_equal(as_unnamed_dense_matrix(g7[]), A7)

  g8 <- make_full_graph(n = 10, directed = TRUE)
  A8 <- matrix(1, 10, 10)
  diag(A8) <- 0
  g8[1:5, 6:10] <- A8[1:5, 6:10] <- 0
  expect_equal(as_unnamed_dense_matrix(g8[]), A8)
})

test_that("Indexing multi-graphs as adjacency list", {
  g <- make_graph(~ A - +B:C, A - +B:C:D, simplify = FALSE)
  e <- g[["A", "B", edges = TRUE]]

  expect_equal(ignore_attr = TRUE, sort(e[[1]]), E(g)[1, 3])
})

test_that("Weighted indexing does not remove edges", {
  # labeled as bug 1073705
  g <- make_ring(10)
  g[1, 2, attr = "weight"] <- 0
  expect_true("weight" %in% edge_attr_names(g))
  expect_equal(E(g)$weight, c(0, rep(NA, 9)))

  el <- as_edgelist(g)
  g[from = el[, 1], to = el[, 2], attr = "sim"] <- rep(0:1, length.out = ecount(g))
  expect_true("sim" %in% edge_attr_names(g))
  expect_equal(E(g)$sim, rep(0:1, 5))

  V(g)$name <- letters[seq_len(vcount(g))]
  el <- as_edgelist(g)
  g[from = el[, 1], to = el[, 2], attr = "sim"] <- rep(1:0, length.out = ecount(g))
  expect_equal(E(g)$sim, rep(1:0, 5))
})

test_that("indexing a vs twice works", {
  edges <- data.frame(
    stringsAsFactors = TRUE,
    from = c("BOS", "JFK", "DEN", "BOS", "JFK", "DEN"),
    to = c("JFK", "DEN", "ABQ", "JFK", "DEN", "ABQ"),
    carrier = c("foo", "foo", "foo", "bar", "bar", "bar")
  )

  vertices <- data.frame(
    stringsAsFactors = TRUE,
    id = c("BOS", "JFK", "DEN", "ABQ"),
    state = c("MA", "NY", "CO", "NM")
  )

  g <- graph_from_data_frame(edges, vertices = vertices)

  x <- V(g)[3:4][state == "NM"]

  expect_equal(ignore_attr = TRUE, x, V(g)["ABQ"])
})

test_that("indexing an es twice works", {
  edges <- data.frame(
    stringsAsFactors = TRUE,
    from = c("BOS", "JFK", "DEN", "BOS", "JFK", "DEN"),
    to = c("JFK", "DEN", "ABQ", "JFK", "DEN", "ABQ"),
    carrier = c("foo", "foo", "foo", "bar", "bar", "bar")
  )

  g <- graph_from_data_frame(edges)

  x <- E(g)["BOS" %->% "JFK"][carrier == "foo"]

  expect_equal(ignore_attr = TRUE, x, E(g)[carrier == "foo" & .from("BOS") & .to("JFK")])
})


test_that("deprecated indexing functions are indeed deprecated", {
  g <- make_ring(10)

  expect_error(V(g)[nei(1)], "was deprecated")
  expect_error(V(g)[innei(1)], "was deprecated")
  expect_error(V(g)[outnei(1)], "was deprecated")
  expect_error(V(g)[inc(1)], "was deprecated")
  expect_error(V(g)[adj(1)], "was deprecated")
  expect_error(V(g)[from(1)], "was deprecated")
  expect_error(V(g)[to(1)], "was deprecated")

  expect_error(E(g)[adj(1)], "was deprecated")
  expect_error(E(g)[inc(1)], "was deprecated")
  expect_error(E(g)[from(1)], "was deprecated")
  expect_error(E(g)[to(1)], "was deprecated")
})
