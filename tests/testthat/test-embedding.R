standardize_eigen_signs <- function(x) {
  x <- zapsmall(x)
  apply(x, 2, function(col) {
    if (any(col < 0) && col[which(col != 0)[1]] < 0) {
      -col
    } else {
      col
    }
  })
}

order_by_magnitude <- function(x) {
  order(abs(x), sign(x), decreasing = TRUE)
}

sort_by_magnitude <- function(x) {
  x[order_by_magnitude(x)]
}

test_that("embed_adjacency_matrix -- Undirected, unweighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 15, directed = FALSE)

  no <- 7
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- eigen(A)

  U <- standardize_eigen_signs(ss$vectors)
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_la$D, ss$values[1:no])
  expect_equal(au_la$D, ss$values[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(au_la$X), X[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_lm$D, sort_by_magnitude(ss$values)[1:no])
  expect_equal(au_lm$D, sort_by_magnitude(ss$values)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(ss$values)][, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$X), X[, order_by_magnitude(ss$values)][, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_sa$D, ss$values[vcount(g) - 1:no + 1])
  expect_equal(au_sa$D, ss$values[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$X), X[, vcount(g) - 1:no + 1])
})

test_that("embed_adjacency_matrix -- Undirected, weighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = FALSE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- eigen(A)

  U <- standardize_eigen_signs(ss$vectors)
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_la$D, ss$values[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(au_la$D, ss$values[1:no])
  expect_equal(standardize_eigen_signs(au_la$X), X[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_lm$D, sort_by_magnitude(ss$values)[1:no])
  expect_equal(au_lm$D, sort_by_magnitude(ss$values)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(ss$values)][, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$X), X[, order_by_magnitude(ss$values)][, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$X), X[, vcount(g) - 1:no + 1])
})

