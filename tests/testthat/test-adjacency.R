test_that("is_symmetric() works", {
  sym <- diag(3)
  expect_true(is_symmetric(sym))

  asym <- matrix(1:4, nrow = 2)
  expect_false(is_symmetric(asym))
})

test_that("is_symmetric() works for Matrix", {
  skip_if_not_installed("Matrix")

  sym <- diag(3)
  expect_true(is_symmetric(as(sym, "TsparseMatrix")))

  asym <- matrix(1:4, nrow = 2)
  expect_false(is_symmetric(as(asym, "TsparseMatrix")))
})

test_that("is_symmetric() works for amat", {
  skip_if_not_installed("pcalg")

  sym <- structure(
    diag(3),
    dimnames = list(LETTERS[1:3], LETTERS[1:3]),
    class = "amat",
    type = "cpdag"
  )

  expect_true(is_symmetric(sym))

  asym <- structure(
    matrix(1:4, nrow = 2),
    dimnames = list(LETTERS[1:2], LETTERS[1:2]),
    class = "amat",
    type = "cpdag"
  )
  expect_false(is_symmetric(asym))
})

test_that("graph_from_adjacency_matrix() works", {
  M1 <- rbind(
    c(0, 0, 1, 1),
    c(1, 0, 0, 0),
    c(0, 1, 0, 1),
    c(1, 0, 0, 1)
  )
  g1 <- graph_from_adjacency_matrix(M1)
  el1 <- as_edgelist(g1)
  expect_equal(
    el1[order(el1[, 1], el1[, 2]), ],
    cbind(
      c(1, 1, 2, 3, 3, 4, 4),
      c(3, 4, 1, 2, 4, 1, 4)
    )
  )

  M2 <- rbind(
    c(0, 1, 1, 1),
    c(1, 0, 0, 0),
    c(1, 0, 0, 1),
    c(1, 0, 1, 0)
  )
  g2 <- graph_from_adjacency_matrix(M2, mode = "undirected")
  el2 <- as_edgelist(g2)
  expect_equal(
    el2[order(el2[, 1], el2[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4)
    )
  )

  M3 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g3 <- graph_from_adjacency_matrix(M3, mode = "min")
  el3 <- as_edgelist(g3)
  expect_equal(
    el3[order(el3[, 1], el3[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4)
    )
  )

  M4 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g4 <- graph_from_adjacency_matrix(M4, mode = "max")
  el4 <- as_edgelist(g4)
  expect_equal(
    el4[order(el4[, 1], el4[, 2]), ],
    cbind(
      c(1, 1, 1, 1, 3),
      c(2, 3, 4, 4, 4)
    )
  )

  M5 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g5 <- graph_from_adjacency_matrix(M5, mode = "upper")
  el5 <- as_edgelist(g5)
  expect_equal(
    el5[order(el5[, 1], el5[, 2]), ],
    cbind(
      c(1, 1, 1, 1),
      c(2, 3, 4, 4)
    )
  )

  M6 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g6 <- graph_from_adjacency_matrix(M6, mode = "lower")
  el6 <- as_edgelist(g6)
  expect_equal(
    el6[order(el6[, 1], el6[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4)
    )
  )

  M7 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g7 <- graph_from_adjacency_matrix(M7, mode = "plus")
  el7 <- as_edgelist(g7)
  expect_equal(
    el7[order(el7[, 1], el7[, 2]), ],
    cbind(
      c(1, 1, 1, 1, 1, 1, 1, 3),
      c(2, 2, 3, 3, 4, 4, 4, 4)
    )
  )

  M8 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g8 <- graph_from_adjacency_matrix(M8, mode = "directed", weighted = TRUE)
  el8 <- cbind(as_edgelist(g8), E(g8)$weight)
  expect_equal(
    el8[order(el8[, 1], el8[, 2]), ],
    cbind(
      c(1, 1, 1, 2, 3, 4, 4),
      c(2, 3, 4, 1, 1, 1, 3),
      c(1, 1, 0.5, 1, 1, 1, 2)
    )
  )

  M9 <- rbind(
    c(0, 1, 1, 3),
    c(1, 0, 0, 0),
    c(1, 0, 0, 2),
    c(3, 0, 2, 0)
  )
  g9 <- graph_from_adjacency_matrix(M9, mode = "undirected", weighted = TRUE)
  el9 <- cbind(as_edgelist(g9), E(g9)$weight)
  expect_equal(
    el9[order(el9[, 1], el9[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 3, 2)
    )
  )

  M10 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g10 <- graph_from_adjacency_matrix(M10, mode = "max", weighted = TRUE)
  el10 <- cbind(as_edgelist(g10), E(g10)$weight)
  expect_equal(
    el10[order(el10[, 1], el10[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 1, 2)
    )
  )

  M11 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g11 <- graph_from_adjacency_matrix(M11, mode = "min", weighted = TRUE)
  el11 <- cbind(as_edgelist(g11), E(g11)$weight)
  expect_equal(
    el11[order(el11[, 1], el11[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4),
      c(1, 1, 0.5)
    )
  )

  M12 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g12 <- graph_from_adjacency_matrix(M12, mode = "lower", weighted = TRUE)
  el12 <- cbind(as_edgelist(g12), E(g12)$weight)
  expect_equal(
    el12[order(el12[, 1], el12[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 1, 2)
    )
  )

  M13 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g13 <- graph_from_adjacency_matrix(M13, mode = "upper", weighted = TRUE)
  el13 <- cbind(as_edgelist(g13), E(g13)$weight)
  expect_equal(
    el13[order(el13[, 1], el13[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4),
      c(1, 1, 0.5)
    )
  )

  M14 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g14 <- graph_from_adjacency_matrix(M14, mode = "plus", weighted = TRUE)
  el14 <- cbind(as_edgelist(g14), E(g14)$weight)
  expect_equal(
    el14[order(el14[, 1], el14[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(2, 2, 1.5, 2)
    )
  )

  # shazam package
  M15 <- rbind(
    c(1)
  )
  g15 <- graph_from_adjacency_matrix(M15, mode = "undirected", diag = FALSE)
  el15 <- cbind(as_edgelist(g15), E(g15)$weight)
  expect_equal(
    el15[order(el15[, 1], el15[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )

  M16 <- rbind(
    c(1)
  )
  g16 <- graph_from_adjacency_matrix(M16, mode = "lower", diag = FALSE)
  el16 <- cbind(as_edgelist(g16), E(g16)$weight)
  expect_equal(
    el16[order(el16[, 1], el16[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )

  M17 <- rbind(
    c(1)
  )
  g17 <- graph_from_adjacency_matrix(M17, mode = "plus", diag = FALSE)
  el17 <- cbind(as_edgelist(g17), E(g17)$weight)
  expect_equal(
    el17[order(el17[, 1], el17[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )
})

test_that("graph_from_adjacency_matrix() works -- dgCMatrix", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")

  M1 <- rbind(
    c(0, 0, 1, 1),
    c(1, 0, 0, 0),
    c(0, 1, 0, 1),
    c(1, 0, 0, 1)
  )
  g1 <- graph_from_adjacency_matrix(as(M1, "dgCMatrix"))
  el1 <- as_edgelist(g1)
  expect_equal(
    el1[order(el1[, 1], el1[, 2]), ],
    cbind(
      c(1, 1, 2, 3, 3, 4, 4),
      c(3, 4, 1, 2, 4, 1, 4)
    )
  )

  M2 <- rbind(
    c(0, 1, 1, 1),
    c(1, 0, 0, 0),
    c(1, 0, 0, 1),
    c(1, 0, 1, 0)
  )
  g2 <- graph_from_adjacency_matrix(as(M2, "dgCMatrix"), mode = "undirected")
  el2 <- as_edgelist(g2)
  expect_equal(
    el2[order(el2[, 1], el2[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4)
    )
  )

  M3 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g3 <- graph_from_adjacency_matrix(as(M3, "dgCMatrix"), mode = "min")
  el3 <- as_edgelist(g3)
  expect_equal(
    el3[order(el3[, 1], el3[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4)
    )
  )

  M4 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g4 <- graph_from_adjacency_matrix(as(M4, "dgCMatrix"), mode = "max")
  el4 <- as_edgelist(g4)
  expect_equal(
    el4[order(el4[, 1], el4[, 2]), ],
    cbind(
      c(1, 1, 1, 1, 3),
      c(2, 3, 4, 4, 4)
    )
  )

  M5 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g5 <- graph_from_adjacency_matrix(as(M5, "dgCMatrix"), mode = "upper")
  el5 <- as_edgelist(g5)
  expect_equal(
    el5[order(el5[, 1], el5[, 2]), ],
    cbind(
      c(1, 1, 1, 1),
      c(2, 3, 4, 4)
    )
  )

  M6 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g6 <- graph_from_adjacency_matrix(as(M6, "dgCMatrix"), mode = "lower")
  el6 <- as_edgelist(g6)
  expect_equal(
    el6[order(el6[, 1], el6[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4)
    )
  )

  M7 <- rbind(
    c(0, 1, 1, 2),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 1, 0)
  )
  g7 <- graph_from_adjacency_matrix(as(M7, "dgCMatrix"), mode = "plus")
  el7 <- as_edgelist(g7)
  expect_equal(
    el7[order(el7[, 1], el7[, 2]), ],
    cbind(
      c(1, 1, 1, 1, 1, 1, 1, 3),
      c(2, 2, 3, 3, 4, 4, 4, 4)
    )
  )

  M8 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g8 <- graph_from_adjacency_matrix(as(M8, "dgCMatrix"), mode = "directed", weighted = TRUE)
  el8 <- cbind(as_edgelist(g8), E(g8)$weight)
  expect_equal(
    el8[order(el8[, 1], el8[, 2]), ],
    cbind(
      c(1, 1, 1, 2, 3, 4, 4),
      c(2, 3, 4, 1, 1, 1, 3),
      c(1, 1, 0.5, 1, 1, 1, 2)
    )
  )

  M9 <- rbind(
    c(0, 1, 1, 3),
    c(1, 0, 0, 0),
    c(1, 0, 0, 2),
    c(3, 0, 2, 0)
  )
  g9 <- graph_from_adjacency_matrix(as(M9, "dgCMatrix"), mode = "undirected", weighted = TRUE)
  el9 <- cbind(as_edgelist(g9), E(g9)$weight)
  expect_equal(
    el9[order(el9[, 1], el9[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 3, 2)
    )
  )

  M10 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g10 <- graph_from_adjacency_matrix(as(M10, "dgCMatrix"), mode = "max", weighted = TRUE)
  el10 <- cbind(as_edgelist(g10), E(g10)$weight)
  expect_equal(
    el10[order(el10[, 1], el10[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 1, 2)
    )
  )

  M11 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g11 <- graph_from_adjacency_matrix(as(M11, "dgCMatrix"), mode = "min", weighted = TRUE)
  el11 <- cbind(as_edgelist(g11), E(g11)$weight)
  expect_equal(
    el11[order(el11[, 1], el11[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4),
      c(1, 1, 0.5)
    )
  )

  M12 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g12 <- graph_from_adjacency_matrix(as(M12, "dgCMatrix"), mode = "lower", weighted = TRUE)
  el12 <- cbind(as_edgelist(g12), E(g12)$weight)
  expect_equal(
    el12[order(el12[, 1], el12[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(1, 1, 1, 2)
    )
  )

  M13 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g13 <- graph_from_adjacency_matrix(as(M13, "dgCMatrix"), mode = "upper", weighted = TRUE)
  el13 <- cbind(as_edgelist(g13), E(g13)$weight)
  expect_equal(
    el13[order(el13[, 1], el13[, 2]), ],
    cbind(
      c(1, 1, 1),
      c(2, 3, 4),
      c(1, 1, 0.5)
    )
  )

  M14 <- rbind(
    c(0, 1, 1, 0.5),
    c(1, 0, 0, 0),
    c(1, 0, 0, 0),
    c(1, 0, 2, 0)
  )
  g14 <- graph_from_adjacency_matrix(as(M14, "dgCMatrix"), mode = "plus", weighted = TRUE)
  el14 <- cbind(as_edgelist(g14), E(g14)$weight)
  expect_equal(
    el14[order(el14[, 1], el14[, 2]), ],
    cbind(
      c(1, 1, 1, 3),
      c(2, 3, 4, 4),
      c(2, 2, 1.5, 2)
    )
  )

  # shazam package
  M15 <- rbind(
    c(1)
  )
  g15 <- graph_from_adjacency_matrix(as(M15, "dgCMatrix"), mode = "undirected", diag = FALSE)
  el15 <- cbind(as_edgelist(g15), E(g15)$weight)
  expect_equal(
    el15[order(el15[, 1], el15[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )

  M16 <- rbind(
    c(1)
  )
  g16 <- graph_from_adjacency_matrix(as(M16, "dgCMatrix"), mode = "lower", diag = FALSE)
  el16 <- cbind(as_edgelist(g16), E(g16)$weight)
  expect_equal(
    el16[order(el16[, 1], el16[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )

  M17 <- rbind(
    c(1)
  )
  g17 <- graph_from_adjacency_matrix(as(M17, "dgCMatrix"), mode = "plus", diag = FALSE)
  el17 <- cbind(as_edgelist(g17), E(g17)$weight)
  expect_equal(
    el17[order(el17[, 1], el17[, 2]), ],
    matrix(numeric(), nrow = 0, ncol = 3, dimnames = list(NULL, NULL))
  )
})

test_that("graph_from_adjacency_matrix() snapshot", {
  rlang::local_options(lifecycle_verbosity = "warning")

  local_igraph_options(print.id = FALSE)
  expect_false(igraph_opt("print.id"))

  expect_snapshot({
    igraph_opt("print.id")

    m <- matrix(c(0, 2.5, 0, 0), ncol = 2)
    m

    graph_from_adjacency_matrix(m)
    graph_from_adjacency_matrix(m, mode = "undirected")
    graph_from_adjacency_matrix(m, mode = "max")
    graph_from_adjacency_matrix(m, weighted = TRUE)
    graph_from_adjacency_matrix(m, weighted = "w")

    m2 <- structure(
      c(0, 0.00211360121966095, 0.00211360121966098, 0),
      dim = c(2L, 2L)
    )
    graph_from_adjacency_matrix(m2, mode = "undirected")

    graph_from_adjacency_matrix(1)
    graph_from_adjacency_matrix(1, mode = "undirected")
  })
})

test_that("graph_from_adjacency_matrix() snapshot for sparse matrices", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")

  rlang::local_options(lifecycle_verbosity = "warning")

  local_igraph_options(print.id = FALSE)
  expect_false(igraph_opt("print.id"))

  expect_snapshot({
    igraph_opt("print.id")

    m <- Matrix::sparseMatrix(2, 1, x = 2.5, dims = c(2, 2))
    m

    graph_from_adjacency_matrix(m)
    graph_from_adjacency_matrix(m, mode = "undirected")
    graph_from_adjacency_matrix(m, mode = "max")
    graph_from_adjacency_matrix(m, weighted = TRUE)
    graph_from_adjacency_matrix(m, weighted = "w")

    m2 <- Matrix::sparseMatrix(2:1, 1:2, x = c(0.00211360121966095, 0.00211360121966098))
    graph_from_adjacency_matrix(m2, mode = "undirected")
  })
})

test_that("graph_from_adjacency_matrix() 2 edge bug is fixed", {
  A <- Matrix::Matrix(0, 10, 10, sparse = TRUE, doDiag = FALSE)
  A[3, 5] <- A[5, 3] <- 1
  g <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_equal(g[], A)
})

test_that("graph_from_adjacency_matrix() empty graph bug is fixed", {
  A <- Matrix::Matrix(0, 10, 10, sparse = TRUE, doDiag = FALSE)
  g <- graph_from_adjacency_matrix(A, mode = "undirected")
  expect_equal(ignore_attr = TRUE, as.matrix(g[]), as.matrix(A))
})

test_that("undirected, weighted, sparse constructor", {
  # https://github.com/igraph/igraph/issues/554
  M <- Matrix::Matrix(0, 5, 5, doDiag = FALSE)
  M[1, 2] <- M[2, 1] <- M[3, 4] <- M[4, 3] <- 1
  g <- graph_from_adjacency_matrix(M, mode = "undirected", weighted = TRUE)
  expect_equal(g[], M)
})

test_that("graph_from_adjacency_matrix works for sparse matrices without values", {
  # https://github.com/igraph/rigraph/issues/269
  M <- Matrix::sparseMatrix(i = c(1, 3), j = c(3, 4), dims = c(5, 5))
  g <- graph_from_adjacency_matrix(M)
  M <- Matrix::sparseMatrix(i = c(1, 3), j = c(3, 4), dims = c(5, 5), x = 1)
  expect_equal(g[], M)
})


test_that("weighted graph_from_adjacency_matrix() works on integer matrices", {
  skip_if(getRversion() <= "4.1.3")
  data <- matrix(c(0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 1, 0, 0), 4)
  g <- graph_from_adjacency_matrix(data, weighted = TRUE)
  expect_equal(as.matrix(g[]), data)
})

test_that("sparse/dense matrices no loops works", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  A <- diag(1, 5)
  A[1, 2] <- 1
  g <- graph_from_adjacency_matrix(A, diag = FALSE)
  expect_ecount(g, 1)
  expect_equal(get_edge_ids(g, c(1, 2)), 1)

  A <- as(A, "dgCMatrix")
  g <- graph_from_adjacency_matrix(A, diag = FALSE)
  expect_ecount(g, 1)
  expect_equal(get_edge_ids(g, c(1, 2)), 1)
})

test_that("sparse/dense matrices multiple works", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  A <- matrix(0, 5, 5)
  A[1, 2] <- 3
  g <- graph_from_adjacency_matrix(A, diag = FALSE, weighted = FALSE)
  expect_ecount(g, 3)
  expect_equal(as_edgelist(g), matrix(c(1, 2), 3, 2, byrow = TRUE))

  A <- as(A, "dgCMatrix")
  g <- graph_from_adjacency_matrix(A, diag = FALSE)
  expect_ecount(g, 3)
  expect_equal(as_edgelist(g), matrix(c(1, 2), 3, 2, byrow = TRUE))
})

test_that("sparse/dense matrices min/max/plus", {
  skip_if_not_installed("Matrix", minimum_version = "1.6.0")
  A <- matrix(0, 5, 5)
  A[1, 2] <- 3
  A[2, 1] <- 2
  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "max", weighted = TRUE)
  expect_equal(E(g)$weight[1], 3)

  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "min", weighted = TRUE)
  expect_equal(E(g)$weight[1], 2)

  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "plus", weighted = TRUE)
  expect_equal(E(g)$weight[1], 5)

  A <- as(A, "dgCMatrix")
  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "max", weighted = TRUE)
  expect_equal(E(g)$weight[1], 3)

  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "min", weighted = TRUE)
  expect_equal(E(g)$weight[1], 2)

  g <- graph_from_adjacency_matrix(A, diag = FALSE, mode = "plus", weighted = TRUE)
  expect_equal(E(g)$weight[1], 5)
})

test_that("graph_from_adjacency_matrix errors for NAs", {
  A <- matrix(c(1, 1, NA, 1), 2, 2)
  expect_snapshot(graph_from_adjacency_matrix(A), error = TRUE)
})
