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

test_that("Undirected, unweighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 15, directed = FALSE)

  no <- 7
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- eigen(A)

  U <- std(ss$vectors)
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

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
  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(std(au_la$X), X[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_lm$D, mag_sort(ss$values)[1:no])
  expect_equal(au_lm$D, mag_sort(ss$values)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(ss$values)][, 1:no]))
  expect_equal(std(au_lm$X), X[, mag_order(ss$values)][, 1:no])

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
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$X), X[, vcount(g) - 1:no + 1])
})

test_that("Undirected, weighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = FALSE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- eigen(A)

  U <- std(ss$vectors)
  X <- std(ss$vectors %*% sqrt(diag(abs(ss$values))))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_la$D, ss$values[1:no])
  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(au_la$D, ss$values[1:no])
  expect_equal(std(au_la$X), X[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(as_lm$D, mag_sort(ss$values)[1:no])
  expect_equal(au_lm$D, mag_sort(ss$values)[1:no])
  expect_equal(std(as_lm$X), std(U[, mag_order(ss$values)][, 1:no]))
  expect_equal(std(au_lm$X), X[, mag_order(ss$values)][, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$X), X[, vcount(g) - 1:no + 1])
})

test_that("Directed, unweighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- svd(A)

  U <- std(ss$u)
  V <- std(ss$v)
  X <- std(ss$u %*% sqrt(diag(ss$d)))
  Y <- std(ss$v %*% sqrt(diag(ss$d)))

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
  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(std(as_la$Y), std(V[, 1:no]))
  expect_equal(std(au_la$X), X[, 1:no])
  expect_equal(std(au_la$Y), Y[, 1:no])

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
  expect_equal(std(as_lm$X), std(U[, 1:no]))
  expect_equal(std(as_lm$Y), std(V[, 1:no]))
  expect_equal(std(au_lm$X), X[, 1:no])
  expect_equal(std(au_lm$Y), Y[, 1:no])

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
  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(as_sa$Y), std(V[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$Y), Y[, vcount(g) - 1:no + 1])
})

test_that("Directed, weighted case works", {
  withr::local_seed(42)
  g <- sample_gnm(10, 20, directed = TRUE)
  E(g)$weight <- sample(1:5, ecount(g), replace = TRUE)

  no <- 3
  A <- g[]
  A <- A + 1 / 2 * as(Matrix::Matrix(diag(degree(g)), doDiag = FALSE), "generalMatrix")
  ss <- svd(A)

  U <- std(ss$u)
  V <- std(ss$v)
  X <- std(ss$u %*% sqrt(diag(ss$d)))
  Y <- std(ss$v %*% sqrt(diag(ss$d)))

  au_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_la <- embed_adjacency_matrix(g,
    no = no, which = "la",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(std(as_la$X), std(U[, 1:no]))
  expect_equal(std(as_la$Y), std(V[, 1:no]))
  expect_equal(std(au_la$X), X[, 1:no])
  expect_equal(std(au_la$Y), Y[, 1:no])

  au_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_lm <- embed_adjacency_matrix(g,
    no = no, which = "lm",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(std(as_lm$X), std(U[, 1:no]))
  expect_equal(std(as_lm$Y), std(V[, 1:no]))
  expect_equal(std(au_lm$X), X[, 1:no])
  expect_equal(std(au_lm$Y), Y[, 1:no])

  au_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = TRUE
  )
  as_sa <- embed_adjacency_matrix(g,
    no = no, which = "sa",
    cvec = degree(g) / 2, scaled = FALSE
  )

  expect_equal(std(as_sa$X), std(U[, vcount(g) - 1:no + 1]))
  expect_equal(std(as_sa$Y), std(V[, vcount(g) - 1:no + 1]))
  expect_equal(std(au_sa$X), X[, vcount(g) - 1:no + 1])
  expect_equal(std(au_sa$Y), Y[, vcount(g) - 1:no + 1])
})

test_that("Issue #50 is resolved", {
  withr::local_seed(12345)

  g <- sample_gnp(15, .4)
  w <- -log(runif(ecount(g)))
  X1 <- embed_adjacency_matrix(g, 2, weights = w)

  E(g)$weight <- w
  X2 <- embed_adjacency_matrix(g, 2)

  expect_equal(X1$D, X2$D)
})

test_that("Issue #51 is resolved", {
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