test_that("embed_adjacency_matrix -- Directed, unweighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- svd(A)

  U <- standardize_eigen_signs(ss$u)
  V <- standardize_eigen_signs(ss$v)
  X <- standardize_eigen_signs(ss$u %*% sqrt(diag(ss$d)))
  Y <- standardize_eigen_signs(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_la$D, ss$d[1:no])
  expect_equal(au_la$D, ss$d[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_la$Y), standardize_eigen_signs(V[, 1:no]))
  expect_equal(standardize_eigen_signs(au_la$X), X[, 1:no])
  expect_equal(standardize_eigen_signs(au_la$Y), Y[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_lm$D, ss$d[1:no])
  expect_equal(au_lm$D, ss$d[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_lm$Y), standardize_eigen_signs(V[, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$X), X[, 1:no])
  expect_equal(standardize_eigen_signs(au_lm$Y), Y[, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_sa$D, ss$d[vcount(g) - 1:no + 1])
  expect_equal(au_sa$D, ss$d[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(as_sa$Y), standardize_eigen_signs(V[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(au_sa$Y), Y[, vcount(g) - 1:no + 1])
})

test_that("embed_adjacency_matrix -- Directed, weighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = TRUE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- svd(A)

  U <- standardize_eigen_signs(ss$u)
  V <- standardize_eigen_signs(ss$v)
  X <- standardize_eigen_signs(ss$u %*% sqrt(diag(ss$d)))
  Y <- standardize_eigen_signs(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_la$Y), standardize_eigen_signs(V[, 1:no]))
  expect_equal(standardize_eigen_signs(au_la$X), X[, 1:no])
  expect_equal(standardize_eigen_signs(au_la$Y), Y[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_lm$Y), standardize_eigen_signs(V[, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$X), X[, 1:no])
  expect_equal(standardize_eigen_signs(au_lm$Y), Y[, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(as_sa$Y), standardize_eigen_signs(V[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(au_sa$Y), Y[, vcount(g) - 1:no + 1])
})

test_that("embed_adjacency_matrix -- Issue #50 is resolved", {
  withr::local_seed(12345)

  g <- sample_gnp(15, .4)
  w <- -log(runif(ecount(g)))
  X1 <- embed_adjacency_matrix(g, 2, weights = w)

  E(g)$weight <- w
  X2 <- embed_adjacency_matrix(g, 2)

  expect_equal(X1$D, X2$D)
})

test_that("embed_adjacency_matrix -- Issue #51 is resolved", {
  withr::local_seed(12345)

  pref.matrix <- diag(0.2, 2) + 0.2
  block.sizes <- c(800, 800)
  n <- sum(block.sizes)
  g <- sample_sbm(n, pref.matrix, block.sizes, directed = TRUE)

  for (i in 1:25) {
    ase <- embed_adjacency_matrix(g, 2)
    expect_equal(mean(ase$X %*% t(ase$Y)), 0.299981018354173)
  }
})

test_that("embed_laplacian_matrix -- Undirected, unweighted, D-A case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = FALSE)

  no <- 3
  A <- as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix") - g[]
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(ss$values)))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(ss$values)))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Undirected, unweighted, DAD case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Undirected, unweighted, I-DAD case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- diag(vcount(g)) - D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Undirected, weighted, D-A case works", {
  withr::local_seed(42 * 42)
  g <- sample_gnm(10, 20, directed = FALSE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- as(Matrix::Matrix(diag(strength(g)), doDiag = FALSE), "generalMatrix") - g[]
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(D))))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(D))))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "D-A",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Undirected, unweighted, DAD case works", {
  withr::local_seed(42)

  g <- sample_gnm(10, 20, directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Undirected, unweighted, I-DAD case works", {
  withr::local_seed(42)

  g <- sample_gnm(10, 20, directed = FALSE)

  no <- 3
  D12 <- diag(1 / sqrt(degree(g)))
  A <- diag(vcount(g)) - D12 %*% g[] %*% D12
  ss <- eigen(A)

  D <- ss$values
  U <- ss$vectors
  X <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))
  Y <- standardize_eigen_signs(ss$vectors %*% sqrt(diag(abs(ss$values))))

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
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))

  ## LM

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "I-DAD",
    scaled = FALSE
  )

  expect_equal(au_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, order_by_magnitude(D)][, 1:no]))
  expect_equal(as_lm$D, sort_by_magnitude(D)[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, order_by_magnitude(D)][, 1:no]))

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
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Directed, unweighted, OAP case works", {
  withr::local_seed(42 * 42)

  g <- sample_gnm(10, 30, directed = TRUE)

  no <- 3
  O12 <- diag(1 / sqrt(degree(g, mode = "out")))
  P12 <- diag(1 / sqrt(degree(g, mode = "in")))
  A <- O12 %*% g[] %*% P12
  ss <- svd(A)

  D <- ss$d
  U <- ss$u
  V <- ss$v
  X <- standardize_eigen_signs(ss$u %*% sqrt(diag(ss$d)))
  Y <- standardize_eigen_signs(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(standardize_eigen_signs(au_la$Y), standardize_eigen_signs(Y[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_la$Y), standardize_eigen_signs(V[, 1:no]))

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_lm$D, D[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$Y), standardize_eigen_signs(Y[, 1:no]))
  expect_equal(as_lm$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_lm$Y), standardize_eigen_signs(V[, 1:no]))

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$Y), standardize_eigen_signs(Y[, vcount(g) - 1:no + 1]), tolerance = 1e-6)
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(as_sa$Y), standardize_eigen_signs(V[, vcount(g) - 1:no + 1]))
})

