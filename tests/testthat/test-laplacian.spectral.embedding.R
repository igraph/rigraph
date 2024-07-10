std <- function(x) {
  x <- zapsmall(x)
  apply(x, 2, function(col) {
    if (any(col < 0) && col[which(col != 0)[1]] < 0) {
      -col
    } else {
      col
    }
  })
}

mag_order <- function(x) {
  order(abs(x), sign(x), decreasing = TRUE)
}

mag_sort <- function(x) {
  x[mag_order(x)]
}

test_that("Undirected, unweighted, D-A case works", {
  withr::local_seed(42)
  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)

  no <- 3
  A <- as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix") - g[]
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(ss$values)))
  Y <- std(ss$vectors %*% sqrt(diag(ss$values)))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "D-A",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_la$D, D[1:no])
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "D-A",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Undirected, unweighted, DAD case works", {
  withr::local_seed(42)
  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "DAD",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_la$D, abs(D[1:no]))
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "DAD",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Undirected, unweighted, I-DAD case works", {
  withr::local_seed(42)
  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- diag(vcount(g)) - D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "I-DAD",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_la$D, abs(D[1:no]))
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "I-DAD",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Undirected, weighted, D-A case works", {
  withr::local_seed(42 * 42)
  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- as(Matrix::Matrix(diag(strength(g)), doDiag = FALSE), "generalMatrix") - g[]
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(abs(D))))
  Y <- std(ss$vectors %*% sqrt(diag(abs(D))))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "D-A",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_la$D, abs(D[1:no]))
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "D-A",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Undirected, unweighted, DAD case works", {
  withr::local_seed(42)

  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "DAD",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_la$D, abs(D[1:no]))
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "DAD",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Undirected, unweighted, I-DAD case works", {
  withr::local_seed(42)

  g <- random.graph.game(10, 20, type = "gnm", directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- diag(vcount(g)) - D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

  ## LA

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "I-DAD",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_la$D, abs(D[1:no]))
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, mag_sort(D)[1:no])
  expect_equal(std(au_lm$X), std(X[, mag_order(D)][, 1:no]))
  expect_equal(as_lm$D, mag_sort(D)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(D)][, 1:no]))

  ## SA

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "I-DAD",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
})

test_that("Directed, unweighted, OAP case works", {
  withr::local_seed(42 * 42)

  g <- random.graph.game(10, 30, type = "gnm", directed = TRUE)

  no <- 3
  O12 <- diag(1 / sqrt(degree(g, mode = "out")))
  P12 <- diag(1 / sqrt(degree(g, mode = "in")))
  A <- O12 %*% g[] %*% P12
  ss <- svd(A)

  D <- ss$d
  U <- ss$u
  V <- ss$v
  X <- std(ss$u %*% sqrt(diag(ss$d)))
  Y <- std(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_la$D, D[1:no])
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(std(au_la$Y), std(Y[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(std(as_la$Y), std(V[, 1:no]))

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_lm$D, D[1:no])
  expect_equal(std(au_lm$X), std(X[, 1:no]))
  expect_equal(std(au_lm$Y), std(Y[, 1:no]))
  expect_equal(as_lm$D, D[1:no])
  expect_equal(std(as_lm$X), std(U[, 1:no]))
  expect_equal(std(as_lm$Y), std(V[, 1:no]))

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$Y), std(Y[, vcount(g) - 1:no + 1]), tolerance = 1e-6)
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(as_sa$Y), std(V[, vcount(g) - 1:no + 1]))
})

test_that("Directed, weighted case works", {
  withr::local_seed(42 * 42)

  g <- random.graph.game(10, 30, type = "gnm", directed = TRUE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  O12 <- diag(1 / sqrt(strength(g, mode = "out")))
  P12 <- diag(1 / sqrt(strength(g, mode = "in")))
  A <- O12 %*% g[] %*% P12
  ss <- svd(A)

  D <- ss$d
  U <- ss$u
  V <- ss$v
  X <- std(ss$u %*% sqrt(diag(ss$d)))
  Y <- std(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_la$D, D[1:no])
  expect_equal(std(au_la$X), std(X[, 1:no]))
  expect_equal(std(au_la$Y), std(Y[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(std(as_la$Y), std(V[, 1:no]))

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_lm$D, D[1:no])
  expect_equal(std(au_lm$X), std(X[, 1:no]))
  expect_equal(std(au_lm$Y), std(Y[, 1:no]))
  expect_equal(as_lm$D, D[1:no])
  expect_equal(std(as_lm$X), std(U[, 1:no]))
  expect_equal(std(as_lm$Y), std(V[, 1:no]))

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$X), std(X[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$Y), std(Y[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(as_sa$Y), std(V[, vcount(g) - 1:no + 1]))
})
