test_that("cluster_leading_eigen works", {
  withr::local_seed(20230115)

  ## Check-test

  f <- function(membership, community, value, vector, multiplier, extra) {
    M <- sapply(1:length(vector), function(x) {
      v <- rep(0, length(vector))
      v[x] <- 1
      multiplier(v)
    })
    ev <- eigen(M)
    ret <- 0
    expect_equal(ev$values[1], value)
    if (sign(ev$vectors[1, 1]) != sign(vector[1])) {
      ev$vectors <- -ev$vectors
    }
    expect_equal(ev$vectors[, 1], vector)
    0
  }

  g <- make_graph("Zachary")
  lc <- cluster_leading_eigen(g, callback = f)

  expect_equal(lc$modularity, modularity(g, lc$membership))
  expect_equal(
    as.vector(membership(lc)),
    c(1, 3, 3, 3, 1, 1, 1, 3, 2, 2, 1, 1, 3, 3, 2, 2, 1, 3, 2, 3, 2, 3, 2, 4, 4, 4, 2, 4, 4, 2, 2, 4, 2, 2)
  )
  expect_equal(length(lc), 4)
  expect_equal(
    sizes(lc),
    structure(c(7L, 12L, 9L, 6L), .Dim = 4L, .Dimnames = structure(list(`Community sizes` = c("1", "2", "3", "4")), .Names = "Community sizes"), class = "table")
  )

  ## Check that the modularity matrix is correct

  f <- function(membership, community, value, vector, multiplier, extra) {
    M <- sapply(1:length(vector), function(x) {
      v <- rep(0, length(vector))
      v[x] <- 1
      multiplier(v)
    })
    myc <- membership == community
    B <- A[myc, myc] - (deg[myc] %*% t(deg[myc])) / 2 / ec
    BG <- B - diag(rowSums(B))

    expect_equal(M, BG)
    0
  }

  g <- make_graph("Zachary")
  A <- as_adjacency_matrix(g, sparse = FALSE)
  ec <- ecount(g)
  deg <- degree(g)
  lc <- cluster_leading_eigen(g, callback = f)

  ## Stress-test. We skip this on R 3.4 and 3.5 because it seems like
  ## the results are not entirely deterministic there.
  skip_if(getRversion() < "3.6")

  for (i in 1:100) {
    g <- sample_gnm(20, sample(5:40, 1))
    lec1 <- cluster_leading_eigen(g)
    lec2 <- cluster_leading_eigen(g)
    expect_equal(
      as.vector(membership(lec1)),
      as.vector(membership(lec2))
    )
  }
})