test_that("embed_laplacian_matrix -- Directed, weighted case works", {
  withr::local_seed(42 * 42)

  g <- sample_gnm(10, 30, directed = TRUE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  O12 <- diag(1 / sqrt(strength(g, mode = "out")))
  P12 <- diag(1 / sqrt(strength(g, mode = "in")))
  A <- O12 %*% g[] %*% P12
  ss <- svd(A)

  D <- ss$d
  U <- ss$u
  V <- ss$v
  X <- standardize_eigen_signs(ss$u %*% sqrt(diag(ss$d)))
  Y <- standardize_eigen_signs(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = TRUE
  )
  as_la <- embed_laplacian_matrix(g,
    no = no, which = "la", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(au_la$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(standardize_eigen_signs(au_la$Y), standardize_eigen_signs(Y[, 1:no]))
  expect_equal(as_la$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_la$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_la$Y), standardize_eigen_signs(V[, 1:no]))

  au_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = TRUE
  )
  as_lm <- embed_laplacian_matrix(g,
    no = no, which = "lm", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_lm$D, D[1:no])
  expect_equal(standardize_eigen_signs(au_lm$X), standardize_eigen_signs(X[, 1:no]))
  expect_equal(standardize_eigen_signs(au_lm$Y), standardize_eigen_signs(Y[, 1:no]))
  expect_equal(as_lm$D, D[1:no])
  expect_equal(standardize_eigen_signs(as_lm$X), standardize_eigen_signs(U[, 1:no]))
  expect_equal(standardize_eigen_signs(as_lm$Y), standardize_eigen_signs(V[, 1:no]))

  au_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = TRUE
  )
  as_sa <- embed_laplacian_matrix(g,
    no = no, which = "sa", type = "OAP",
    scaled = FALSE
  )

  expect_equal(au_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(au_sa$X), standardize_eigen_signs(X[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(au_sa$Y), standardize_eigen_signs(Y[, vcount(g) - 1:no + 1]))
  expect_equal(as_sa$D, D[vcount(g) - 1:no + 1])
  expect_equal(standardize_eigen_signs(as_sa$X), standardize_eigen_signs(U[, vcount(g) - 1:no + 1]))
  expect_equal(standardize_eigen_signs(as_sa$Y), standardize_eigen_signs(V[, vcount(g) - 1:no + 1]))
})

test_that("Sampling from a Dirichlet distribution works", {
  withr::local_seed(42)
  samp <- sample_dirichlet(10000, alpha = c(1, 1, 1))
  expect_equal(dim(samp), c(3, 10000))
  expect_equal(colSums(samp), rep(1, 10000))
  expect_equal(rowMeans(samp), rep(1 / 3, 3), tolerance = 1e-2)
  expect_equal(apply(samp, 1, sd), rep(1 / (3 * sqrt(2)), 3), tolerance = 1e-2)

  ## Corner cases
  sd1 <- sample_dirichlet(1, alpha = c(2, 2, 2))
  expect_equal(dim(sd1), c(3, 1))
  sd0 <- sample_dirichlet(0, alpha = c(3, 3, 3))
  expect_equal(dim(sd0), c(3, 0))

  ## Errors
  expect_error(
    sample_dirichlet(-1, alpha = c(1, 1, 1, 1)),
    "should be non-negative"
  )
  expect_error(
    sample_dirichlet(5, alpha = c(1)),
    "must have at least two entries"
  )
  expect_error(sample_dirichlet(5, alpha = c(0, 1, 1)), "must be positive")
  expect_error(sample_dirichlet(5, alpha = c(1, -1, -1)), "must be positive")
})

test_that("Sampling sphere surface works", {
  withr::local_seed(42)
  s1 <- sample_sphere_surface(4, 100, positive = FALSE)
  expect_equal(colSums(s1^2), rep(1, 100))

  s2 <- sample_sphere_surface(3, 100, radius = 2, positive = FALSE)
  expect_equal(sqrt(colSums(s2^2)), rep(2, 100))

  s3 <- sample_sphere_surface(2, 100, radius = 1 / 2, positive = TRUE)
  expect_equal(sqrt(colSums(s3^2)), rep(1 / 2, 100))
  expect_true(all(s3 >= 0))
})

test_that("Sampling sphere volume works", {
  withr::local_seed(42)
  s1 <- sample_sphere_volume(4, 10000, positive = FALSE)
  expect_true(all(colSums(s1^2) < 1))

  s2 <- sample_sphere_volume(3, 100, radius = 2, positive = FALSE)
  expect_true(all(sqrt(colSums(s2^2)) < 2))

  s3 <- sample_sphere_volume(2, 100, radius = 1 / 2, positive = TRUE)
  expect_true(all(sqrt(colSums(s3^2)) < 1 / 2))
  expect_true(all(s3 >= 0))
})
